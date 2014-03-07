From: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
Subject: Re: [PATCH v3 3/4] checkpatch: check compatible strings in .c and
 .h too
Date: Fri, 07 Mar 2014 14:29:46 +0100
Message-ID: <5319C9CA.1080604@epfl.ch>
References: <1394198771-25913-1-git-send-email-florian.vaussard@epfl.ch> <1394198771-25913-4-git-send-email-florian.vaussard@epfl.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394198771-25913-4-git-send-email-florian.vaussard-p8DiymsW2f8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 03/07/2014 02:26 PM, Florian Vaussard wrote:
> From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
> 
> From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
> 

Mmmh, sorry for this. I will resend.

> Look for ".compatible = "foo" strings not only in .dts files, but
> in .c and .h too.
> 
> Signed-off-by: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
> [florian.vaussard-p8DiymsW2f8@public.gmane.org: split patch, commit log]
> Signed-off-by: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
> ---
>  scripts/checkpatch.pl | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 96f10ba..9205153 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2041,8 +2041,10 @@ sub process {
>  		}
>  
>  # check for DT compatible documentation
> -		if (defined $root && $realfile =~ /\.dts/ &&
> -		    $rawline =~ /^\+\s*compatible\s*=/) {
> +		if (defined $root &&
> +			(($realfile =~ /\.dtsi?$/ && $line =~ /^\+\s*compatible\s*=\s*\"/) ||
> +			 ($realfile =~ /\.[ch]$/ && $line =~ /^\+.*\.compatible\s*=\s*\"/))) {
> +
>  			my @compats = $rawline =~ /\"([a-zA-Z0-9\-\,\.\+_]+)\"/g;
>  
>  			foreach my $compat (@compats) {
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
