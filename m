From: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: phy: Add documentation for Mediatek
 PCIe PHY
Date: Tue, 2 May 2017 15:08:57 +0800
Message-ID: <1493708937.6464.36.camel@mtkswgap22>
References: <1492935453-17373-1-git-send-email-ryder.lee@mediatek.com>
         <1492935453-17373-3-git-send-email-ryder.lee@mediatek.com>
         <20170428175200.laakck7ill2lxtxc@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170428175200.laakck7ill2lxtxc@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 2017-04-28 at 12:52 -0500, Rob Herring wrote:
> On Sun, Apr 23, 2017 at 04:17:33PM +0800, Ryder Lee wrote:
> > Add documentation for PCIe PHY available in MT7623 series SoCs.
> > 
> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> > ---
> >  .../devicetree/bindings/phy/phy-mt7623-pcie.txt    | 67 ++++++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/phy-mt7623-pcie.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/phy-mt7623-pcie.txt b/Documentation/devicetree/bindings/phy/phy-mt7623-pcie.txt
> > new file mode 100644
> > index 0000000..27a9253
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/phy-mt7623-pcie.txt
> > @@ -0,0 +1,67 @@
> > +Mediatek MT7623 PCIe PHY
> > +-----------------------
> > +
> > +Required properties:
> > + - compatible: Should contain "mediatek,mt7623-pcie-phy"
> > + - #phy-cells: must be 0
> > + - clocks: Must contain an entry in clock-names.
> > +	See ../clocks/clock-bindings.txt for details.
> > + - clock-names: Must be "refclk"
> > + - resets: Must contain an entry in reset-names.
> > +	See ../reset/reset.txt for details.
> > + - reset-names: Must be "phy"
> > +
> > +Optional properties:
> > + - phy-switch: The PHY on PCIe port2 is shared with USB u3phy2. If you
> > +	want to enable port2, you should contain it.
> 
> Need to state what the value is (i.e. a phandle to ?). Also needs a 
> vendor prefix.

I will correct it.

> > +
> > +Example:
> > +
> > +	pcie0_phy: pciephy@1a149000 {
> 
> pcie-phy@...

Okay.
> > +		compatible = "mediatek,mt7623-pcie-phy";
> > +		reg = <0 0x1a149000 0 0x1000>;
> > +		clocks = <&clk26m>;
> > +		clock-names = "pciephya_ref";
> > +		#phy-cells = <0>;
> > +		status = "disabled";
> 
> Don't show status in examples.
I will drop it all.
> > +	};
> > +
> > +	pcie1_phy: pciephy@1a14a000 {
> > +		compatible = "mediatek,mt7623-pcie-phy";
> > +		reg = <0 0x1a14a000 0 0x1000>;
> > +		clocks = <&clk26m>;
> > +		clock-names = "pciephya_ref";
> > +		#phy-cells = <0>;
> > +		status = "disabled";
> > +	};
> > +
> > +	pcie2_phy: pciephy@1a244000 {
> > +		compatible = "mediatek,mt7623-pcie-phy";
> > +		reg = <0 0x1a244000 0 0x1000>;
> > +		clocks = <&clk26m>;
> > +		clock-names = "pciephya_ref";
> > +		#phy-cells = <0>;
> > +
> > +		phy-switch = <&hifsys>;
> > +		status = "disabled";
> > +	};
> > +
> > +Specifying phy control of devices
> > +---------------------------------
> > +
> > +Device nodes should specify the configuration required in their "phys"
> > +property, containing a phandle to the phy node and phy-names.
> > +
> > +Example:
> > +
> > +#include <dt-bindings/phy/phy.h>
> > +
> > +pcie: pcie@1a140000 {
> > +	...
> > +	pcie@1,0 {
> > +		...
> > +		phys = <&pcie0_phy>;
> > +		phy-names = "pcie-phy0";
> > +	}
> > +	...
> > +};

Thanks for your reviews.
> > -- 
> > 1.9.1
> > 
