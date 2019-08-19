Return-Path: <SRS0=7MX9=WP=gmail.com=frowand.list@kernel.org>
Subject: Re: [PATCH v2] scripts/dtc: dtx_diff - add color output support
References: <20190814091832.12707-1-geert+renesas@glider.be>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <ac9e99c9-1f31-16c0-c7d9-e9206a7bde34@gmail.com>
Date: Sun, 18 Aug 2019 18:21:13 -0700
MIME-Version: 1.0
In-Reply-To: <20190814091832.12707-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 8/14/19 2:18 AM, Geert Uytterhoeven wrote:
> Add new -c/--color options, to enhance the diff output with color, and
> improve the user's experience.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Document that -c/--color requires a diff command with color support,
>   - Ignore -c/--color if diff command lacks color support.
> ---
>  scripts/dtc/dtx_diff | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/dtc/dtx_diff b/scripts/dtc/dtx_diff
> index e9ad7834a22d9459..d3422ee15e300bc7 100755
> --- a/scripts/dtc/dtx_diff
> +++ b/scripts/dtc/dtx_diff
> @@ -20,6 +20,8 @@ Usage:
>  
>  
>        --annotate    synonym for -T
> +      --color       synonym for -c (requires diff with --color support)
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
> @@ -189,6 +192,13 @@ while [ $# -gt 0 ] ; do
>  
>  	case $1 in
>  
> +	-c | --color )
> +		if diff --color /dev/null /dev/null 2>/dev/null ; then
> +			diff_color="--color=always"
> +		fi
> +		shift
> +		;;
> +
>  	-f )
>  		diff_flags="--unified=999999"
>  		shift
> @@ -344,7 +354,7 @@ DTC="\
>  
>  if (( ${cmd_diff} )) ; then
>  
> -	diff ${diff_flags} --label "${dtx_file_1}" --label "${dtx_file_2}" \
> +	diff ${diff_flags} ${diff_color} --label "${dtx_file_1}" --label "${dtx_file_2}" \
>  		<(compile_to_dts "${dtx_file_1}" "${dtx_path_1_dtc_include}") \
>  		<(compile_to_dts "${dtx_file_2}" "${dtx_path_2_dtc_include}")
>  
> 

Thanks Geert.


Reviewed-by: Frank Rowand <frank.rowand@sony.com>

Tested-by: Frank Rowand <frank.rowand@sony.com>

Tested on a system where diff does not have the --color option.
Tested on a system where diff does have the --color option.
