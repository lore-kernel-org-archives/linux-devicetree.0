From: Arnaud Ebalard <arno@natisbad.org>
Subject: [PATCHv1 6/7] arm: dts: zynq: update isl9305 compatible string to use
 isil vendor prefix
Date: Tue, 16 Dec 2014 01:24:24 +0100
Message-ID: <00d11b4ecf8aad9c5480e1330384fb4a91072caf.1418688043.git.arno@natisbad.org>
References: <cover.1418688042.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <cover.1418688042.git.arno@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Michal Simek <michal.simek@xilinx.com>, =?utf-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Darshana Padmadas <darshanapadmadas@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Grant Likely <grant.likely@linaro.org>, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
List-Id: devicetree@vger.kernel.org


"isil" and "isl" prefixes are used at various locations inside the kernel
to reference Intersil corporation. This patch is part of a series fixing
those locations were "isl" is used in compatible strings to use the now
expected "isil" prefix instead (NASDAQ symbol for Intersil and most used
version).

Note: isl9305 is an I2C device so the patch does not in fact currently
depend on the introduction of "isil"-based compatible string in isl9305
driver (provided by another patch) because I2C core does not check the
prefix yet.

Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
---
 arch/arm/boot/dts/zynq-parallella.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dts/zynq-parallella.dts
index ab1dc0a56cdd..174571232ea5 100644
--- a/arch/arm/boot/dts/zynq-parallella.dts
+++ b/arch/arm/boot/dts/zynq-parallella.dts
@@ -58,7 +58,7 @@
 	status = "okay";
 
 	isl9305: isl9305@68 {
-		compatible = "isl,isl9305";
+		compatible = "isil,isl9305";
 		reg = <0x68>;
 
 		regulators {
-- 
2.1.1


