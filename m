From: David Lechner <david@lechnology.com>
Subject: [PATCH 2/3] ARM: DTS: da850: disable mdio and eth0 by default
Date: Wed, 13 Apr 2016 17:30:27 -0500
Message-ID: <1460586628-25152-3-git-send-email-david@lechnology.com>
References: <1460586628-25152-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1460586628-25152-1-git-send-email-david@lechnology.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, David Lechner <david@lechnology.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

All other devices are disabled by default and not all boards will use
these devices, so these should be disabled too.

da850-evm.dtb already had status = "okay" for these devices.
da850-enbw-cmc.dts did not, so they were added.

Signed-off-by: David Lechner <david@lechnology.com>
---
 arch/arm/boot/dts/da850-enbw-cmc.dts | 6 ++++++
 arch/arm/boot/dts/da850.dtsi         | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/da850-enbw-cmc.dts b/arch/arm/boot/dts/da850-enbw-cmc.dts
index 101d1a1..14dff3e 100644
--- a/arch/arm/boot/dts/da850-enbw-cmc.dts
+++ b/arch/arm/boot/dts/da850-enbw-cmc.dts
@@ -26,6 +26,12 @@
 		serial2: serial@10d000 {
 			status = "okay";
 		};
+		mdio: mdio@224000 {
+			status = "okay";
+		};
+		eth0: ethernet@220000 {
+			status = "okay";
+		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 92b5f3c..7f3fb98 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -322,6 +322,7 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x224000 0x1000>;
+			status = "disabled";
 		};
 		eth0: ethernet@220000 {
 			compatible = "ti,davinci-dm6467-emac";
@@ -336,6 +337,7 @@
 					35
 					36
 					>;
+			status = "disabled";
 		};
 		usbphy: usbphy {
 			compatible = "ti,da830-usbphy";
-- 
1.9.1
