﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using TxHumor.Common;
using TxHumor.Config;

namespace TxHumor.DAL
{
    public class dal_Comment
    {
        public static DataTable GetCommentByHumorId(int humorId)
        {
            DataTable dt = SqlHelper.ExecuteDataset(DbConfig.GetDb("Humor"), CommandType.StoredProcedure, "GetCommentByHumorId",
               new SqlParameter[] { new SqlParameter("@HumorId", humorId) }).Tables[0];
            return dt;
        }

        public static DataTable GetCommentById(int id)
        {
            DataTable dt = SqlHelper.ExecuteDataset(DbConfig.GetDb("Humor"), CommandType.StoredProcedure, "GetCommentInfoById",
               new SqlParameter[] { new SqlParameter("@Id", id) }).Tables[0];
            return dt;
        }

        public static DataTable GetCommentByIds(string ids)
        {
            DataTable dt = SqlHelper.ExecuteDataset(DbConfig.GetDb("Humor"), CommandType.StoredProcedure, "GetCommentInfoByIds",
              new SqlParameter[] { new SqlParameter("@Ids", ids) }).Tables[0];
            return dt;
        }


        /// <summary>
        /// 获取评论列表
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="startTime"></param>
        /// <param name="recordCount"></param>
        /// <returns></returns>
        public static DataTable GetComments(int pageIndex, int pageSize, out int recordCount)
        {
            SqlParameter[] prams = {
                                      new SqlParameter("@PageIndex", pageIndex),
                                      new SqlParameter("@PageSize", pageSize),                                    
                                      new SqlParameter("@RecordCount", SqlDbType.Int, 3, ParameterDirection.Output, false, 0, 0, string.Empty, DataRowVersion.Default, null)
                                   };
            DataTable dt = SqlHelper.ExecuteDataset(DbConfig.GetDb("Humor")
                , CommandType.StoredProcedure
                , "GetComments"
                , prams).Tables[0];
            recordCount = Convert.ToInt32(prams[prams.Length - 1].Value);
            return dt;
        }
    }
}
