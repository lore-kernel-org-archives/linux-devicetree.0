Return-Path: <SRS0=+MSi=V4=gmail.com=frowand.list@kernel.org>
Subject: Re: [PATCH] scripts/dtc: dtx_diff - make help text formatting
 consistent
References: <20190731123548.13787-1-geert+renesas@glider.be>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <d1e4277e-505c-9cd5-b26c-4c307504f7c4@gmail.com>
Date: Wed, 31 Jul 2019 12:20:59 -0700
MIME-Version: 1.0
In-Reply-To: <20190731123548.13787-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 7/31/19 5:35 AM, Geert Uytterhoeven wrote:
> None of the help texts use capitalization, except the one for the -T
> option.  Drop the capitalization for consistency.
> Split the single long line that doesn't fit in 80 characters.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  scripts/dtc/dtx_diff | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/dtc/dtx_diff b/scripts/dtc/dtx_diff
> index 00fd4738a5877948..e9ad7834a22d9459 100755
> --- a/scripts/dtc/dtx_diff
> +++ b/scripts/dtc/dtx_diff
> @@ -27,7 +27,8 @@ Usage:
>         -s SRCTREE   linux kernel source tree is at path SRCTREE
>                          (default is current directory)
>         -S           linux kernel source tree is at root of current git repo
> -       -T           Annotate output .dts with input source file and line (-T -T for more details)
> +       -T           annotate output .dts with input source file and line
> +                        (-T -T for more details)
>         -u           unsorted, do not sort DTx
>  
>  
> 

Thanks Geert!

Reviewed-by: Frank Rowand <frowand.list@gmail.com>
