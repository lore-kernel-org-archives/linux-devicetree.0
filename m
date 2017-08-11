From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 3/3] drivers: tee: rework optee_driver_{init,exit} to use platform device
Date: Fri, 11 Aug 2017 14:30:37 +0100
Message-ID: <1502458237-1683-4-git-send-email-sudeep.holla@arm.com>
References: <1502458237-1683-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502458237-1683-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andy Gross <andy.gross@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>
List-Id: devicetree@vger.kernel.org

Now that firmware_of_init takes care of populating all the devices
under the /firmware/ node, this patch reworks/removes custom
optee_driver_{init,exit} in favour of module_platform_driver.

Cc: Jens Wiklander <jens.wiklander@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/tee/optee/core.c | 74 ++++++++++++++++--------------------------------
 1 file changed, 25 insertions(+), 49 deletions(-)

diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index 58169e519422..6c368508e835 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -445,8 +445,9 @@ static optee_invoke_fn *get_invoke_func(struct device_node *np)
 	return ERR_PTR(-EINVAL);
 }
 
-static struct optee *optee_probe(struct device_node *np)
+static int optee_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	optee_invoke_fn *invoke_fn;
 	struct tee_shm_pool *pool;
 	struct optee *optee = NULL;
@@ -457,21 +458,21 @@ static struct optee *optee_probe(struct device_node *np)
 
 	invoke_fn = get_invoke_func(np);
 	if (IS_ERR(invoke_fn))
-		return (void *)invoke_fn;
+		return PTR_ERR(invoke_fn);
 
 	if (!optee_msg_api_uid_is_optee_api(invoke_fn)) {
 		pr_warn("api uid mismatch\n");
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 
 	if (!optee_msg_api_revision_is_compatible(invoke_fn)) {
 		pr_warn("api revision mismatch\n");
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 
 	if (!optee_msg_exchange_capabilities(invoke_fn, &sec_caps)) {
 		pr_warn("capabilities mismatch\n");
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 
 	/*
@@ -479,11 +480,11 @@ static struct optee *optee_probe(struct device_node *np)
 	 * doesn't have any reserved memory we can use we can't continue.
 	 */
 	if (!(sec_caps & OPTEE_SMC_SEC_CAP_HAVE_RESERVED_SHM))
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
 	pool = optee_config_shm_memremap(invoke_fn, &memremaped_shm);
 	if (IS_ERR(pool))
-		return (void *)pool;
+		return PTR_ERR(pool);
 
 	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
 	if (!optee) {
@@ -523,9 +524,10 @@ static struct optee *optee_probe(struct device_node *np)
 	optee->pool = pool;
 
 	optee_enable_shm_cache(optee);
+	platform_set_drvdata(pdev, optee);
 
 	pr_info("initialized driver\n");
-	return optee;
+	return 0;
 err:
 	if (optee) {
 		/*
@@ -541,11 +543,12 @@ static struct optee *optee_probe(struct device_node *np)
 		tee_shm_pool_free(pool);
 	if (memremaped_shm)
 		memunmap(memremaped_shm);
-	return ERR_PTR(rc);
+	return rc;
 }
 
-static void optee_remove(struct optee *optee)
+static int optee_remove(struct platform_device *pdev)
 {
+	struct optee *optee = platform_get_drvdata(pdev);
 	/*
 	 * Ask OP-TEE to free all cached shared memory objects to decrease
 	 * reference counters and also avoid wild pointers in secure world
@@ -568,52 +571,25 @@ static void optee_remove(struct optee *optee)
 	mutex_destroy(&optee->call_queue.mutex);
 
 	kfree(optee);
+	return 0;
 }
 
 static const struct of_device_id optee_match[] = {
 	{ .compatible = "linaro,optee-tz" },
 	{},
 };
+MODULE_DEVICE_TABLE(of, optee_match);
+
+static struct platform_driver optee_platdrv = {
+	.driver = {
+		.name = "optee",
+		.of_match_table = of_match_ptr(optee_match),
+	},
+	.probe = optee_probe,
+	.remove	= optee_remove,
+};
 
-static struct optee *optee_svc;
-
-static int __init optee_driver_init(void)
-{
-	struct device_node *fw_np;
-	struct device_node *np;
-	struct optee *optee;
-
-	/* Node is supposed to be below /firmware */
-	fw_np = of_find_node_by_name(NULL, "firmware");
-	if (!fw_np)
-		return -ENODEV;
-
-	np = of_find_matching_node(fw_np, optee_match);
-	of_node_put(fw_np);
-	if (!np)
-		return -ENODEV;
-
-	optee = optee_probe(np);
-	of_node_put(np);
-
-	if (IS_ERR(optee))
-		return PTR_ERR(optee);
-
-	optee_svc = optee;
-
-	return 0;
-}
-module_init(optee_driver_init);
-
-static void __exit optee_driver_exit(void)
-{
-	struct optee *optee = optee_svc;
-
-	optee_svc = NULL;
-	if (optee)
-		optee_remove(optee);
-}
-module_exit(optee_driver_exit);
+module_platform_driver(optee_platdrv);
 
 MODULE_AUTHOR("Linaro");
 MODULE_DESCRIPTION("OP-TEE driver");
-- 
2.7.4
