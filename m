From: chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v6 2/5] dt-bindings: Add a binding for Mediatek xHCI
 host controller
Date: Tue, 1 Sep 2015 19:46:05 +0800
Message-ID: <1441107965.26285.6.camel@mhfsdcap03>
References: <1440207911-17666-1-git-send-email-chunfeng.yun@mediatek.com>
	 <1440207911-17666-3-git-send-email-chunfeng.yun@mediatek.com>
	 <55D877DD.3010400@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55D877DD.3010400-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

hi, 
On Sat, 2015-08-22 at 16:23 +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 8/22/2015 4:45 AM, Chunfeng Yun wrote:
> 
> > add a DT binding documentation of xHCI host controller for the
> > MT8173 SoC from Mediatek.
> 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >   .../devicetree/bindings/usb/mt8173-xhci.txt        | 52 ++++++++++++++++++++++
> >   1 file changed, 52 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> >
> > diff --git a/Documentation/devicetree/bindings/usb/mt8173-xhci.txt b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> > new file mode 100644
> > index 0000000..8e6e463
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> > @@ -0,0 +1,52 @@
> > +mt65XX xHCI
> 
>     The file is called mt8173-xhci.txt. Are you sure MT65xx should be here?
> 
I will revise it later.

> > +
> > +The device node for Mediatek SOC usb3.0 host controller
> > +
> > +Required properties:
> > + - compatible : should contain "mediatek,mt8173-xhci"
> > + - reg : specifies physical base address and size of the registers,
> > +	the first one for MAC, the second for IPPC
> > + - interrupts : interrupt used by the controller
> > + - power-domains : a phandle to USB power domain node to control usb's
> 
>     USB's -- be consistent, please.
> 
> > +	mtcmos
> > + - vusb33-supply : regulator of usb avdd3.3v
> > +
> > + - clocks : a list of phandle + clock-specifier pairs, one for each
> > +	entry in clock-names
> > + - clock-names : must contain
> > +	"sys_ck": for clock of xHCI MAC
> > +	"wakeup_deb_p0": for usb wakeup debounce clock of port0
> > +	"wakeup_deb_p0": for usb wakeup debounce clock of port1
> 
>     USB.
> 
> > +
> > + - phys : a list of phandle + phy specifier pairs
> > + - usb3-lpm-capable : supports USB3 LPM
> > + - mediatek,syscon-wakeup : phandle to syscon used to access usb wakeup
> > +	control register
> > + - mediatek,wakeup-src : 1: ip sleep wakeup mode; 2: line state wakeup
> > +	mode; others means don't enable wakeup source of usb
> 
>     "Others mean" and "USB".
> 
I will replace all 'usb' by "USB"

Thanks a lot, and sorry for later reply.
> [...]
> 
> MBR, Sergei
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
