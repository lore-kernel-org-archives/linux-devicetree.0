From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] pinctrl: intel: merrifield: Introduce OF device table
Date: Tue, 10 Oct 2017 17:01:56 +0100
Message-ID: <20171010160155.GK27659@leverpostej>
References: <20170929135539.4046-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170929135539.4046-1-andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mika Westerberg <mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lv.zheng-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Sep 29, 2017 at 04:55:39PM +0300, Andy Shevchenko wrote:
> On Intel Merrifield the pin control device is a separate IP block
> without any PCI or ACPI ID assigned. We need some means to allow the
> device be enumerated in ACPI environment (*).
> 
> To achieve this without allocation special ACPI ID, which is really long
> and pretty much unachievable procedure, we just re-use special ACPI ID
> and standard compatible string.
> 
> (*) ACPI is enabled via second bootloader, i.e. U-Boot,
>     firmware is still left untouched and being SFI enabled.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
> In v2:
> - add DT binding
> - we asked internally for ACPI ID about month ago with full silence in response

Just so that I understand, this means that you asked within Intel for an
ACPI ID, but couldn't get one allocated?

This sounds like a workaround for an internal process issue.

Surely there are other ACPI folk within Intel you can poke to move that
along?

>  .../devicetree/bindings/pinctrl/intel,FLIS-pinctrl.txt      | 13 +++++++++++++
>  drivers/pinctrl/intel/pinctrl-merrifield.c                  |  7 +++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,FLIS-pinctrl.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/intel,FLIS-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/intel,FLIS-pinctrl.txt
> new file mode 100644
> index 000000000000..8f5a32b2333b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/intel,FLIS-pinctrl.txt
> @@ -0,0 +1,13 @@
> +Intel Corporation, Family-Level Interface Shim (FLIS) pin controller
> +
> +FLIS pin controller is a separate IP block on non-ACPI enabled Intel
> +platforms, such as Intel Merrifield. Very known board based on it is
> +Intel Edison.
> +
> +There is an ongoing effort to emulate ACPI on that kind of boards
> +and, since it is near to impossible to allocate an ACPI ID for the
> +such controller, the compatible string may be used along with special
> +PRP0001 ACPI ID.

This paragraph is not relevant to the description of the device, nor is
any of this relvevant to DT, given (AFAICT), this is only intended to be
used with ACPI.

> +
> +Required properties for FLIS pin controller:
> +- compatible: "intel,merrifield-pinctrl"

This only has a compatible string?

As I've mentioned in the past, I'm not a fan of the whole PRP0001
approach, especially given that little care seems to be taken to
actually comply with DT standards.

Thanks,
Mark.

> diff --git a/drivers/pinctrl/intel/pinctrl-merrifield.c b/drivers/pinctrl/intel/pinctrl-merrifield.c
> index 86c4b3fab7b0..46fe30702a79 100644
> --- a/drivers/pinctrl/intel/pinctrl-merrifield.c
> +++ b/drivers/pinctrl/intel/pinctrl-merrifield.c
> @@ -931,10 +931,17 @@ static int mrfld_pinctrl_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct of_device_id mrfld_of_table[] = {
> +	{ .compatible = "intel,merrifield-pinctrl" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, mrfld_of_table);
> +
>  static struct platform_driver mrfld_pinctrl_driver = {
>  	.probe = mrfld_pinctrl_probe,
>  	.driver = {
>  		.name = "pinctrl-merrifield",
> +		.of_match_table = mrfld_of_table,
>  	},
>  };
>  
> -- 
> 2.14.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
