From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2] checkpatch: add DT compatible string documentation
 checks
Date: Tue, 03 Dec 2013 22:24:51 -0800
Message-ID: <1386138291.30493.45.camel@joe-AO722>
References: <1386130643-19449-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386130643-19449-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2013-12-03 at 22:17 -0600, Rob Herring wrote:
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
> ---
> v2:
> - Add vendor string checking against vendor-prefixes.txt
> - Add '_', '.' and '+' as valid compatible string characters
> - Use 'grep -E' instead of egrep

Some more trivial notes:

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -2034,6 +2034,29 @@ sub process {
>  			     "Use of $flag is deprecated, please use \`$replacement->{$flag} instead.\n" . $herecurr) if ($replacement->{$flag});
>  		}
>  
> +# check for DT compatible documentation
> +		if ($realfile =~ /\.dts/ && $rawline =~ /\+\s*compatible\s*=/) {

this should probably be $rawline =~ /^\+\s*compatible...

> +			my @compats = $rawline =~ /\"([a-zA-Z0-9\-\,\.\+_]+)\"/g;
> +
> +			foreach my $compat (@compats) {
> +				my $compat2 = $compat;
> +				my $dt_path = "Documentation/devicetree/bindings/";
> +				$compat2 =~ s/\,[a-z]*\-/\,<\.\*>\-/;
> +				`grep -Erq "$compat|$compat2" $dt_path`;
> +				if ( $? >> 8 ) {
> +					WARN("UNDOCUMENTED_DT_BINDING",
> +					     "DT compatible string \"$compat\" appears un-documented -- check $dt_path\n" . $herecurr);
> +				}
> +				my $vendor = $compat;
> +				$vendor =~ s/^([a-zA-Z0-9]+)\,.*/$1/;
> +				`grep -Eq "$vendor" "${dt_path}vendor-prefixes.txt"`;

It maybe simpler to read as:

	my $vendor_path = $dt_path . "vendor-prefixes.txt";
	`grep -Eq $vendor $vendor_path`;

> +				if ( $? >> 8 ) {
> +					WARN("UNDOCUMENTED_DT_VENDOR",
> +					     "DT compatible string vendor \"$vendor\" appears un-documented -- check ${dt_path}vendor-prefixes.txt\n" . $herecurr);

					     "DT compatible string vendor \"$vendor\" appears un-documented -- check $vendor_path\n" . $herecurr)

Also I suggest using the same message type
instead of 2 distinct ones.

Maybe "UNDOCUMENTED_DT_STRING"

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
