From: Alban Bedel <albeu@free.fr>
Subject: [PATCH 3/3] MIPS: ath79: Add the reset controller to the AR9132 dtsi
Date: Mon,  3 Aug 2015 19:23:53 +0200
Message-ID: <1438622633-9407-4-git-send-email-albeu@free.fr>
References: <1438622633-9407-1-git-send-email-albeu@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438622633-9407-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Alban Bedel <albeu@free.fr>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 arch/mips/boot/dts/qca/ar9132.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/boot/dts/qca/ar9132.dtsi b/arch/mips/boot/dts/qca/ar9132.dtsi
index 4759cff..fb7734e 100644
--- a/arch/mips/boot/dts/qca/ar9132.dtsi
+++ b/arch/mips/boot/dts/qca/ar9132.dtsi
@@ -115,6 +115,14 @@
 				interrupt-controller;
 				#interrupt-cells = <1>;
 			};
+
+			rst: reset-controller@1806001c {
+				compatible = "qca,ar9132-reset",
+						"qca,ar7100-reset";
+				reg = <0x1806001c 0x4>;
+
+				#reset-cells = <1>;
+			};
 		};
 
 		spi@1f000000 {
-- 
2.0.0
