From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] pinctrl: Broadcom NSP pinctrl device tree bindings
Date: Sun, 22 Nov 2015 14:45:53 -0600
Message-ID: <20151122204553.GA31160@rob-hp-laptop>
References: <1448042191-1982-1-git-send-email-yrdreddy@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1448042191-1982-1-git-send-email-yrdreddy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yendapally Reddy Dhananjaya Reddy <yrdreddy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 20, 2015 at 12:56:31PM -0500, Yendapally Reddy Dhananjaya Reddy wrote:
> Device tree binding documentation for Broadcom NSP IOMUX driver
> 
> Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yrdreddy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  .../bindings/pinctrl/brcm,nsp-pinmux.txt           | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,nsp-pinmux.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,nsp-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-pinmux.txt
> new file mode 100644
> index 0000000..603564e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-pinmux.txt
> @@ -0,0 +1,79 @@
> +Broadcom NSP (Northstar plus) IOMUX Controller
> +
> +The NSP IOMUX controller supports group based mux configuration. In
> +addition, certain pins can be muxed to GPIO function individually.
> +
> +Required properties:
> +- compatible:
> +    Must be "brcm,nsp-pinmux"
> +
> +- reg:
> +    Should contain the register physical address and length for each of
> +    GPIO_CONTROL0, GP_AUX_SEL and IPROC_CONFIG IOMUX registers
> +
> +Properties in subnodes:
> +- function:
> +    The mux function to select
> +
> +- groups:
> +    The list of groups to select with a given function
> +
> +For more details, refer to
> +Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +
> +For example:
> +
> +	pinmux: pinmux@1803f1c0 {
> +		compatible = "brcm,nsp-pinmux";
> +		reg = <0x1803f1c0 0x04>,
> +		      <0x18030028 0x04>,
> +		      <0x1803f408 0x04>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pwm &gpio_b &nand_sel>;
> +
> +		pwm: pwm {
> +			function = "pwm";
> +			groups = "pwm0_grp", "pwm1_grp";
> +		};
> +
> +		gpio_b: gpio_b {
> +			function = "gpio_b";
> +			groups = "gpio_b_0_grp", "gpio_b_1_grp";
> +		};
> +
> +		nand_sel: nand_sel {
> +			function = "nand";
> +			groups = "nand_grp";
> +		};
> +	};
> +
> +List of supported functions and groups in Northstar Plus:
> +
> +"spi": "spi_grp"
> +
> +"i2c": "i2c_grp"
> +
> +"mdio": "mdio_grp"
> +
> +"pwm": "pwm0_grp", "pwm1_grp", "pwm2_grp", "pwm3_grp"
> +
> +"gpio_b": "gpio_b_0_grp", "gpio_b_1_grp", "gpio_b_2_grp", "gpio_b_3_grp"
> +
> +"uart1": "uart1_grp"
> +
> +"uart2": "uart2_grp"
> +
> +"synce": "synce_grp"
> +
> +"sata_led_grps": "sata0_led_grp", "sata1_led_grp"
> +
> +"xtal_out": "xtal_out_grp"
> +
> +"sdio": "sdio_pwr_grp", "sdio_1p8v_grp"
> +
> +"switch_led": "switch_p05_led0_grp", "switch_p05_led1_grp"
> +
> +"nand": "nand_grp"
> +
> +"emmc": "emmc_grp"
> -- 
> 2.1.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
