From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] checkpatch.pl: Update DT vendor prefix check
Date: Wed, 22 May 2019 10:16:41 -0700
Message-ID: <2b4878de1404e71d3085ee4832a5abc3526f2cdf.camel@perches.com>
References: <20190522151238.25176-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190522151238.25176-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2019-05-22 at 10:12 -0500, Rob Herring wrote:
> In commit 8122de54602e ("dt-bindings: Convert vendor prefixes to
> json-schema"), vendor-prefixes.txt has been converted to a DT schema.
> Update the checkpatch.pl DT check to extract vendor prefixes from the new
> vendor-prefixes.yaml file.
> 
> Fixes: 8122de54602e ("dt-bindings: Convert vendor prefixes to json-schema")
> Cc: Joe Perches <joe@perches.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  scripts/checkpatch.pl | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index bb28b178d929..073051a4471b 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3027,7 +3027,7 @@ sub process {
>  			my @compats = $rawline =~ /\"([a-zA-Z0-9\-\,\.\+_]+)\"/g;
>  
>  			my $dt_path = $root . "/Documentation/devicetree/bindings/";
> -			my $vp_file = $dt_path . "vendor-prefixes.txt";
> +			my $vp_file = $dt_path . "vendor-prefixes.yaml";
>  
>  			foreach my $compat (@compats) {
>  				my $compat2 = $compat;
> @@ -3042,7 +3042,7 @@ sub process {
>  
>  				next if $compat !~ /^([a-zA-Z0-9\-]+)\,/;
>  				my $vendor = $1;
> -				`grep -Eq "^$vendor\\b" $vp_file`;
> +				`grep -oE "\\"\\^[a-zA-Z0-9]+" $vp_file | grep -q "$vendor"`;

I think this does't work well as it loses the -
in various vendor prefixes:

  "^active-semi,.*":
  "^asahi-kasei,.*":
  "^ebs-systart,.*":
  "^inside-secure,.*":
  "^multi-inno,.*":
  "^netron-dy,.*":
  "^si-en,.*":
  "^si-linux,.*":
  "^tbs-biometrics,.*":
  "^u-blox,.*":
  "^x-powers,.*":

Perhaps the grep should be something like: (untested)

	`grep -Eq "\\"\\^\Q$vendor\E,\\.\\*\\":" $vp_file`;
