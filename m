From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 8/9] dt-bindings: usb: mtk-xhci: add a optional property
 to disable u3ports
Date: Wed, 11 Oct 2017 14:37:34 +0800
Message-ID: <1507703854.17567.77.camel@mhfsdcap03>
References: <994382d16d6bdc0f3d7c11b22f1710252e056e34.1506503879.git.chunfeng.yun@mediatek.com>
         <fd8b6099192ddee3b277f5ca3a699c20fb273ffe.1506503880.git.chunfeng.yun@mediatek.com>
         <20171005221650.yfyh72op6azm2nri@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171005221650.yfyh72op6azm2nri@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-10-05 at 17:16 -0500, Rob Herring wrote:
Hi,
> On Wed, Sep 27, 2017 at 05:23:04PM +0800, Chunfeng Yun wrote:
> > Add a new optional property to disable u3ports
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  .../devicetree/bindings/usb/mediatek,mtk-xhci.txt  |    2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
> > index 5611a2e..2d9b459 100644
> > --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
> > +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
> > @@ -38,6 +38,8 @@ Optional properties:
> >  	mode;
> >   - mediatek,syscon-wakeup : phandle to syscon used to access USB wakeup
> >  	control register, it depends on "mediatek,wakeup-src".
> > + - mediatek,u3p-dis-msk : mask to disable u3ports, bit0 for u3port0,
> > +	bit1 for u3port1, ... etc;
> 
> I think you should have child nodes for ports and use "status" to 
> disable them (or omit them). IIRC, the common USB bus binding already 
> defines ports.
I find only one common binding document about USB bus, that is
bindings/usb/usb-device.txt, but it can't be used to disable some ports,
because in hub_probe() function, hub driver enables all downstream
ports, but doesn't get any property info from DTS.

> 
> >   - vbus-supply : reference to the VBUS regulator;
> >   - usb3-lpm-capable : supports USB3.0 LPM
> >   - pinctrl-names : a pinctrl state named "default" must be defined
> > -- 
> > 1.7.9.5
> > 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
