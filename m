From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] drivers: firmware: psci: unify enable-method binding on ARM {64,32}-bit systems
Date: Fri, 22 Apr 2016 15:38:31 +0100
Message-ID: <1461335911-13233-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Soby Mathew <Soby.Mathew-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Currently ARM CPUs DT bindings allows different enable-method value for
PSCI based systems. On ARM 64-bit this property is required and must be
"psci" while on ARM 32-bit systems this property is optional and must
be "arm,psci".

This is problematic if 32-bit OS is run on 64-bit system which has
"psci" as enable-method rather than the expected "arm,psci".

So let's unify the value into "psci" and remove support for "arm,psci"
before it finds any users.

Reported-by: Soby Mathew <Soby.Mathew-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/cpus.txt | 1 -
 drivers/firmware/psci.c                        | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index ccc62f145306..3f0cbbb8395f 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -192,7 +192,6 @@ nodes to be present and contain the properties described below.
 			  can be one of:
 			    "allwinner,sun6i-a31"
 			    "allwinner,sun8i-a23"
-			    "arm,psci"
 			    "arm,realview-smp"
 			    "brcm,bcm-nsp-smp"
 			    "brcm,brahma-b15"
diff --git a/drivers/firmware/psci.c b/drivers/firmware/psci.c
index 11bfee8b79a9..b5d05807e6ec 100644
--- a/drivers/firmware/psci.c
+++ b/drivers/firmware/psci.c
@@ -360,7 +360,7 @@ static struct cpuidle_ops psci_cpuidle_ops __initdata = {
 	.init = psci_dt_cpu_init_idle,
 };
 
-CPUIDLE_METHOD_OF_DECLARE(psci, "arm,psci", &psci_cpuidle_ops);
+CPUIDLE_METHOD_OF_DECLARE(psci, "psci", &psci_cpuidle_ops);
 #endif
 #endif
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
