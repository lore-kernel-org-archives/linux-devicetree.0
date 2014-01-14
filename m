From: Vince Bridgers <vbridgers2013@gmail.com>
Subject: [PATCH net-next v3 1/2] dts: Add a binding for Synopsys emac max-frame-size
Date: Tue, 14 Jan 2014 11:17:38 -0600
Message-ID: <1389719859-29071-2-git-send-email-vbridgers2013@gmail.com>
References: <1389719859-29071-1-git-send-email-vbridgers2013@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1389719859-29071-1-git-send-email-vbridgers2013@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: devicetree@vger.kernel.org, netdev@vger.kernel.org
Cc: peppe.cavallaro@st.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, dinguyen@altera.com, rayagond@vayavyalabs.com, vbridgers2013@gmail.com
List-Id: devicetree@vger.kernel.org

This change adds a parameter for the Synopsys 10/100/1000
stmmac Ethernet driver to configure the maximum frame
size supported by the EMAC driver. Synopsys allows the FIFO
sizes to be configured when the cores are built for a particular
device, but do not provide a way for the driver to read
information from the device about the maximum MTU size
supported as limited by the device's FIFO size.

Signed-off-by: Vince Bridgers <vbridgers2013@gmail.com>
---
V3: change snps,max-frame-size to max-frame-size
V2: change snps,max-mtu to snps,max-frame-size
---
 Documentation/devicetree/bindings/net/stmmac.txt |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/stmmac.txt b/Documentation/devicetree/bindings/net/stmmac.txt
index eba0e5e..323d310 100644
--- a/Documentation/devicetree/bindings/net/stmmac.txt
+++ b/Documentation/devicetree/bindings/net/stmmac.txt
@@ -30,6 +30,10 @@ Required properties:
 
 Optional properties:
 - mac-address: 6 bytes, mac address
+- max-frame-size: Maximum frame size permitted. This parameter is useful
+			since different implementations of the Synopsys MAC may
+			have different FIFO sizes depending on the selections
+			made in Synopsys Core Consultant.
 
 Examples:
 
@@ -40,5 +44,6 @@ Examples:
 		interrupts = <24 23>;
 		interrupt-names = "macirq", "eth_wake_irq";
 		mac-address = [000000000000]; /* Filled in by U-Boot */
+		max-frame-size = <3800>;
 		phy-mode = "gmii";
 	};
-- 
1.7.9.5
