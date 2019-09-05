Return-Path: <SRS0=bKmG=XA=flex--osk.bounces.google.com=3ph5xXQMKB5kHLD9HH9E7.5HFKH4A+6MD7KG7E.HK9@kernel.org>
Date: Thu,  5 Sep 2019 10:41:30 -0400
In-Reply-To: <20190905144130.220713-1-osk@google.com>
Message-Id: <20190905144130.220713-3-osk@google.com>
Mime-Version: 1.0
References: <20190905144130.220713-1-osk@google.com>
Subject: [PATCH v3 3/3] arm: dts: aspeed: Add vuart aspeed,sirq-polarity-sense
 to aspeed-g5.dtsi
From: Oskar Senft <osk@google.com>
Content-Type: text/plain; charset="UTF-8"
To: joel@jms.id.au, andrew@aj.id.au, robh+dt@kernel.org, gregkh@linuxfoundation.org, jk@ozlabs.org
Cc: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, Oskar Senft <osk@google.com>
List-ID: <devicetree@vger.kernel.org>

Enable auto-configuration of VUART SIRQ polarity on AST2500.

Signed-off-by: Oskar Senft <osk@google.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 5b1ca265c2ce..06e489c1d0cb 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -351,6 +351,7 @@
 				interrupts = <8>;
 				clocks = <&syscon ASPEED_CLK_APB>;
 				no-loopback-test;
+				aspeed,sirq-polarity-sense = <&syscon 0x70 25>;
 				status = "disabled";
 			};
 
-- 
2.23.0.187.g17f5b7556c-goog
