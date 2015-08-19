From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Subject: [PATCH 1/2] dt-bindings: Fix tipo in st,clkgen-pll documentation
Date: Wed, 19 Aug 2015 10:48:13 +0200
Message-ID: <1439974094-32322-2-git-send-email-gabriel.fernandez@linaro.org>
References: <1439974094-32322-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439974094-32322-1-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, Olivier Bideau <olivier.bideau@st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Fabian Frederick <fabf@skynet.be>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

replace "sst,plls-c32-cx_x" by "st,plls-c32-cx_x"

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
---
 Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt b/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
index d8b168e..e2c6db0 100644
--- a/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
+++ b/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
@@ -21,8 +21,8 @@ Required properties:
 	"st,stih416-plls-c32-ddr",	"st,clkgen-plls-c32"
 	"st,stih407-plls-c32-a0",	"st,clkgen-plls-c32"
 	"st,stih407-plls-c32-a9",	"st,clkgen-plls-c32"
-	"sst,plls-c32-cx_0",		"st,clkgen-plls-c32"
-	"sst,plls-c32-cx_1",		"st,clkgen-plls-c32"
+	"st,plls-c32-cx_0",		"st,clkgen-plls-c32"
+	"st,plls-c32-cx_1",		"st,clkgen-plls-c32"
 
 	"st,stih415-gpu-pll-c32",	"st,clkgengpu-pll-c32"
 	"st,stih416-gpu-pll-c32",	"st,clkgengpu-pll-c32"
-- 
1.9.1
