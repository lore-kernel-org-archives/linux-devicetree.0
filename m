From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] checkpatch.pl: Add SPDX license tag check for dts files
 and headers
Date: Thu, 23 Feb 2017 09:51:14 -0800
Message-ID: <1487872274.14159.36.camel@perches.com>
References: <20170223155644.24213-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170223155644.24213-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>
List-Id: devicetree@vger.kernel.org

On Thu, 2017-02-23 at 09:56 -0600, Rob Herring wrote:
> Add a check for using SPDX-License-Identifier tags to define the license of
> .dts{i} and DT header files rather than using free form license text. This
> check looks for GPL, BSD, or X11(really incorrectly labeled MIT license)
> license text which are the commonly used DT licenses.

Hi Rob.

> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Andy Whitcroft <apw@canonical.com>
> Cc: Joe Perches <joe@perches.com>
> ---
>  scripts/checkpatch.pl | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 982c52ca6473..ce802b3146e3 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2139,6 +2139,7 @@ sub process {
>  	my $commit_log_has_diff = 0;
>  	my $reported_maintainer_file = 0;
>  	my $non_utf8_charset = 0;
> +	my $licensefile = '';

Maybe this should be $spdx_license_file
but what's the actual reason to check if
multiple license bits are in a single file?

> +# check for using SPDX tag instead of free form license text in dts and binding header files
> +		if ($licensefile ne $realfile &&
> +		    ($realfile =~ /\.dtsi?$/ || $realfile =~ /dt-bindings\/.*\.h$/) &&

It's nicer to use a non / leading char like @
so you don't have to escape the /.

maybe
	$realfile =~ m@/dt-bindings/.*\.h$@

> +		    $rawline !~ /\bSPDX-License-Identifier/ &&
> +		    ($rawline =~ /^\+.*\bGeneral\s+Public\s+License/i ||
> +		    $rawline =~ /^\+.*\bTHE\s+SOFTWARE\s+IS\s+PROVIDED\s+\"AS\s+IS\"/i ||
> +		    $rawline =~ /^\+.*\b(GPL|BSD|X11)/)) {

nicer to indent these last 2 lines one more space
to keep alignment to open parenthesis.

> +			$licensefile = $realfile;
> +			WARN("SPDX_LICENSE_TAG",
> +			     "Use SPDX-License-Identifier tags instead of full license text\n" . $herecurr);
> +		}
> +
>  # check we are in a valid source file if not then ignore this hunk
>  		next if ($realfile !~ /\.(h|c|s|S|sh|dtsi|dts)$/);
