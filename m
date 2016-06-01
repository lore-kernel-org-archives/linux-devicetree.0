From: chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2,1/5] dt-bindings: mt8173-xhci: support host side of
 dual-role mode
Date: Wed, 1 Jun 2016 20:04:17 +0800
Message-ID: <1464782657.11651.136.camel@mhfsdcap03>
References: <1464673962-11506-1-git-send-email-chunfeng.yun@mediatek.com>
	 <1464673962-11506-2-git-send-email-chunfeng.yun@mediatek.com>
	 <7828750b-f5ac-6fa0-ee6e-d4775c227e1a@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7828750b-f5ac-6fa0-ee6e-d4775c227e1a-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, 2016-05-31 at 14:07 +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 5/31/2016 8:52 AM, Chunfeng Yun wrote:
> 
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  .../devicetree/bindings/usb/mt8173-xhci.txt        |   48 ++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/mt8173-xhci.txt b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> > index b3a7ffa..542e3fa 100644
> > --- a/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> > +++ b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> > @@ -2,6 +2,14 @@ MT8173 xHCI
> >
> >  The device node for Mediatek SOC USB3.0 host controller
[...]
> >  Required properties:
> >   - compatible : should contain "mediatek,mt8173-xhci"
> >   - reg : specifies physical base address and size of the registers,
> > @@ -27,6 +35,9 @@ Optional properties:
> >  	control register, it depends on "mediatek,wakeup-src".
> >   - vbus-supply : reference to the VBUS regulator;
> >   - usb3-lpm-capable : supports USB3.0 LPM
> > + - pinctl-names : a pinctrl state named "default" must be defined
> 
>     pinctrl-names.
> 
Thanks.

> > + - pinctrl-0 : pin control group
> > +	See: Documentation/devicetree/bindings/pinctrl/pinctrl-binding.txt
> >
> >  Example:
> >  usb30: usb@11270000 {
> [...]
> 
> MBR, Sergei
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
