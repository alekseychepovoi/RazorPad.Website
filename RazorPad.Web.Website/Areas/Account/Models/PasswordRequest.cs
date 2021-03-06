using System.ComponentModel.DataAnnotations;
using RazorPad.Web.Authentication;
using RazorPad.Web.Util;

namespace RazorPad.Web.Website.Areas.Account.Models
{
    public class PasswordRequest : CredentialRequest
    {
        [Required]
        [StringLength(50, MinimumLength = 5)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [MatchesProperty("Password")]
        [Display(Name = "Confirm Password")]
        public string PasswordConfirm { get; set; }

        public override Credential ToCredential()
        {
            return FormsAuthCredential.Create(Password);
        }
    }
}