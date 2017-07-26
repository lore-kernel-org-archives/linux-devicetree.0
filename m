From: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 2/2] tests: Add stacked overlay tests on fdtoverlay
Date: Tue, 25 Jul 2017 20:27:30 -0500
Message-ID: <7a01c25e-82a9-9b31-5b61-1c2d2940e740@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 07/25/2017 12:24 PM, Pantelis Antoniou wrote:
> Add a stacked overlay unit test, piggybacking on fdtoverlay.
> 
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  tests/run_tests.sh             | 15 +++++++++++++++
>  tests/stacked_overlay_bar.dts  | 13 +++++++++++++
>  tests/stacked_overlay_base.dts |  6 ++++++
>  tests/stacked_overlay_baz.dts  | 13 +++++++++++++
>  4 files changed, 47 insertions(+)
>  create mode 100644 tests/stacked_overlay_bar.dts
>  create mode 100644 tests/stacked_overlay_base.dts
>  create mode 100644 tests/stacked_overlay_baz.dts
> 
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index b8a2825..9e3d35d 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -791,6 +791,21 @@ fdtoverlay_tests() {
>  
>      # test that the new property is installed
>      run_fdtoverlay_test foobar "/test-node" "test-str-property" "-ts" ${basedtb} ${targetdtb} ${overlaydtb}
> +
> +    stacked_base=stacked_overlay_base.dts
> +    stacked_basedtb=stacked_overlay_base.fdtoverlay.test.dtb
> +    stacked_bar=stacked_overlay_bar.dts
> +    stacked_bardtb=stacked_overlay_bar.fdtoverlay.test.dtb
> +    stacked_baz=stacked_overlay_baz.dts
> +    stacked_bazdtb=stacked_overlay_baz.fdtoverlay.test.dtb
> +    stacked_targetdtb=stacked_overlay_target.fdoverlay.test.dtb
> +
> +    run_dtc_test -@ -I dts -O dtb -o $stacked_basedtb $stacked_base
> +    run_dtc_test -@ -I dts -O dtb -o $stacked_bardtb $stacked_bar
> +    run_dtc_test -@ -I dts -O dtb -o $stacked_bazdtb $stacked_baz
> +
> +    # test that baz correctly inserted the property
> +    run_fdtoverlay_test baz "/foonode/barnode/baznode" "baz-property" "-ts" ${stacked_basedtb} ${stacked_targetdtb} ${stacked_bardtb} ${stacked_bazdtb}
>  }
>  
>  pylibfdt_tests () {
> diff --git a/tests/stacked_overlay_bar.dts b/tests/stacked_overlay_bar.dts
> new file mode 100644
> index 0000000..c646399
> --- /dev/null
> +++ b/tests/stacked_overlay_bar.dts
> @@ -0,0 +1,13 @@
> +/dts-v1/;
> +/plugin/;
> +/ {
> +	fragment@1 {
> +		target = <&foo>;
> +		__overlay__ {
> +			overlay-1-property;
> +			bar: barnode {
> +				bar-property = "bar";
> +			};
> +		};
> +	};
> +};
> diff --git a/tests/stacked_overlay_base.dts b/tests/stacked_overlay_base.dts
> new file mode 100644
> index 0000000..2916423
> --- /dev/null
> +++ b/tests/stacked_overlay_base.dts
> @@ -0,0 +1,6 @@
> +/dts-v1/;
> +/ {
> +	foo: foonode {
> +		foo-property = "foo";
> +	};
> +};
> diff --git a/tests/stacked_overlay_baz.dts b/tests/stacked_overlay_baz.dts
> new file mode 100644
> index 0000000..a52f0cc
> --- /dev/null
> +++ b/tests/stacked_overlay_baz.dts
> @@ -0,0 +1,13 @@
> +/dts-v1/;
> +/plugin/;
> +/ {
> +	fragment@1 {
> +		target = <&bar>;
> +		__overlay__ {
> +			overlay-2-property;
> +			baz: baznode {
> +				baz-property = "baz";
> +			};
> +		};
> +	};
> +};
> 

Tested-by: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
