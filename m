From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 07/17] ARM: dts: witherspoon: Cleanup gpio-keys-polled properties
Date: Fri, 26 Jul 2019 15:09:49 +0930
Message-ID: <20190726053959.2003-8-andrew@aj.id.au>
References: <20190726053959.2003-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190726053959.2003-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-aspeed@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

dtbs_check gave the following warning:

    Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 08facb2120b2..06319c6771ca 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -77,8 +77,6 @@
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <1000>;
 
 		fan0-presence {
-- 
2.20.1
