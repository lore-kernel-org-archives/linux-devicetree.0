Return-Path: <SRS0=+B9Q=TD=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: How do I tell a dual role PHY to always be host or peripheral?
Date: Fri, 3 May 2019 14:46:13 +0000
Message-ID: 
 <TY1PR01MB1562C3DF1D5D538AF0156B738A350@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

I'm preparing patches to add USB support (host and device) for the=20
RZ/A2M SoC. The internal HW is similar to the R-Car Gen 3 (USB 2.0, not
USB 3.0).
So I'm reusing drivers/phy/renesas/phy-rcar-gen3-usb2.c

But, I'm not doing OTG, so I need to tell the PHY that it explicitly=20
needs to be configured as host or peripheral mode.
The controllers are individual (host or peripheral), but they use the=20
same internal PHY.

Looking at:

https://www.kernel.org/doc/Documentation/devicetree/bindings/usb/generic.tx=
t

Technically, I should not add "dr_mode" to the USB controller nodes (and
let the PHY driver check that) because the "controller" is not dual=20
role, only PHY is.

I was adding a new property "renesas,is_peripheral" to the=20
phy-rcar-gen3-usb2.c PHY driver that it would check if it was not OTG which=
 of course
works.

However, if I look at the PHY dt-bindings of:
  Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.txt
  Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.txt

They are both using the name "dr_mode" in the PHY node.

So, instead of adding something like "renesas,is_peripheral" to the=20
current R-Car USB2 PHY driver, can I just use the generic name "dr_mode"?

The PHY driver code change is pretty simple:

	if (channel->is_otg_channel) {
		x x x (existing code today)
+	} else
+		if (usb_get_dr_mode(channel->dev) =3D=3D USB_DR_MODE_PERIPHERAL)
+			writel(0x80000000, usb2_base + USB2_COMMCTRL);
+		else
+			writel(0x00000000, usb2_base + USB2_COMMCTRL);



I figured I would ask BEFORE I start submitting patches for review.


Thank you,
Chris
