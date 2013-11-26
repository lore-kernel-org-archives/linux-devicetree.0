From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] checkpatch: add DT compatible string documentation check
Date: Tue, 26 Nov 2013 08:43:45 -0800
Message-ID: <1385484225.20100.58.camel@joe-AO722>
References: <1385481675-26675-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385481675-26675-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2013-11-26 at 10:01 -0600, Rob Herring wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Hi Rob.

> This adds a simple check that any compatible strings in DeviceTree dts
> files are present in Documentation/devicetree/bindings. This should be a
> temporary check until we have more sophisticated binding schema checking.
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -2034,6 +2034,21 @@ sub process {
>  			     "Use of $flag is deprecated, please use \`$replacement->{$flag} instead.\n" . $herecurr) if ($replacement->{$flag});
>  		}
>  
> +# check for compatible documentation
> +		if ($realfile =~ /\.dts/ && $rawline =~ /\+\s*compatible\s*=/) {
> +			my @compats = $rawline =~ /\"([a-zA-Z0-9\-\,]+)\"/g;

I believe there needs to be a \+\. in the brackets
for lines like:

arch/c6x/boot/dts/tms320c6678.dtsi: compatible = "ti,c64x+timer64";
and
arch/powerpc/boot/dts/mpc8313erdb.dts: compatible = "fsl,sec2.2", "fsl,sec2.1",

> +
> +			foreach my $compat (@compats) {
> +				my $compat2 = $compat;
> +				$compat2 =~ s/\,[a-z]*\-/\,<\.\*>\-/;
> +				`egrep -rq "$compat|$compat2" "Documentation/devicetree/bindings/"`;

Perhaps the egrep should be grep -E

> +				if ( $? >> 8 ) {
> +					WARN("UNDOCUMENTED_DT_BINDING",
> +					     "DT compatible string \"$compat\" appears un-documented -- check Documentation/devicetree/bindings/\n" . $herecurr);
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
