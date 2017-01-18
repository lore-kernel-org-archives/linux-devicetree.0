From: Raviteja Garimella <raviteja.garimella@broadcom.com>
Subject: [PATCH v2 3/3] DT nodes for Broadcom Northstar2 USB DRD Phy
Date: Wed, 18 Jan 2017 17:50:04 +0530
Message-ID: <1484742004-6792-4-git-send-email-raviteja.garimella@broadcom.com>
References: <1484742004-6792-1-git-send-email-raviteja.garimella@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484742004-6792-1-git-send-email-raviteja.garimella@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds device tree nodes for USB Dual Role Device Phy for
Broadcom's Northstar2 SoC.

Signed-off-by: Raviteja Garimella <raviteja.garimella@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/ns2.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index 4fcdeca..d9f701c 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -353,6 +353,20 @@
 			};
 		};
 
+		usbdrd_phy: phy@66000960 {
+			#phy-cells = <0>;
+			compatible = "brcm,ns2-drd-phy";
+			reg = <0x66000960 0x24>,
+			      <0x67012800 0x4>,
+			      <0x6501d148 0x4>,
+			      <0x664d0700 0x4>;
+			reg-names = "icfg", "rst-ctrl",
+				    "crmu-ctrl", "usb2-strap";
+			id-gpios = <&gpio_g 30 0>;
+			vbus-gpios = <&gpio_g 31 0>;
+			status = "disabled";
+		};
+
 		pwm: pwm@66010000 {
 			compatible = "brcm,iproc-pwm";
 			reg = <0x66010000 0x28>;
-- 
2.1.0
