From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v12 1/3] dt-bindings: Add a binding for Mediatek xHCI host
 controller
Date: Tue, 17 Nov 2015 13:58:35 +0300
Message-ID: <564B085B.7060706@cogentembedded.com>
References: <1447751921-26746-1-git-send-email-chunfeng.yun@mediatek.com>
 <1447751921-26746-2-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447751921-26746-2-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 11/17/2015 12:18 PM, Chunfeng Yun wrote:

> add a DT binding documentation of xHCI host controller for the
> MT8173 SoC from Mediatek.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>   .../devicetree/bindings/usb/mt8173-xhci.txt        | 51 ++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/usb/mt8173-xhci.txt
>
> diff --git a/Documentation/devicetree/bindings/usb/mt8173-xhci.txt b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> new file mode 100644
> index 0000000..a78f20b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> @@ -0,0 +1,51 @@
> +MT8173 xHCI
> +
> +The device node for Mediatek SOC USB3.0 host controller
> +
> +Required properties:
> + - compatible : should contain "mediatek,mt8173-xhci"
> + - reg : specifies physical base address and size of the registers,
> +	the first one for MAC, the second for IPPC
> + - interrupts : interrupt used by the controller
> + - power-domains : a phandle to USB power domain node to control USB's
> +	mtcmos

    What's that?

> + - vusb33-supply : regulator of USB avdd3.3v
> +
> + - clocks : a list of phandle + clock-specifier pairs, one for each
> +	entry in clock-names
> + - clock-names : must contain
> +	"sys_ck": for clock of xHCI MAC
> +	"wakeup_deb_p0": for USB wakeup debounce clock of port0
> +	"wakeup_deb_p0": for USB wakeup debounce clock of port1

    "wakeup_deb_p1"?

> +
> + - phys : a list of phandle + phy specifier pairs
> +
> +Optional properties:
> + - mediatek,wakeup-src : 1: ip sleep wakeup mode; 2: line state wakeup
                                ^^ IP?

> +	mode;
> + - mediatek,syscon-wakeup : phandle to syscon used to access USB wakeup
> +	control register, it depends on "mediatek,wakeup-src".
> + - vbus-supply : reference to the VBUS regulator;
> + - usb3-lpm-capable : supports USB3.0 LPM

[...]

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
