From: "David R. Piegdon" <lkml@p23q.org>
Subject: [RFC PATCH 2/2] dt-bindings: allow suggesting usb bus number for usb
 platform busses
Date: Tue, 27 Nov 2018 16:57:58 +0000
Message-ID: <20181127165758.GA13892@lagavulin.indurad.x>
References: <cover.1543332368.git.lkml@p23q.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1543332368.git.lkml@p23q.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Alan Stern <stern@rowland.harvard.edu>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, Kay Sievers <kay@vrfy.org>, Mark Rutland <mark.rutland@arm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@ti.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, systemd-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: "David R. Piegdon" <lkml@p23q.org>

systemd allows use of predictable netdev names. these currently do
not work for netdevs connected to USB platform busses, as the id
of the platform bus is not necessarily consistent across kernel
versions. this patch allows setting a suggested bus id for platform
busses. in combination with a suggested systemd-patch, see
https://github.com/systemd/systemd/pull/7273 , this allows persistent
netdev names for such devices.

NOTE: this patch might change ordering of busses on devices that use
platform-busses, if aliases for these busses have already been defined!
---
 Documentation/devicetree/bindings/usb/usb-hcd.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.txt b/Documentation/devicetree/bindings/usb/usb-hcd.txt
index 50529b838c9c..79afbcf3b5de 100644
--- a/Documentation/devicetree/bindings/usb/usb-hcd.txt
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.txt
@@ -2,8 +2,17 @@ Generic USB HCD (Host Controller Device) Properties
 
 Optional properties:
 - phys: a list of all USB PHYs on this HCD
+- an alias of the form "usbN" may be defined to suggest the use of
+  busnumer "N" for this platform bus.
 
 Example:
+
+	aliases {
+		usb1 = "/usb@c5000000";
+		usb2 = "/usb@c5004000";
+		usb3 = "/usb@c5008000";
+	}
+
 	&usb1 {
 		phys = <&usb2_phy1>, <&usb3_phy1>;
 	};
-- 
2.11.0
