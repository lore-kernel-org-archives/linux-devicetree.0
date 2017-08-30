From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Applied "regulator: Add STM32 Voltage Reference Buffer" to the regulator tree
Date: Wed, 30 Aug 2017 18:57:22 +0100
Message-ID: <E1dn7Ew-0001IE-Tp@debutante>
References: <1499776233-29116-2-git-send-email-fabrice.gasnier@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499776233-29116-2-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, fabrice.gasnier-qxv4g6HH51o@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglinux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: Add STM32 Voltage Reference Buffer

has been applied to the regulator tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

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

>From ef7bb293a670c7a81c7a5b8aad6b93ba32e0e9ec Mon Sep 17 00:00:00 2001
From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Date: Wed, 30 Aug 2017 17:55:27 +0200
Subject: [PATCH] regulator: Add STM32 Voltage Reference Buffer

Document STM32 VREFBUF (voltage reference buffer) which can be used as
voltage reference for ADCs, DACs and external components.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../bindings/regulator/st,stm32-vrefbuf.txt          | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt

diff --git a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt
new file mode 100644
index 000000000000..3944ee3e731e
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt
@@ -0,0 +1,20 @@
+STM32 VREFBUF - Voltage reference buffer
+
+Some STM32 devices embed a voltage reference buffer which can be used as
+voltage reference for ADCs, DACs and also as voltage reference for external
+components through the dedicated VREF+ pin.
+
+Required properties:
+- compatible:		Must be "st,stm32-vrefbuf".
+- reg:			Offset and length of VREFBUF register set.
+- clocks:		Must contain an entry for peripheral clock.
+
+Example:
+	vrefbuf: regulator@58003C00 {
+		compatible = "st,stm32-vrefbuf";
+		reg = <0x58003C00 0x8>;
+		clocks = <&rcc VREF_CK>;
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <2500000>;
+		vdda-supply = <&vdda>;
+	};
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
