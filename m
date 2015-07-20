From: chunfeng yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: Add a binding for Mediatek xHCI
 host controller
Date: Mon, 20 Jul 2015 22:24:00 +0800
Message-ID: <1437402240.11518.0.camel@mhfsdcap03>
References: <1436348468-4126-1-git-send-email-chunfeng.yun@mediatek.com>
	 <1436348468-4126-3-git-send-email-chunfeng.yun@mediatek.com>
	 <559F82C7.5010202@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <559F82C7.5010202@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Felipe Balbi <balbi@ti.com>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 2015-07-10 at 11:31 +0300, Roger Quadros wrote:
> Hi,
> 
> On 08/07/15 12:41, Chunfeng Yun wrote:
> > add a DT binding documentation of xHCI host controller for the
> > MT8173 SoC from Mediatek.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  .../devicetree/bindings/usb/mt8173-xhci.txt        | 27 ++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/mt8173-xhci.txt b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> > new file mode 100644
> > index 0000000..94cec94
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> > @@ -0,0 +1,27 @@
> > +MT65XX xhci
> > +
> > +The device node for Mediatek SOC usb3.0 host controller
> > +
> > +Required properties:
> > + - compatible : supports "mediatek,mt8173-xhci"
> > + - reg        : Offset and length of registers
> > + - interrupts : Interrupt mode, number and trigger mode
> > + - reg-vusb33-supply:  regulator of usb avdd3.3v
> > + - reg-vbus-supply : regulator of vbus;
> 
> General trend is to use <supply-name>-supply.
> We already know it is a regulator so no need to add "reg-"
> 
> So those two can be
> 
> vusb33-supply:
> vbus-supply:
> 
Ok, thanks

> 
> > + - usb-phy : the phy that xhci will bind
> > + - usb3-lpm-capable: supports USB3 LPM
> > + - clocks     : must support all clocks that xhci needs
> > + - clock-names: should be "sys_mac" for sys and mac clocks
> > +
> > +Example:
> > +usb: usb30@11270000 {
> > +	compatible = "mediatek,mt8173-xhci";
> > +	reg = <0 0x11270000 0 0x1000>;
> > +	interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> > +	reg-vusb33-supply = <&mt6397_vusb_reg>;
> > +	reg-vbus-supply = <&usb_p1_vbus>;
> > +	usb-phy = <&u3phy>;
> > +	usb3-lpm-capable;
> > +	clocks = <&topckgen CLK_TOP_USB30_SEL>;
> > +	clock-names = "sys_mac";
> > +};
> > 
> 
> cheers,
> -roger
