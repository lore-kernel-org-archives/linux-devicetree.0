From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 4/5] arm64: dts: realtek: Add RTD1295 UART resets
Date: Wed, 16 Aug 2017 02:38:46 +0200
Message-ID: <20170816003847.6208-5-afaerber@suse.de>
References: <20170816003847.6208-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170816003847.6208-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Roc He <hepeng@zidoo.tv>, =?UTF-8?q?=E8=92=8B=E4=B8=BD=E7=90=B4?= <jiang.liqin@geniatech.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Associate the UART nodes with the corresponding reset controller bits.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 arch/arm64/boot/dts/realtek/rtd1295.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/rtd1295.dtsi b/arch/arm64/boot/dts/realtek/rtd1295.dtsi
index 9f1dcd1fa8b3..e777200d84b9 100644
--- a/arch/arm64/boot/dts/realtek/rtd1295.dtsi
+++ b/arch/arm64/boot/dts/realtek/rtd1295.dtsi
@@ -123,6 +123,7 @@
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			clock-frequency = <27000000>;
+			resets = <&iso_reset 8>;
 			status = "disabled";
 		};
 
@@ -132,6 +133,7 @@
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			clock-frequency = <432000000>;
+			resets = <&reset2 28>;
 			status = "disabled";
 		};
 
@@ -141,6 +143,7 @@
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			clock-frequency = <432000000>;
+			resets = <&reset2 27>;
 			status = "disabled";
 		};
 
-- 
2.12.3
