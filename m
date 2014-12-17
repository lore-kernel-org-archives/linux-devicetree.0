From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/3] of: unittest: Overlays with sub-devices tests
Date: Wed, 17 Dec 2014 13:57:14 +0000
Message-ID: <20141217135714.D2702C4081F@trevor.secretlab.ca>
References: <1418751927-18088-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1418751927-18088-4-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418751927-18088-4-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 16 Dec 2014 19:45:27 +0200
, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
 wrote:
> Introduce selftests for overlays using sub-devices present
> in children nodes.
> 
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/of/unittest-data/tests-overlay.dtsi | 55 +++++++++++++++++++++++++++++
>  drivers/of/unittest.c                       | 46 ++++++++++++++++++++++++
>  2 files changed, 101 insertions(+)
> 
> diff --git a/drivers/of/unittest-data/tests-overlay.dtsi b/drivers/of/unittest-data/tests-overlay.dtsi
> index 75976da..a2b687d 100644
> --- a/drivers/of/unittest-data/tests-overlay.dtsi
> +++ b/drivers/of/unittest-data/tests-overlay.dtsi
> @@ -176,5 +176,60 @@
>  			};
>  		};
>  
> +		overlay10 {
> +			fragment@0 {
> +				target-path = "/testcase-data/overlay-node/test-bus";
> +				__overlay__ {
> +
> +					/* suppress DTC warning */
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					test-selftest10 {
> +						compatible = "selftest";
> +						status = "okay";
> +						reg = <10>;
> +
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +
> +						test-selftest101 {
> +							compatible = "selftest";
> +							status = "okay";
> +							reg = <1>;
> +						};
> +
> +					};
> +				};
> +			};
> +		};
> +
> +		overlay11 {
> +			fragment@0 {
> +				target-path = "/testcase-data/overlay-node/test-bus";
> +				__overlay__ {
> +
> +					/* suppress DTC warning */
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					test-selftest11 {
> +						compatible = "selftest";
> +						status = "okay";
> +						reg = <11>;
> +
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +
> +						test-selftest111 {
> +							compatible = "selftest";
> +							status = "okay";
> +							reg = <1>;
> +						};
> +
> +					};
> +				};
> +			};
> +		};
>  	};
>  };
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 844838e..00f0f9e 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -978,6 +978,9 @@ static int selftest_probe(struct platform_device *pdev)
>  	}
>  
>  	dev_dbg(dev, "%s for node @%s\n", __func__, np->full_name);
> +
> +	of_platform_populate(np, NULL, NULL, &pdev->dev);
> +
>  	return 0;
>  }
>  
> @@ -1385,6 +1388,46 @@ static void of_selftest_overlay_8(void)
>  	selftest(1, "overlay test %d passed\n", 8);
>  }
>  
> +/* test insertion of a bus with parent devices */
> +static void of_selftest_overlay_10(void)
> +{
> +	int ret;
> +	char *child_path;
> +
> +	/* device should disable */
> +	ret = of_selftest_apply_overlay_check(10, 10, 0, 1);
> +	if (ret != 0)
> +		return;
> +
> +	child_path = kasprintf(GFP_KERNEL, "%s/test-selftest101", selftest_path(10));
> +	if (!child_path) {
> +		selftest(0, "overlay test %d failed; kasprintf failed\n", 10);
> +		return;
> +	}

Please use the following construct for test conditions:

	child_path = kasprintf(GFP_KERNEL, "%s/test-selftest101", selftest_path(10));
	if (selftest(!child_path, "overlay test %d failed; kasprintf failed\n", 10))
		return;

Same goes for the tests below. That eliminates the need for a dummy
'pass' test at the bottom of the function.

> +
> +	ret = of_path_platform_device_exists(child_path);
> +	kfree(child_path);
> +	if (ret == 0) {
> +		selftest(0, "overlay test %d failed; child device not present\n", 10);
> +		return;
> +	}
> +
> +	selftest(1, "overlay test %d passed\n", 10);
> +}
> +
> +/* test insertion of a bus with parent devices (and revert) */
> +static void of_selftest_overlay_11(void)
> +{
> +	int ret;
> +
> +	/* device should disable */
> +	ret = of_selftest_apply_revert_overlay_check(11, 11, 0, 1);
> +	if (ret != 0)
> +		return;
> +
> +	selftest(1, "overlay test %d passed\n", 11);
> +}
> +
>  static void __init of_selftest_overlay(void)
>  {
>  	struct device_node *bus_np = NULL;
> @@ -1433,6 +1476,9 @@ static void __init of_selftest_overlay(void)
>  	of_selftest_overlay_6();
>  	of_selftest_overlay_8();
>  
> +	of_selftest_overlay_10();
> +	of_selftest_overlay_11();
> +
>  out:
>  	of_node_put(bus_np);
>  }
> -- 
> 1.7.12
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
