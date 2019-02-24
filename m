From: Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH 1/4] dt-bindings/marvell-8xxx: Allow wake-up interrupt to be placed in a separate node
Date: Sun, 24 Feb 2019 14:04:23 +0000
Message-ID: <20190224140426.3267-2-marc.zyngier@arm.com>
References: <20190224140426.3267-1-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190224140426.3267-1-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amitkumar Karwar <amitkarwar@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Ganapathi Bhat <gbhat@marvell.com>, Heiko Stuebner <heiko@sntech.de>, Kalle Valo <kvalo@codeaurora.org>, Nishant Sarmukadam <nishants@marvell.com>, Rob Herring <robh+dt@kernel.org>, Xinming Hu <huxinming820@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The DT binding for the PCI version of the Marvell 8xxx wifi devices
is pretty broken (the fact that a PCI device requires a DT binding
is quite telling on its own).

The binding allows the description of a wake-up interrupt as a sideband
signal, allowing the wifi device to wake-up the system. So far, so good.
Until you realise that placing an interrupt in the PCI device DT node
has a specific meaning, and applies to the actual PCI function, and
not some random sideband stuff. This is of course in total violation
of the OF specification (IEEE Std 1275-1994), but hey, who cares.

Let's thus change the binding to be somewhat compatible with the spec,
by placing the wake-up interrupt in a subnode called "wake-up". This
still is an optional property, but a recommended one for PCI devices.

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 .../bindings/net/wireless/marvell-8xxx.txt    | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/marvell-8xxx.txt b/Documentation/devicetree/bindings/net/wireless/marvell-8xxx.txt
index 9bf9bbac16e2..f9340ca37047 100644
--- a/Documentation/devicetree/bindings/net/wireless/marvell-8xxx.txt
+++ b/Documentation/devicetree/bindings/net/wireless/marvell-8xxx.txt
@@ -33,10 +33,16 @@ Optional properties:
 		 this interrupt number. during system suspend, the irq will be enabled
 		 so that the wifi chip can wakeup host platform under certain condition.
 		 during system resume, the irq will be disabled to make sure
-		 unnecessary interrupt is not received.
+		 unnecessary interrupt is not received. For PCI devices, it
+		 is recommended that this property is placed in a "wake-up"
+		 sub-node in order to limit the ambiguity with PCI legacy
+		 interrupts.
   - vmmc-supply: a phandle of a regulator, supplying VCC to the card
   - mmc-pwrseq:  phandle to the MMC power sequence node. See "mmc-pwrseq-*"
 		 for documentation of MMC power sequence bindings.
+  - wake-up:	 a subnode containing the interrupt specifier for a wake-up
+		 interrupt. This is the recommended configuration for PCI
+		 devices.
 
 Example:
 
@@ -66,3 +72,18 @@ so that firmware can wakeup host using this device side pin.
 		marvell,wakeup-pin = <3>;
 	};
 };
+
+&pci_rootport {
+	mvl_wifi: wifi@0,0 {
+		compatible = "pci1b4b,2b42";
+		reg = <0x83010000 0x0 0x00000000 0x0 0x00100000
+		       0x83010000 0x0 0x00100000 0x0 0x00100000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_host_wake_l>;
+		wake-up {
+			interrupt-parent = <&gpio0>;
+			interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+			wakeup-source;
+		};
+	};
+};
-- 
2.20.1
