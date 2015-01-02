From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/2] ARM: mediatek: dts: Add uart to Aquaris5
Date: Fri,  2 Jan 2015 19:48:05 +0100
Message-ID: <1420224485-11043-3-git-send-email-matthias.bgg@gmail.com>
References: <1420224485-11043-1-git-send-email-matthias.bgg@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1420224485-11043-1-git-send-email-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch enables uart port for the Aquaris5 mobile phone.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm/boot/dts/mt6589-aquaris5.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mt6589-aquaris5.dts b/arch/arm/boot/dts/mt6589-aquaris5.dts
index 0da0470..d5cbfda 100644
--- a/arch/arm/boot/dts/mt6589-aquaris5.dts
+++ b/arch/arm/boot/dts/mt6589-aquaris5.dts
@@ -21,10 +21,16 @@
 	compatible = "mundoreader,bq-aquaris5", "mediatek,mt6589";
 
 	chosen {
-		bootargs = "earlyprintk";
+		bootargs = "console=ttyS0,921600n8 earlyprintk";
 	};
 
 	memory {
 		reg = <0x80000000 0x40000000>;
 	};
+
+	soc {
+		uart0: serial@11006000 {
+			status = "okay";
+		};
+	};
 };
-- 
1.9.1
