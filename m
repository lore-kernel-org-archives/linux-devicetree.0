From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/4] Documentation: dt-bindings: add dt binding info for
 hi6220
Date: Thu, 05 Feb 2015 21:24:01 +0300
Message-ID: <54D3B541.1070404@cogentembedded.com>
References: <1423147620-5760-1-git-send-email-zhangfei.gao@linaro.org> <1423147620-5760-3-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423147620-5760-3-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org, john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Mian Yousaf Kaukab <yousaf.kaukab-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan . zhao" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 02/05/2015 05:46 PM, Zhangfei Gao wrote:

> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>   .../devicetree/bindings/usb/hi6220-usb.txt         | 50 ++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/usb/hi6220-usb.txt

> diff --git a/Documentation/devicetree/bindings/usb/hi6220-usb.txt b/Documentation/devicetree/bindings/usb/hi6220-usb.txt
> new file mode 100644
> index 0000000..e926364
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/hi6220-usb.txt
> @@ -0,0 +1,50 @@
> +Hisilicon hi6220  SoC USB controlle

    Controller.

> +-----------------------------
> +
> +usb controller is inherited from dwc2, refer dwc2.txt
> +-----
> +
> +Required properties:
> +- compatible: "hisilicon,hi6220-usb-phy"

    PHY? I thought you were describing the USB controller.

> +Refer to dwc2.txt for dwc2 usb properties
> +
> +
> +phy:
> +-----
> +
> +Required properties:
> +- compatible: "hisilicon,hi6220-usb-phy"
> +- vcc-supply: phandle to the regulator that provides power to the PHY.
> +- clocks: phandle to the PHY clock. Use as per Documentation/devicetree

    Actually, it's phandle and clock specifier.

> +  /bindings/clock/clock-bindings.txt
> +- hisilicon,peripheral-syscon: phandle of syscon used to control peripheral.
> +- hisilicon,gpio_vbus_det: gpio of detecting vbus.
> +- hisilicon,gpio_id_det: gpio of detecting id.

    Hyphens are preferred over underscores in the prop names.

[...]

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
