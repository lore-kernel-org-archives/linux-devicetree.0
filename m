From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Applied "regulator: added support for suspend states" to the regulator tree
Date: Fri, 26 Jan 2018 15:26:12 +0000
Message-ID: <E1ef5tM-0006fT-89@debutante>
References: <1516607961-379-1-git-send-email-zhang.chunyan@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516607961-379-1-git-send-email-zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: added support for suspend states

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

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

>From 057c76440c791eb31eb68f3b003f67d00fcce51a Mon Sep 17 00:00:00 2001
From: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Fri, 26 Jan 2018 21:08:43 +0800
Subject: [PATCH] regulator: added support for suspend states

Some systems need to set regulators to specific states when they enter
low power modes, especially around CPUs. There are many of these modes
depending on the particular runtime state.

Currently the regulator consumers are not granted permission to change
suspend state of regulator devices, the constraints are configured at
startup.  In order to allow changes in a vlotage range, we need to add
new properties for voltage range and a flag to give permission to
change the suspend voltage and suspend on/off in suspend mode.

Signed-off-by: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/regulator/regulator.txt | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index 378f6dc8b8bd..e459226dfac9 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -42,8 +42,16 @@ Optional properties:
 - regulator-state-[mem/disk] node has following common properties:
 	- regulator-on-in-suspend: regulator should be on in suspend state.
 	- regulator-off-in-suspend: regulator should be off in suspend state.
-	- regulator-suspend-microvolt: regulator should be set to this voltage
-	  in suspend.
+	- regulator-suspend-min-microvolt: minimum voltage may be set in
+	  suspend state.
+	- regulator-suspend-max-microvolt: maximum voltage may be set in
+	  suspend state.
+	- regulator-suspend-microvolt: the default voltage which regulator
+	  would be set in suspend. This property is now deprecated, instead
+	  setting voltage for suspend mode via the API which regulator
+	  driver provides is recommended.
+	- regulator-changeable-in-suspend: whether the default voltage and
+	  the regulator on/off in suspend can be changed in runtime.
 	- regulator-mode: operating mode in the given suspend state.
 	  The set of possible operating modes depends on the capabilities of
 	  every hardware so the valid modes are documented on each regulator
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
