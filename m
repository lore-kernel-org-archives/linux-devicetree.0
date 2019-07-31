Return-Path: <SRS0=+MSi=V4=gmail.com=frowand.list@kernel.org>
Subject: Re: [PATCH] scripts/dtc: dtx_diff - add color output support
References: <20190731123741.13947-1-geert+renesas@glider.be>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <342e5e38-f980-c849-c061-8dad42bc0850@gmail.com>
Date: Wed, 31 Jul 2019 13:30:13 -0700
MIME-Version: 1.0
In-Reply-To: <20190731123741.13947-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Geert,

On 7/31/19 5:37 AM, Geert Uytterhoeven wrote:
> Add new -c/--color options, to enhance the diff output with color, and
> improve the user's experience.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  scripts/dtc/dtx_diff | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/dtc/dtx_diff b/scripts/dtc/dtx_diff
> index e9ad7834a22d9459..4e2c8617f69a333e 100755
> --- a/scripts/dtc/dtx_diff
> +++ b/scripts/dtc/dtx_diff
> @@ -20,6 +20,8 @@ Usage:
>  
>  
>        --annotate    synonym for -T
> +      --color       synonym for -c
> +       -c           enable colored output
>         -f           print full dts in diff (--unified=99999)
>         -h           synonym for --help
>         -help        synonym for --help
> @@ -178,6 +180,7 @@ compile_to_dts() {
>  annotate=""
>  cmd_diff=0
>  diff_flags="-u"
> +diff_color=""
>  dtx_file_1=""
>  dtx_file_2=""
>  dtc_sort="-s"
> @@ -189,6 +192,11 @@ while [ $# -gt 0 ] ; do
>  
>  	case $1 in
>  
> +	-c | --color )
> +		diff_color="--color=always"
> +		shift
> +		;;
> +
>  	-f )
>  		diff_flags="--unified=999999"
>  		shift
> @@ -344,7 +352,7 @@ DTC="\
>  
>  if (( ${cmd_diff} )) ; then
>  
> -	diff ${diff_flags} --label "${dtx_file_1}" --label "${dtx_file_2}" \
> +	diff ${diff_flags} ${diff_color} --label "${dtx_file_1}" --label "${dtx_file_2}" \
>  		<(compile_to_dts "${dtx_file_1}" "${dtx_path_1_dtc_include}") \
>  		<(compile_to_dts "${dtx_file_2}" "${dtx_path_2_dtc_include}")
>  
> 

I like the idea, but...

I have various linux distro releases across my many systems, but only one is
new enough to have the diff command that supports --color.

Can you enhance this patch to test whether --color is supported?  Maybe
something like (untested):

	-c | --color )
		if `diff --color <(echo a) <(echo a) 2>/dev/null` ; then
			diff_color="--color=always"
		fi
		shift
		;;

Then add some text to the usage for -c and --color saying that they will
be silently ignored if diff does not support --color.

I first wrote up a suggested version that printed an error message and
exited, but I think silently ignoring is more robust, even though it
may be more confusing to someone who is wondering why --color does not
work.

Thanks,

Frank
