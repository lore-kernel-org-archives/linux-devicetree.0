From: Min Guo <min.guo@mediatek.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: usb: musb: Add support for MediaTek
 musb controller
Date: Sat, 23 Feb 2019 11:04:36 +0800
Message-ID: <1550891076.12020.30.camel@mhfsdcap03>
References: <1550561795-31132-1-git-send-email-min.guo@mediatek.com>
 <1550561795-31132-2-git-send-email-min.guo@mediatek.com>
 <20190222164923.GA26413@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190222164923.GA26413@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, hdegoede@redhat.com, tony@atomide.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-mediatek@lists.infradead.org, Bin Liu <b-liu@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 2019-02-22 at 10:49 -0600, Rob Herring wrote:
> On Tue, Feb 19, 2019 at 03:36:30PM +0800, min.guo@mediatek.com wrote:
> > From: Min Guo <min.guo@mediatek.com>
> > 
> > This adds support for MediaTek musb controller in
> > host, peripheral and otg mode.
> > 
> > Signed-off-by: Min Guo <min.guo@mediatek.com>
> > ---
> > changes in v5:
> > suggested by Rob:
> > 1. Modify compatible as 
> > - compatible : should be one of:
> >                "mediatek,mt-2701"
> >                ...
> >                followed by "mediatek,mtk-musb"
> > 2. Add usb connector child node
> > 
> > changes in v4:
> > suggested by Sergei:
> > 1. String alignment
> > 
> > changes in v3:
> > 1. no changes
> > 
> > changes in v2:
> > suggested by Bin:
> > 1. Modify DRC to DRD
> > suggested by Rob:
> > 2. Drop the "<soc-model>-musb" in compatible
> > 3. Remove phy-names
> > 4. Add space after comma in clock-names
> > ---
> >  .../devicetree/bindings/usb/mediatek,musb.txt      | 54 ++++++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.txt b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
> > new file mode 100644
> > index 0000000..0632e6e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
> > @@ -0,0 +1,54 @@
> > +MediaTek musb DRD/OTG controller
> > +-------------------------------------------
> > +
> > +Required properties:
> > + - compatible      : should be one of:
> > +                     "mediatek,mt-2701"
> 
> That looks like a top-level SoC compatible and doesn't match the 
> example.
"mediatek,mt-2701" is an example, just to describe a specific SOC.
May I modify compatibel like:
compatible : should be "mediatek,mtk-musb"

> > +                     ...
> > +                     followed by "mediatek,mtk-musb"
> > + - reg             : specifies physical base address and size of
> > +                     the registers
> > + - interrupts      : interrupt used by musb controller
> > + - interrupt-names : must be "mc"
> 
> Not much point in a name when there is only 1.
The MUSB core driver has two interrupts, one is for MAC, another for
DMA, but on MTK platform, there is only a MAC interrupt, musb core
driver uses platform_get_irq_byname(pdev, "mc") to get this interrupt
number.

> > + - phys            : PHY specifier for the OTG phy
> > + - dr_mode         : should be one of "host", "peripheral" or "otg",
> > +                     refer to usb/generic.txt
> > + - clocks          : a list of phandle + clock-specifier pairs, one for
> > +                     each entry in clock-names
> > + - clock-names     : must contain "main", "mcu", "univpll"
> > +                     for clocks of controller
> > +
> > +Optional properties:
> > + - power-domains   : a phandle to USB power domain node to control USB's
> > +                     MTCMOS
> > +
> > +Required child nodes:
> > + usb connector node as defined in bindings/connector/usb-connector.txt
> > + - extcon          : for VBUS and ID pin changes detection, needed when
> > +                     supports dual-role mode
> > + - vbus-supply     : reference to the VBUS regulator, needed when supports
> > +                     dual-role mode
> > +
> > +Example:
> > +
> > +usb2: usb@11200000 {
> > +	compatible = "mediatek,mt2701-musb",
> > +		     "mediatek,mtk-musb";
> > +	reg = <0 0x11200000 0 0x1000>;
> > +	interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
> > +	interrupt-names = "mc";
> > +	phys = <&u2port2 PHY_TYPE_USB2>;
> > +	dr_mode = "otg";
> > +	clocks = <&pericfg CLK_PERI_USB0>,
> > +		 <&pericfg CLK_PERI_USB0_MCU>,
> > +		 <&pericfg CLK_PERI_USB_SLV>;
> > +	clock-names = "main","mcu","univpll";
> > +	power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
> > +	usb_con: connector{
> > +		compatible = "usb-b-connector";
> > +		label = "micro-USB";
> > +		type = "micro";
> > +		extcon = <&extcon_usb>;
> 
> The connector node should replace 'extcon'. Add what you need here 
> directly (e.g. id-gpios). What you add needs to be defined in 
> usb-connector.txt.
OK.

> > +		vbus-supply = <&usb_vbus>;
> > +	};
> > +};
> > -- 
> > 1.9.1
> > 
