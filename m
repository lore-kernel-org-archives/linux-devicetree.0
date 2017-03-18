From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3] firmware: qcom: scm: Expose secure IO service
Date: Fri, 17 Mar 2017 21:15:21 -0700
Message-ID: <20170318041523.29757-1-bjorn.andersson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The secure IO service provides operations for reading and writing secure
memory from non-secure mode, expose this API through SCM.

Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---

32-bit version is untested.

 drivers/firmware/qcom_scm-32.c | 11 +++++++++++
 drivers/firmware/qcom_scm-64.c | 31 +++++++++++++++++++++++++++++++
 drivers/firmware/qcom_scm.c    | 12 ++++++++++++
 drivers/firmware/qcom_scm.h    |  6 ++++++
 include/linux/qcom_scm.h       |  4 ++++
 5 files changed, 64 insertions(+)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 8ad226c60374..4284745e5516 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -578,3 +578,14 @@ int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
 
 	return ret ? : le32_to_cpu(scm_ret);
 }
+
+int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr)
+{
+	return qcom_scm_call_atomic1(QCOM_SCM_SVC_IO, QCOM_SCM_IO_READ, addr);
+}
+
+int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
+{
+	return qcom_scm_call_atomic2(QCOM_SCM_SVC_IO, QCOM_SCM_IO_WRITE,
+				     addr, val);
+}
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index c9332590e8c6..eb92e67e9e41 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -381,3 +381,34 @@ int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
 
 	return ret ? : res.a1;
 }
+
+int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr)
+{
+	struct qcom_scm_desc desc = {0};
+	struct arm_smccc_res res;
+	int ret;
+
+	desc.args[0] = addr;
+	desc.arginfo = QCOM_SCM_ARGS(1);
+
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_IO, QCOM_SCM_IO_READ,
+			    &desc, &res);
+
+	return ret < 0 ? ret : res.a0;
+}
+
+int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
+{
+	struct qcom_scm_desc desc = {0};
+	struct arm_smccc_res res;
+	int ret;
+
+	desc.args[0] = addr;
+	desc.args[1] = val;
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_IO, QCOM_SCM_IO_WRITE,
+			    &desc, &res);
+
+	return ret ? : res.a0;
+}
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index d987bcc7489d..7a443e3afb6a 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -315,6 +315,18 @@ static const struct reset_control_ops qcom_scm_pas_reset_ops = {
 	.deassert = qcom_scm_pas_reset_deassert,
 };
 
+int qcom_scm_io_readl(phys_addr_t addr)
+{
+	return __qcom_scm_io_readl(__scm->dev, addr);
+}
+EXPORT_SYMBOL(qcom_scm_io_readl);
+
+int qcom_scm_io_writel(phys_addr_t addr, unsigned int val)
+{
+	return __qcom_scm_io_writel(__scm->dev, addr, val);
+}
+EXPORT_SYMBOL(qcom_scm_io_writel);
+
 /**
  * qcom_scm_is_available() - Checks if SCM is available
  */
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 6a0f15469344..327d5e0a1ec3 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -30,6 +30,12 @@ extern int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus);
 #define QCOM_SCM_CMD_CORE_HOTPLUGGED	0x10
 extern void __qcom_scm_cpu_power_down(u32 flags);
 
+#define QCOM_SCM_SVC_IO			0x5
+#define QCOM_SCM_IO_READ		0x1
+#define QCOM_SCM_IO_WRITE		0x2
+extern int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr);
+extern int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val);
+
 #define QCOM_SCM_SVC_INFO		0x6
 #define QCOM_IS_CALL_AVAIL_CMD		0x1
 extern int __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index d32f6f1a5225..d6e3c81907d8 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -40,6 +40,8 @@ extern int qcom_scm_pas_shutdown(u32 peripheral);
 extern void qcom_scm_cpu_power_down(u32 flags);
 extern u32 qcom_scm_get_version(void);
 extern int qcom_scm_set_remote_state(u32 state, u32 id);
+extern int qcom_scm_io_readl(phys_addr_t addr);
+extern int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
 #else
 static inline
 int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
@@ -67,5 +69,7 @@ static inline void qcom_scm_cpu_power_down(u32 flags) {}
 static inline u32 qcom_scm_get_version(void) { return 0; }
 static inline u32
 qcom_scm_set_remote_state(u32 state,u32 id) { return -ENODEV; }
+static inline int qcom_scm_io_readl(phys_addr_t addr) { return -ENODEV; }
+static inline int qcom_scm_io_writel(phys_addr_t addr, unsigned int val) { return -ENODEV; }
 #endif
 #endif
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
