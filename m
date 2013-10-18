From: Matt Porter <matt.porter@linaro.org>
Subject: [RFC] Does PHY UTMI data width belong to DWC2 or PHY binding?
Date: Fri, 18 Oct 2013 10:12:21 -0400
Message-ID: <20131018141221.GH2721@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@nvidia.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Felipe Balbi <balbi@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Zimmerman <paulz@synopsys.com>, Devicetree List <devicetree@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This is a summary of an unresolved issue resulting from this thread:
http://www.spinics.net/lists/arm-kernel/msg277700.html

The BCM281xx family of SoCs contain an OTG subsystem consisting of a
DWC2 HSOTG controller and an internal UTMI PHY. This is appears as
follows (monospace font requirement ahead):

+----------------+              +-----------------+
|                |              |                 |
|                |       8      |                 |
|      DWC2      |<------/----->|     BCM Kona    |
|                |     UTMI     |     UTMI PHY    |
|                |              |                 |
+----------------+              +-----------------+

The internal UTMI phy is connected via an 8-bit data path. There is
no way to autodetect whether the data path is 8-bit or 16-bit. As such,
it was determined that a DT property is necessary to reflect this.

In the original patch submitted this property was offered as an
additional optional dwc2 property:

--- a/Documentation/devicetree/bindings/staging/dwc2.txt
+++ b/Documentation/devicetree/bindings/staging/dwc2.txt
@@ -6,10 +6,14 @@ Required properties:
 - reg : Should contain 1 register range (address and length)
 - interrupts : Should contain 1 interrupt

+Optional properties:
+- snps,phy-utmi-width: Must contain the UTMI data width (either 8 or 16)
+
 Example:

         usb@101c0000 {
                 compatible = "ralink,rt3050-usb, snps,dwc2";
                 reg = <0x101c0000 40000>;
                 interrupts = <18>;
+		snps,phy-utmi-width = <8>;
         };

The open question is whether this required hardware property belongs to
the DWC2 controller or the PHY itself.

If the UTMI data path width is considered to be a property of the PHY
then this will impact both the generic PHY framework and the PHY device
node (producer) binding. The binding would need to be extended to carry
the data path width property. In addition, the generic PHY framework
would need to allow for this information to be gathered in some manner
for use by the controller driver (PHY consumer). In the case of DWC2,
the driver needs to know whether to program the phy interface for 8 or
16 bit UTMI communication.

Thanks,
Matt
