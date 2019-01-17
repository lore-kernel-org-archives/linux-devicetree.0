From: Min Guo <min.guo@mediatek.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: musb: Add support for MediaTek
 musb controller
Date: Thu, 17 Jan 2019 20:41:16 +0800
Message-ID: <1547728876.4433.237.camel@mhfsdcap03>
References: <1547709348-17506-1-git-send-email-min.guo@mediatek.com>
         <1547709348-17506-2-git-send-email-min.guo@mediatek.com>
         <15fb900e-c665-8ebd-b2cc-54f47cc35734@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <15fb900e-c665-8ebd-b2cc-54f47cc35734@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Bin Liu <b-liu@ti.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, tony@atomide.com, hdegoede@redhat.com
List-Id: devicetree@vger.kernel.org

Hello!

On Thu, 2019-01-17 at 14:06 +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 01/17/2019 10:15 AM, min.guo@mediatek.com wrote:
> 
> > From: Min Guo <min.guo@mediatek.com>
> > 
> > This adds support for MediaTek musb controller in
> > host, peripheral and otg mode.
> > 
> > Signed-off-by: Min Guo <min.guo@mediatek.com>
> > ---
> >  .../devicetree/bindings/usb/mediatek,musb.txt      | 43 ++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.txt b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
> > new file mode 100644
> > index 0000000..3e3f671
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
> > @@ -0,0 +1,43 @@
> > +MediaTek musb DRD/OTG controller
> > +-------------------------------------------
> > +
> > +Required properties:
> > + - compatible      : should be "mediatek,mtk-musb"
> > + - reg             : specifies physical base address and size of
> > +   the registers
> 
>    I'd indent it more to align with "specifies", else it looks weird.

Okay.

> > + - interrupts      : interrupt used by musb controller
> > + - interrupt-names : must be "mc"
> > + - phys            : PHY specifier for the OTG phy
> > + - dr_mode         : should be one of "host", "peripheral" or "otg",
> > +   refer to usb/generic.txt
> 
>   Same here...

Okay.

> > + - clocks          : a list of phandle + clock-specifier pairs, one for
> > +   each entry in clock-names
> 
>    Here...

Okay.

> > + - clock-names     : must contain "main", "mcu", "univpll"
> > +   for clocks of controller
> 
>   And here.

Okay.

> > +
> > +Optional properties:
> > + - extcon : external connector for VBUS and IDPIN changes detection,
> 
>    ID pin, maybe?

Okay.

> > +   needed when supports dual-role mode.
> > + - vbus-supply : reference to the VBUS regulator, needed when supports
> > +   dual-role mode.
> > + - power-domains   : a phandle to USB power domain node to control USB's
> > +   MTCMOS
> [...]
> 
> MBR, Sergei
