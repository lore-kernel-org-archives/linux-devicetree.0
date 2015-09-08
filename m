From: Alonso Adrian <aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 8/8] pinctrl: freescale: imx: imx7d iomuxc-lpsr
 devicetree bindings
Date: Tue, 8 Sep 2015 16:15:58 +0000
Message-ID: <BN3PR03MB1509B275680CB6F23ED8D25CA8530@BN3PR03MB1509.namprd03.prod.outlook.com>
References: <1441147753-13239-1-git-send-email-aalonso@freescale.com>
 <1441147753-13239-8-git-send-email-aalonso@freescale.com>,<20150907024212.GG30746@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150907024212.GG30746@tiger>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Huang Anson <Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Li Frank <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Yibin Gong <yibin.gong-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Nitin Garg <nitin.garg-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

See comments below.

Regards
Adrian
________________________________________
From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sent: Sunday, September 6, 2015 9:42 PM
To: Alonso Lazcano Adrian-B38018
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; Huang Yongcai-B20788; Li Frank-B20596; Gong Yibin-B38343; Garg Nitin-B37173
Subject: Re: [PATCH v2 8/8] pinctrl: freescale: imx: imx7d iomuxc-lpsr devicetree bindings

On Tue, Sep 01, 2015 at 05:49:13PM -0500, Adrian Alonso wrote:
> Add iomuxc-lpsr devicetree bindings documentation
> Provide documentation context as well an example on
> pheriperals that could use pad from either iomuxc controller
> supported by iMX7D SoC
>
> Signed-off-by: Adrian Alonso <aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> Changes for V2: New patch on imx7d iomuxc-lpsr patch series
>
>  .../bindings/pinctrl/fsl,imx7d-pinctrl.txt         | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
> index 8bbf25d..c7310fc 100644
> --- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
> @@ -1,10 +1,19 @@
>  * Freescale i.MX7 Dual IOMUX Controller
>
> +iMX7D supports two iomuxc controllers, fsl,imx7d-iomuxc controller is similar
> +as previous iMX SoC generation and fsl,imx7d-iomuxc-lpsr which provides low
> +power state rentetion capabilities on gpios that are part of iomuxc-lpsr
> +(GPIO1_IO7..GPIO1_IO0).

I think the speciality of the select_input registers should be
mentioned too.
[Adrian] Agree will add notes for shared select input.

> +
> +Pheriparials using pads from iomuxc-lpsr support low state retention power
> +state, under LPSR mode GPIO's state of pads are retain.
> +
>  Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
>  and usage.
>
>  Required properties:
>  - compatible: "fsl,imx7d-iomuxc"
> +- compatible: "fsl-imx7d-iomuxc-lpsr"

s/fsl-imx7d-iomuxc-lpsr/fsl,imx7d-iomuxc-lpsr
[Adrian] Will fix this, thanks.
Shawn

>  - fsl,pins: each entry consists of 6 integers and represents the mux and config
>    setting for one pin.  The first 5 integers <mux_reg conf_reg input_reg mux_val
>    input_val> are specified using a PIN_FUNC_ID macro, which can be found in
> @@ -25,3 +34,37 @@ PAD_CTL_DSE_X1                  (0 << 0)
>  PAD_CTL_DSE_X2                  (1 << 0)
>  PAD_CTL_DSE_X3                  (2 << 0)
>  PAD_CTL_DSE_X4                  (3 << 0)
> +
> +Examples:
> +While iomuxc-lpsr is intended to be used by dedicated peripherals to take
> +advantages of LPSR power mode, is also possible that an IP to use pads from
> +any of the iomux controllers. For example the I2C1 IP can use SCL pad from
> +iomuxc-lpsr controller and SDA pad from iomuxc controller as:
> +
> +i2c1: i2c@30a20000 {
> +     pinctrl-names = "default";
> +     pinctrl-0 = <&pinctrl_i2c1_1 &pinctrl_i2c1_2>;
> +     status = "okay";
> +};
> +
> +iomuxc-lpsr@302c0000 {
> +     compatible = "fsl,imx7d-iomuxc-lpsr";
> +     reg = <0x302c0000 0x10000>;
> +
> +     pinctrl_i2c1_1: i2c1grp-1 {
> +             fsl,pins = <
> +                     MX7D_PAD_GPIO1_IO04__I2C1_SCL 0x4000007f
> +             >;
> +     };
> +};
> +
> +iomuxc@30330000 {
> +     compatible = "fsl,imx7d-iomuxc";
> +     reg = <0x30330000 0x10000>;
> +
> +     pinctrl_i2c1_2: i2c1grp-2 {
> +             fsl,pins = <
> +                     MX7D_PAD_I2C1_SCL__I2C1_SCL 0x4000007f
> +             >;
> +     };
> +};
> --
> 2.1.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
