From: megous@megous.com
Subject: [RESEND PATCH 4/5] arm64: dts: allwinner: h6: Add pin configs for uart1
Date: Fri, 23 Aug 2019 12:31:38 +0200
Message-ID: <20190823103139.17687-5-megous@megous.com>
References: <20190823103139.17687-1-megous@megous.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190823103139.17687-1-megous@megous.com>
Sender: netdev-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, Ondrej Jirman <megous@megous.com>
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

Orange Pi 3 uses UART1 for bluetooth. Add pinconfigs so that we can use
them.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 67f920e0fc33..7657e816096b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -298,6 +298,16 @@
 				pins = "PH0", "PH1";
 				function = "uart0";
 			};
+
+			uart1_pins: uart1-pins {
+				pins = "PG6", "PG7";
+				function = "uart1";
+			};
+
+			uart1_rts_cts_pins: uart1-rts-cts-pins {
+				pins = "PG8", "PG9";
+				function = "uart1";
+			};
 		};
 
 		gic: interrupt-controller@3021000 {
-- 
2.23.0
