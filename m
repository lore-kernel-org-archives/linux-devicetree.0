From: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 3/3] ARM: dts: k2g: Add USB instances
Date: Wed, 2 Aug 2017 15:17:24 -0500
Message-ID: <20170802201724.11439-4-fcooper@ti.com>
References: <20170802201724.11439-1-fcooper@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170802201724.11439-1-fcooper@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, ssantosh@kernel.org, linux@armlinux.org.uk, balbi@kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Franklin S Cooper Jr <fcooper@ti.com>, Vitaly Andrianov <vitalya@ti.com>, Dave Gerlach <d-gerlach@ti.com>
List-Id: devicetree@vger.kernel.org

From: Vitaly Andrianov <vitalya@ti.com>

Add nodes for both USB instances supported by 66AK2G.

[d-gerlach@ti.com: Add power domain and clock properties]
Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
[fcooper@ti.com: Update commit message and subject]
Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 arch/arm/boot/dts/keystone-k2g.dtsi | 56 +++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index bf4d1fa..b206b69 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -168,5 +168,61 @@
 				#reset-cells = <2>;
 			};
 		};
+
+		usb0_phy: usb-phy@0 {
+			compatible = "usb-nop-xceiv";
+			status = "disabled";
+		};
+
+		keystone_usb0: keystone-dwc3@2680000 {
+			compatible = "ti,keystone-dwc3";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x2680000 0x10000>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_EDGE_RISING>;
+			ranges;
+			dma-coherent;
+			dma-ranges;
+			status = "disabled";
+			power-domains = <&k2g_pds 0x0016>;
+
+			usb0: usb@2690000 {
+				compatible = "snps,dwc3";
+				reg = <0x2690000 0x10000>;
+				interrupts = <GIC_SPI 128 IRQ_TYPE_EDGE_RISING>;
+				maximum-speed = "high-speed";
+				dr_mode = "otg";
+				usb-phy = <&usb0_phy>;
+				status = "disabled";
+			};
+		};
+
+		usb1_phy: usb-phy@1 {
+			compatible = "usb-nop-xceiv";
+			status = "disabled";
+		};
+
+		keystone_usb1: keystone-dwc3@2580000 {
+			compatible = "ti,keystone-dwc3";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x2580000 0x10000>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
+			ranges;
+			dma-coherent;
+			dma-ranges;
+			status = "disabled";
+			power-domains = <&k2g_pds 0x0017>;
+
+			usb1: usb@2590000 {
+				compatible = "snps,dwc3";
+				reg = <0x2590000 0x10000>;
+				interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
+				maximum-speed = "high-speed";
+				dr_mode = "otg";
+				usb-phy = <&usb1_phy>;
+				status = "disabled";
+			};
+		};
 	};
 };
-- 
2.9.4.dirty
