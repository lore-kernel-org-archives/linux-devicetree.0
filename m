From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH 2/2] tee: optee: allow selection of ti-smc as a calling method
Date: Mon, 18 Sep 2017 15:50:05 -0500
Message-ID: <20170918205005.30235-2-afd@ti.com>
References: <20170918205005.30235-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170918205005.30235-1-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Jens Wiklander <jens.wiklander@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

On TI platforms OP-TEE must be called using a modified SMC call,
allow the selection of this though DT.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.txt | 2 ++
 drivers/tee/optee/core.c                                           | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.txt b/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.txt
index d38834c67dff..a3275ecdf186 100644
--- a/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.txt
+++ b/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.txt
@@ -20,6 +20,8 @@ the reference implementation maintained by Linaro.
                    "hvc" : HVC #0, with the register assignments specified
 		           in drivers/tee/optee/optee_smc.h
 
+                   "ti-smc" : Similar to "smc" with TI specific register
+		              adjustments
 
 
 Example:
diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index 7952357df9c8..dfa9de590d98 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -441,6 +441,8 @@ static optee_invoke_fn *get_invoke_func(struct device_node *np)
 		return optee_smccc_hvc;
 	else if (!strcmp("smc", method))
 		return optee_smccc_smc;
+	else if (!strcmp("ti-smc", method))
+		return arm_ti_smccc_smc;
 
 	pr_warn("invalid \"method\" property: %s\n", method);
 	return ERR_PTR(-EINVAL);
-- 
2.14.1
