From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH/RFC 02/10] phy: rcar-gen3-usb2: Add phy-supply description
 in device tree doc
Date: Thu, 4 Feb 2016 08:49:20 +0000
Message-ID: <SG2PR06MB091989E7308B517A35941A35D8D10@SG2PR06MB0919.apcprd06.prod.outlook.com>
References: <1454408338-4612-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1454408338-4612-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20160203204520.GA30531@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160203204520.GA30531@rob-hp-laptop>
Content-Language: ja-JP
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "horms@verge.net.au" <horms@verge.net.au>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> From: Rob Herring
> Sent: Thursday, February 04, 2016 5:45 AM
> 
> On Tue, Feb 02, 2016 at 07:18:50PM +0900, Yoshihiro Shimoda wrote:
> > To handle the VBUS on/off by a regulator driver, this patch adds
> > description about phy-supply in the rcar-gen3-phy-usb2.txt.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> > index eaf7e9b..48b33a9 100644
> > --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> > +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> > @@ -15,6 +15,8 @@ To use a USB channel where USB 2.0 Host and HSUSB (USB 2.0 Peripheral) are
> >  combined, the device tree node should set interrupt properties to use the
> >  channel as USB OTG:
> >  - interrupts: interrupt specifier for the PHY.
> > +- phy-supply: Phandle to a regulator that provides power to the VBUS. This
> > +	      regulator will be managed during the PHY power on/off sequence.
> 
> Is "phy" the actual name of the input supply to the phy?

Thank you for the comment!
Yes, the "phy" is the actual name for the phy.
So, I checked other phy drivers and then some drivers have "vbus-supply" to handle the vbus.
And then, I think that this driver (or Generic PHY framework?) should have such property
to handle the vbus.

Best regards,
Yoshihiro Shimoda

> >
> >  Example (R-Car H3):
> >
> > --
> > 1.9.1
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
