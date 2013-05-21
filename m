From: "Manjunathappa, Prakash" <prakash.pm@ti.com>
Subject: [PATCH 3/3] ARM: davinci: da850: adopt to pinctrl-single driver to configure multiple pins
Date: Tue, 21 May 2013 19:38:02 +0530
Message-ID: <1369145282-14419-5-git-send-email-prakash.pm@ti.com>
References: <1369145282-14419-1-git-send-email-prakash.pm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1369145282-14419-1-git-send-email-prakash.pm@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: nsekhar@ti.com, grant.likely@linaro.org, rob.herring@calxeda.com, linux@arm.linux.org.uk, rob@landley.net, tony@atomide.com, prabhakar.csengg@gmail.com, peter.ujfalusi@ti.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, davinci-linux-open-source@linux.davincidsp.com, "Manjunathappa, Prakash" <prakash.pm@ti.com>
List-Id: devicetree@vger.kernel.org

function-mask property is a mask for a pin at each pin configure offset
in a pincontrol register.

Signed-off-by: Manjunathappa, Prakash <prakash.pm@ti.com>
---
 arch/arm/boot/dts/da850.dtsi |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 4d43046..9bec36c 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -37,7 +37,7 @@
 			#size-cells = <0>;
 			pinctrl-single,bit-per-mux;
 			pinctrl-single,register-width = <32>;
-			pinctrl-single,function-mask = <0xffffffff>;
+			pinctrl-single,function-mask = <0xf>;
 			status = "disabled";
 
 			nand_cs3_pins: pinmux_nand_pins {
-- 
1.7.4.1

