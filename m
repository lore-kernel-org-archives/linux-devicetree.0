From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH] pinctrl: fix DT bindings for marvell,kirkwood-pinctrl
Date: Wed, 14 Dec 2016 00:08:27 +0100
Message-ID: <20161213230827.GA5286@andreas>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Klinger <ak@it-klinger.de>
List-Id: devicetree@vger.kernel.org

On Marvell mv88f6180 mpp pins range from 0 to 19 as well as from 35 to 44.
This is already fixed in commit: 9573e7923007961799beff38bc5c5a7635634eef

This is the documentation change for above commit.

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 .../bindings/pinctrl/marvell,kirkwood-pinctrl.txt    | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/marvell,kirkwood-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/marvell,kirkwood-pinctrl.txt
index 730444a9a4de..6c0ea155b708 100644
--- a/Documentation/devicetree/bindings/pinctrl/marvell,kirkwood-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/marvell,kirkwood-pinctrl.txt
@@ -44,16 +44,16 @@ mpp16         16       gpio, sdio(d2), uart0(cts), uart1(rxd), mii(crs)
 mpp17         17       gpio, sdio(d3)
 mpp18         18       gpo, nand(io0)
 mpp19         19       gpo, nand(io1)
-mpp20         20       gpio, mii(rxerr)
-mpp21         21       gpio, audio(spdifi)
-mpp22         22       gpio, audio(spdifo)
-mpp23         23       gpio, audio(rmclk)
-mpp24         24       gpio, audio(bclk)
-mpp25         25       gpio, audio(sdo)
-mpp26         26       gpio, audio(lrclk)
-mpp27         27       gpio, audio(mclk)
-mpp28         28       gpio, audio(sdi)
-mpp29         29       gpio, audio(extclk)
+mpp35         35       gpio, mii(rxerr)
+mpp36         36       gpio, audio(spdifi)
+mpp37         37       gpio, audio(spdifo)
+mpp38         38       gpio, audio(rmclk)
+mpp39         39       gpio, audio(bclk)
+mpp40         40       gpio, audio(sdo)
+mpp41         41       gpio, audio(lrclk)
+mpp42         42       gpio, audio(mclk)
+mpp43         43       gpio, audio(sdi)
+mpp44         44       gpio, audio(extclk)
 
 * Marvell Kirkwood 88f6190
 
-- 
2.1.4

