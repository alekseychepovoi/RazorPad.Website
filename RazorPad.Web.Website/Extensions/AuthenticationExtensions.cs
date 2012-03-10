﻿using System.Web;
using System.Web.Mvc;

namespace RazorPad.Web.Website.Extensions
{
    public static class AuthenticationExtensions
    {

        public static string Login(this UrlHelper url, string redirectUrl = null)
        {
            if (redirectUrl == null)
                redirectUrl = HttpUtility.UrlEncode(url.RequestContext.HttpContext.Request.RawUrl);

            return url.Action("Login", "FormsAuth", new { area = "Account", redirectUrl });
        }

        public static string Logout(this UrlHelper url, string redirectUrl = null)
        {
            if (redirectUrl == null)
                redirectUrl = HttpUtility.UrlEncode(url.RequestContext.HttpContext.Request.RawUrl);

            return url.Action("Logout", "FormsAuth", new { area = "Account", redirectUrl });
        }

    }
}