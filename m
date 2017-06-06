From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v4 25/28] ARM: dts: s500: Add SPS node
Date: Tue,  6 Jun 2017 02:54:23 +0200
Message-ID: <20170606005426.26446-26-afaerber@suse.de>
References: <20170606005426.26446-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170606005426.26446-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: mp-cs@actions-semi.com, Thomas Liau <thomas.liau@actions-semi.com>, =?UTF-8?q?=E5=BC=A0=E4=B8=9C=E9=A3=8E?= <zhangdf@actions-semi.com>, =?UTF-8?q?=E5=88=98=E7=82=9C?= <liuwei@actions-semi.com>, =?UTF-8?q?=E5=BC=A0=E5=A4=A9=E7=9B=8A?= <tyzhang@actions-semi.com>, 96boards@ucrobotics.com, support@lemaker.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add Smart Power System node for PM domains.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v3 -> v4:
 * Extended commit message
 * Split off association of power-domains (avoids include/dt-bindings/ dependency)
 
 v3: new
 
 arch/arm/boot/dts/s500.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/s500.dtsi b/arch/arm/boot/dts/s500.dtsi
index 6d6024027ee2..51a48741d4c0 100644
--- a/arch/arm/boot/dts/s500.dtsi
+++ b/arch/arm/boot/dts/s500.dtsi
@@ -176,5 +176,11 @@
 			             <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "2hz0", "2hz1", "timer0", "timer1";
 		};
+
+		sps: power-controller@b01b0100 {
+			compatible = "actions,s500-sps";
+			reg = <0xb01b0100 0x100>;
+			#power-domain-cells = <1>;
+		};
 	};
 };
-- 
2.12.3
