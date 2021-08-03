using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    public class EmployeeController : ApiController
    {
        private string CS = ConfigurationManager.ConnectionStrings["EmployeeAppDB"].ConnectionString;



        public HttpResponseMessage Get()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("spGetEmployee", con);
                    SqlDataAdapter sd = new SqlDataAdapter(cmd);
                    DataTable table = new DataTable();

                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    sd.Fill(table);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    return Request.CreateResponse(HttpStatusCode.OK, table);
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Can't get the info\nMessage: " + ex.Message);
            }
        }



        public string Post(Employee emp)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("spPostEmployee", con);
                    SqlDataAdapter sd = new SqlDataAdapter(cmd);


                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    sd.SelectCommand.Parameters.AddWithValue("@EmployeeName", emp.EmployeeName);
                    sd.SelectCommand.Parameters.AddWithValue("@Department", emp.Department);
                    sd.SelectCommand.Parameters.AddWithValue("@DateOfJoining", emp.DateOfJoining);
                    sd.SelectCommand.Parameters.AddWithValue("@PhotoFileName", emp.PhotoFileName);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    return "Added Successfully!!";
                }
            }
            catch (Exception ex)
            {
                return "Failed to Add!!\nMessage: " + ex.Message;
            }
        }



        public string Put(Employee emp)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("spPutEmployee", con);
                    SqlDataAdapter sd = new SqlDataAdapter(cmd);


                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    sd.SelectCommand.Parameters.AddWithValue("@EmployeeId", emp.EmployeeId);
                    sd.SelectCommand.Parameters.AddWithValue("@EmployeeName", emp.EmployeeName);
                    sd.SelectCommand.Parameters.AddWithValue("@Department", emp.Department);
                    sd.SelectCommand.Parameters.AddWithValue("@DateOfJoining", emp.DateOfJoining);
                    sd.SelectCommand.Parameters.AddWithValue("@PhotoFileName", emp.PhotoFileName);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    return "Updated Successfully!!";
                }
            }
            catch (Exception ex)
            {
                return "Failed to Update!!\nMessage: " + ex.Message;
            }
        }



        public string Delete(int id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("spDeleteEmployee", con);
                    SqlDataAdapter sd = new SqlDataAdapter(cmd);


                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    sd.SelectCommand.Parameters.AddWithValue("@EmployeeId", id);


                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    return "Deleted Successfully!!";
                }
            }
            catch (Exception ex)
            {
                return "Failed to Delete!!\nMessage: " + ex.Message;
            }
        }



        [Route("api/Employee/GetAllDepartmentNames")]
        [HttpGet]
        public HttpResponseMessage GetAllDepartmentNames()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("spGetAllDepartmentNames", con);
                    SqlDataAdapter sd = new SqlDataAdapter(cmd);
                    DataTable table = new DataTable();

                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    sd.Fill(table);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    return Request.CreateResponse(HttpStatusCode.OK, table);
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Can't get the info\nMessage: " + ex.Message);
            }
        }
    }
}
