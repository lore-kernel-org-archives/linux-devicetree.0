From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3] checkpatch: add DT compatible string documentation
 checks
Date: Wed, 04 Dec 2013 08:12:43 -0800
Message-ID: <1386173563.30493.72.camel@joe-AO722>
References: <1386173031-17867-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386173031-17867-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2013-12-04 at 10:03 -0600, Rob Herring wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> This adds a simple check that any compatible strings in DeviceTree dts
> files are present in Documentation/devicetree/bindings. Vendor prefixes
> are also checked for existing in vendor-prefixes.txt These should be
> temporary checks until we have more sophisticated binding schema checking.
> 
> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>

Signed-off-by: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>

> ---
> v3:
> - Use a single message type UNDOCUMENTED_DT_STRING
> - Ensure '+' is at beginning of the line
> - Move vendor-prefixes.txt to variable
> 
> v2:
> - Add vendor string checking against vendor-prefixes.txt
> - Add '_', '.' and '+' as valid compatible string characters
> - Use 'grep -E' instead of egrep
> 
>  scripts/checkpatch.pl | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 9c98100..3696366 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2034,6 +2034,31 @@ sub process {
>  			     "Use of $flag is deprecated, please use \`$replacement->{$flag} instead.\n" . $herecurr) if ($replacement->{$flag});
>  		}
>  
> +# check for DT compatible documentation
> +		if ($realfile =~ /\.dts/ && $rawline =~ /^\+\s*compatible\s*=/) {
> +			my @compats = $rawline =~ /\"([a-zA-Z0-9\-\,\.\+_]+)\"/g;
> +
> +			foreach my $compat (@compats) {
> +				my $compat2 = $compat;
> +				my $dt_path = "Documentation/devicetree/bindings/";
> +				$compat2 =~ s/\,[a-z]*\-/\,<\.\*>\-/;
> +				`grep -Erq "$compat|$compat2" $dt_path`;
> +				if ( $? >> 8 ) {
> +					WARN("UNDOCUMENTED_DT_STRING",
> +					     "DT compatible string \"$compat\" appears un-documented -- check $dt_path\n" . $herecurr);
> +				}
> +
> +				my $vendor = $compat;
> +				my $vendor_path = $dt_path . "vendor-prefixes.txt";
> +				$vendor =~ s/^([a-zA-Z0-9]+)\,.*/$1/;
> +				`grep -Eq "$vendor" $vendor_path`;
> +				if ( $? >> 8 ) {
> +					WARN("UNDOCUMENTED_DT_STRING",
> +					     "DT compatible string vendor \"$vendor\" appears un-documented -- check $vendor_path\n" . $herecurr);
> +				}
> +			}
> +		}
> +
>  # check we are in a valid source file if not then ignore this hunk
>  		next if ($realfile !~ /\.(h|c|s|S|pl|sh)$/);
>  



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
