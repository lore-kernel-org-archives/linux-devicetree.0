From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 4/8] arm: dts: bcm283x: mark the UART pin muxing nodes with pinctrl-use-default
Date: Thu, 24 May 2018 12:50:20 -0500
Message-ID: <20180524175024.19874-5-robh@kernel.org>
References: <20180524175024.19874-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180524175024.19874-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Alexander Graf <agraf@suse.de>, Bjorn Andersson <bjorn.andersson@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, boot-architecture@lists.linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/boot/dts/bcm283x.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index ac00e730f898..c8b8ede3d273 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -321,6 +321,7 @@
 			};
 
 			uart0_gpio14: uart0_gpio14 {
+				pinctrl-use-default;
 				brcm,pins = <14 15>;
 				brcm,function = <BCM2835_FSEL_ALT0>;
 			};
@@ -353,6 +354,7 @@
 			};
 
 			uart1_gpio14: uart1_gpio14 {
+				pinctrl-use-default;
 				brcm,pins = <14 15>;
 				brcm,function = <BCM2835_FSEL_ALT5>;
 			};
-- 
2.17.0
