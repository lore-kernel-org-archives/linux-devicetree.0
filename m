From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [resend PATCH v3 2/4] Documentation: dt-bindings: add dt binding
 info for hi6220
Date: Tue, 10 Feb 2015 14:37:01 +0300
Message-ID: <54D9ED5D.2000001@cogentembedded.com>
References: <1423559404-13058-1-git-send-email-zhangfei.gao@linaro.org> <1423559404-13058-3-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423559404-13058-3-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org, john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Mian Yousaf Kaukab <yousaf.kaukab-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan . zhao" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Wangbinghui <wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 2/10/2015 12:10 PM, Zhangfei Gao wrote:

> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>   .../devicetree/bindings/usb/hi6220-usb.txt         | 49 ++++++++++++++++++++++
>   1 file changed, 49 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/usb/hi6220-usb.txt

> diff --git a/Documentation/devicetree/bindings/usb/hi6220-usb.txt b/Documentation/devicetree/bindings/usb/hi6220-usb.txt
> new file mode 100644
> index 0000000..b8278de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/hi6220-usb.txt
> @@ -0,0 +1,49 @@
> +Hisilicon hi6220 SoC USB controller
> +-----------------------------
[...]
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

    Actually, GPIO bindings say that GPIO properties should be named 
"[<name>-]gpios".

> +
> +Example:
> +
> +	peripheral_ctrl: syscon@f7030000 {
> +	        compatible = "syscon";
> +	        reg = <0x0 0xf7030000 0x0 0x1000>;
> +	};
> +
> +	usb2_phy: usbphy {

    Please name it "usb-phy" as it better resembles "ethernet-phy" 
standardized by ePAPR.

[...]

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
