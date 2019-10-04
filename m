From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: Document "regulator-boot-on" binding more thoroughly" to the regulator tree
Date: Fri,  4 Oct 2019 18:52:43 +0100 (BST)
Message-ID: <20191004175243.843C82741EF2@ypsilon.sirena.org.uk>
References: <20191001124531.v2.1.Ice34ad5970a375c3c03cb15c3859b3ee501561bf@changeid>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191001124531.v2.1.Ice34ad5970a375c3c03cb15c3859b3ee501561bf@changeid>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: ckeepax@opensource.cirrus.com, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, zhang.chunyan@linaro.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: Document "regulator-boot-on" binding more thoroughly

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 87fd0db6d7df1cf4cc6e9b09e2155d1f324bf836 Mon Sep 17 00:00:00 2001
From: Douglas Anderson <dianders@chromium.org>
Date: Tue, 1 Oct 2019 12:45:54 -0700
Subject: [PATCH] regulator: Document "regulator-boot-on" binding more
 thoroughly

The description of "regulator-boot-on" was a little unclear, at least
to me.  Did this property mean that we should turn the regulator on at
boot?  Or perhaps it was intended only to be used for regulators where
we couldn't read the state at bootup to indicate what state we should
assume?  The answer, it turns out, is both [1].

Let's document this.

[1] https://lore.kernel.org/r/20190923181431.GU2036@sirena.org.uk

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Link: https://lore.kernel.org/r/20191001124531.v2.1.Ice34ad5970a375c3c03cb15c3859b3ee501561bf@changeid
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/regulator/regulator.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b/Documentation/devicetree/bindings/regulator/regulator.yaml
index 02c3043ce419..92ff2e8ad572 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
@@ -38,7 +38,12 @@ properties:
     type: boolean
 
   regulator-boot-on:
-    description: bootloader/firmware enabled regulator
+    description: bootloader/firmware enabled regulator.
+      It's expected that this regulator was left on by the bootloader.
+      If the bootloader didn't leave it on then OS should turn it on
+      at boot but shouldn't prevent it from being turned off later.
+      This property is intended to only be used for regulators where
+      software cannot read the state of the regulator.
     type: boolean
 
   regulator-allow-bypass:
-- 
2.20.1
