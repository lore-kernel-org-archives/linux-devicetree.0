From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 6/6] drivers: firmware: psci: add PSCI v1.0 DT bindings
Date: Fri, 29 May 2015 13:16:39 +0100
Message-ID: <1432901799-18359-7-git-send-email-lorenzo.pieralisi@arm.com>
References: <1432901799-18359-1-git-send-email-lorenzo.pieralisi@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432901799-18359-1-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Anup Patel <anup.patel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

PSCI 1.0 is designed to be fully compliant to the PSCI 0.2
specification, with minor differences that are described in the
PSCI specification.

In particular, PSCI v1.0 augments the specification with a new
power_state format (extended stateid - probeable through the
PSCI_FEATURES call), changes some function return codes and
functions usage requirements wrt PSCI 0.2. These changes mean
that 1.0 vs 0.2 compliancy should be enforced through a DT
compatible string that allows firmware to specify 1.0 only
compliancy so that older kernels are prevented from using
PSCI 1.0 FW implementations in a non-compatible way (eg by
calling a 1.0 FW implementation and expecting 0.2 behaviour).

This patch adds PSCI 1.0 DT bindings and related compatible
string.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Acked-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/psci.txt | 6 ++++++
 drivers/firmware/psci.c                        | 1 +
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.txt b/Documentation/devicetree/bindings/arm/psci.txt
index 5aa40ed..a9adab8 100644
--- a/Documentation/devicetree/bindings/arm/psci.txt
+++ b/Documentation/devicetree/bindings/arm/psci.txt
@@ -31,6 +31,10 @@ Main node required properties:
 					support, but are permitted to be present for compatibility with
 					existing software when "arm,psci" is later in the compatible list.
 
+				* "arm,psci-1.0" : for implementations complying to PSCI 1.0. PSCI 1.0 is
+					backward compatible with PSCI 0.2 with minor specification updates,
+					as defined in the PSCI specification[2].
+
  - method        : The method of calling the PSCI firmware. Permitted
                    values are:
 
@@ -100,3 +104,5 @@ Case 3: PSCI v0.2 and PSCI v0.1.
 
 [1] Kernel documentation - ARM idle states bindings
     Documentation/devicetree/bindings/arm/idle-states.txt
+[2] Power State Coordination Interface (PSCI) specification
+    http://infocenter.arm.com/help/topic/com.arm.doc.den0022c/DEN0022C_Power_State_Coordination_Interface.pdf
diff --git a/drivers/firmware/psci.c b/drivers/firmware/psci.c
index 4063784..68d0c2f 100644
--- a/drivers/firmware/psci.c
+++ b/drivers/firmware/psci.c
@@ -385,6 +385,7 @@ out_put_node:
 static const struct of_device_id psci_of_match[] __initconst = {
 	{ .compatible = "arm,psci",	.data = psci_0_1_init},
 	{ .compatible = "arm,psci-0.2",	.data = psci_0_2_init},
+	{ .compatible = "arm,psci-1.0",	.data = psci_0_2_init},
 	{},
 };
 
-- 
2.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
