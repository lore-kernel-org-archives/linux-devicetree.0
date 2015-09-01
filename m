From: Alban Bedel <albeu@free.fr>
Subject: [PATCH 4/4] MIPS: ath79: Enable the USB port on the TL-WR1043ND
Date: Tue,  1 Sep 2015 17:23:14 +0200
Message-ID: <1441120994-31476-5-git-send-email-albeu@free.fr>
References: <1441120994-31476-1-git-send-email-albeu@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441120994-31476-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alban Bedel <albeu@free.fr>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
index 003015a..cd51199 100644
--- a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
+++ b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
@@ -35,6 +35,10 @@
 			};
 		};
 
+		ehci@1b000100 {
+			status = "okay";
+		};
+
 		spi@1f000000 {
 			status = "okay";
 			num-cs = <1>;
-- 
2.0.0
