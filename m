From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] checkpatch: fix spurious vendor compatible warnings
Date: Thu, 27 Feb 2014 12:10:08 -0800
Message-ID: <1393531808.24588.119.camel@joe-AO722>
References: <1393531019-25134-1-git-send-email-florian.vaussard@epfl.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393531019-25134-1-git-send-email-florian.vaussard-p8DiymsW2f8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
Cc: Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2014-02-27 at 20:56 +0100, Florian Vaussard wrote:
> With a compatible string like
> 
> compatible = "foo";
> 
> checkpatch will currently try to find "foo" in  vendor-prefixes.txt,
> which is wrong since the vendor prefix is empty in this specific case.
> 
> Skip the vendor test if the compatible is not like
> 
> compatible = "vendor,something";
> 
> Signed-off-by: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
> ---
>  scripts/checkpatch.pl | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 464dcef..35ec185 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2058,6 +2058,7 @@ sub process {
>  				my $vendor = $compat;
>  				my $vendor_path = $dt_path . "vendor-prefixes.txt";
>  				next if (! -f $vendor_path);
> +				next if not $vendor =~ /^[a-zA-Z0-9]+\,.*/;
>  				$vendor =~ s/^([a-zA-Z0-9]+)\,.*/$1/;
>  				`grep -Eq "$vendor" $vendor_path`;
>  				if ( $? >> 8 ) {

Some vendor names have dashes.
I don't know if underscores are allowed.

$ grep -rP --include=*.[ch] -oh "compatible\s*=\s*\"[^,]+,\w" * | \
  sed -r -e 's/\s//g' -e 's/,.$//' | sort | uniq -c | grep "[_-]"
      1 compatible="active-semi
      8 compatible="asahi-kasei


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
