﻿using System.Collections.Generic;
using System.Web.Razor;
using RazorPad.Compilation;
using RazorPad.DynamicModel;

namespace RazorPad.Website.Models
{
    public class SaveRequest : ParseRequest
    {
        public string Model { get; set; }

        public TemplateLanguage Language { get; set; }

        public RazorCodeLanguage RazorLanguage
        {
            get
            {
                switch (Language)
                {
                    case(TemplateLanguage.VisualBasic):
                        return new VBRazorCodeLanguage();
                    default:
                        return new CSharpRazorCodeLanguage();
                }
            }
            set { }
        }

        public string FiddleId { get; set; }
    }

    
}