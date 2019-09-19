From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 3/6] arm64: dts: rockchip: Use libretech model, compatible for ROC-PC
Date: Thu, 19 Sep 2019 10:58:19 +0530
Message-ID: <20190919052822.10403-4-jagan@amarulasolutions.com>
References: <20190919052822.10403-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919052822.10403-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Levin Du <djw@t-chip.com.cn>, Akash Gajjar <akash@openedev.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Da Xue <da@lessconfused.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Though the ROC-PC is manufactured by firefly, it is co-designed
by libretch like other Libretech computer boards from allwinner,
amlogic does.

So, it is always meaningful to keep maintain those vendors who
are part of design participation so-that the linux mainline
code will expose outside world who are the makers of such
hardware prototypes.

So,
- append the compatible to "libretech,roc-rk3399-pc" and
- update the model to "Libre Computer Board ROC-RK3399-PC"
  like other libretech computer boards does.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dts
index c53f3d571620..e09bcbdd92f5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dts
@@ -9,8 +9,8 @@
 #include "rk3399-opp.dtsi"
 
 / {
-	model = "Firefly ROC-RK3399-PC Board";
-	compatible = "firefly,roc-rk3399-pc", "rockchip,rk3399";
+	model = "Libre Computer Board ROC-RK3399-PC";
+	compatible = "libretech,roc-rk3399-pc", "firefly,roc-rk3399-pc", "rockchip,rk3399";
 
 	chosen {
 		stdout-path = "serial2:1500000n8";
-- 
2.18.0.321.gffc6fa0e3
