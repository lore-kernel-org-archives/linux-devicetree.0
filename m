From: Alexander Filippov <a.filippov@yadro.com>
Subject: [PATCH] ARM: dts: vesnin: Add power_green led
Date: Wed, 18 Sep 2019 15:38:15 +0300
Message-ID: <20190918123815.20653-1-a.filippov@yadro.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-aspeed@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Alexander Filippov <a.filippov@yadro.com>
List-Id: devicetree@vger.kernel.org

Adds a new power_green led to show the host state.

Signed-off-by: Alexander Filippov <a.filippov@yadro.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
index a27c88d23056..affd2c8743b1 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
@@ -43,6 +43,10 @@
 			gpios = <&gpio ASPEED_GPIO(N, 1) GPIO_ACTIVE_LOW>;
 		};
 
+		power_green {
+			gpios = <&gpio ASPEED_GPIO(F, 1) GPIO_ACTIVE_LOW>;
+		};
+
 		id_blue {
 			gpios = <&gpio ASPEED_GPIO(O, 0) GPIO_ACTIVE_LOW>;
 		};
-- 
2.21.0
