From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 2/5] Documentation: dt-bindings: add dt binding info
 for hi6220
Date: Tue, 10 Feb 2015 13:28:36 +0000
Message-ID: <20150210132836.GB9432@leverpostej>
References: <1423554627-694-1-git-send-email-zhangfei.gao@linaro.org>
 <1423554627-694-3-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1423554627-694-3-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Mian Yousaf Kaukab <yousaf.kaukab-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan . zhao" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Wangbinghui <wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 10, 2015 at 07:50:24AM +0000, Zhangfei Gao wrote:
> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/hi6220-usb.txt         | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/hi6220-usb.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/hi6220-usb.txt b/Documentation/devicetree/bindings/usb/hi6220-usb.txt
> new file mode 100644
> index 0000000..b8278de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/hi6220-usb.txt
> @@ -0,0 +1,49 @@
> +Hisilicon hi6220 SoC USB controller
> +-----------------------------
> +
> +usb controller is inherited from dwc2, refer dwc2.txt
> +-----
> +
> +Required properties:
> +- compatible: "hisilicon,hi6220-usb"
> +Refer to dwc2.txt for dwc2 usb properties
> +
> +
> +PHY:
> +-----
> +
> +Required properties:
> +- compatible: "hisilicon,hi6220-usb-phy"
> +- vcc-supply: phandle to the regulator that provides power to the PHY.
> +- clocks: phandle and clock specifier of the PHY clock.
> +- hisilicon,peripheral-syscon: phandle of syscon used to control peripheral.
> +- hisilicon,gpio-vbus: gpio of detecting vbus.
> +- hisilicon,gpio-id: gpio of detecting id.

These should be vbus-gpios and id-gpios respectively.

> +
> +Example:
> +
> +	peripheral_ctrl: syscon@f7030000 {
> +	        compatible = "syscon";
> +	        reg = <0x0 0xf7030000 0x0 0x1000>;
> +	};

We should have a real string for this in addition to "syscon".

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
