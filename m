From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 1/3] firmware: qcom: scm: Expose secure IO service
Date: Fri, 26 May 2017 23:33:06 -0700
Message-ID: <20170527063308.10483-1-bjorn.andersson@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Brown <david.brown@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The secure IO service provides operations for reading and writing secure
memory from non-secure mode, expose this API through SCM.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Correct scm-call return value handling
- Make scm_io_readl() return data by reference

 drivers/firmware/qcom_scm-32.c | 18 ++++++++++++++++++
 drivers/firmware/qcom_scm-64.c | 31 +++++++++++++++++++++++++++++++
 drivers/firmware/qcom_scm.c    | 12 ++++++++++++
 drivers/firmware/qcom_scm.h    |  6 ++++++
 include/linux/qcom_scm.h       |  4 ++++
 5 files changed, 71 insertions(+)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 93e3b96b6dfa..11fdb1584823 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -596,3 +596,21 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 {
 	return -ENODEV;
 }
+
+int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
+			unsigned int *val)
+{
+	int ret;
+
+	ret = qcom_scm_call_atomic1(QCOM_SCM_SVC_IO, QCOM_SCM_IO_READ, addr);
+	if (ret >= 0)
+		*val = ret;
+
+	return ret < 0 ? ret : 0;
+}
+
+int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
+{
+	return qcom_scm_call_atomic2(QCOM_SCM_SVC_IO, QCOM_SCM_IO_WRITE,
+				     addr, val);
+}
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 6e6d561708e2..bf50fb59852e 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -439,3 +439,34 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 
 	return ret;
 }
+
+int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
+			unsigned int *val)
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
+	if (ret >= 0)
+		*val = res.a1;
+
+	return ret < 0 ? ret : 0;
+}
+
+int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
+{
+	struct qcom_scm_desc desc = {0};
+	struct arm_smccc_res res;
+
+	desc.args[0] = addr;
+	desc.args[1] = val;
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	return qcom_scm_call(dev, QCOM_SCM_SVC_IO, QCOM_SCM_IO_WRITE,
+			     &desc, &res);
+}
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index bb16510d75ba..e18d63935648 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -333,6 +333,18 @@ int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
 }
 EXPORT_SYMBOL(qcom_scm_iommu_secure_ptbl_init);
 
+int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val)
+{
+	return __qcom_scm_io_readl(__scm->dev, addr, val);
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
index 9bea691f30fb..a60e4b9b1394 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -30,6 +30,12 @@ extern int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus);
 #define QCOM_SCM_CMD_CORE_HOTPLUGGED	0x10
 extern void __qcom_scm_cpu_power_down(u32 flags);
 
+#define QCOM_SCM_SVC_IO			0x5
+#define QCOM_SCM_IO_READ		0x1
+#define QCOM_SCM_IO_WRITE		0x2
+extern int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr, unsigned int *val);
+extern int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val);
+
 #define QCOM_SCM_SVC_INFO		0x6
 #define QCOM_IS_CALL_AVAIL_CMD		0x1
 extern int __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index e5380471c2cd..e8357f570695 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -43,6 +43,8 @@ extern int qcom_scm_set_remote_state(u32 state, u32 id);
 extern int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
 extern int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
 extern int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
+extern int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
+extern int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
 #else
 static inline
 int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
@@ -73,5 +75,7 @@ qcom_scm_set_remote_state(u32 state,u32 id) { return -ENODEV; }
 static inline int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare) { return -ENODEV; }
 static inline int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size) { return -ENODEV; }
 static inline int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare) { return -ENODEV; }
+static inline int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val) { return -ENODEV; }
+static inline int qcom_scm_io_writel(phys_addr_t addr, unsigned int val) { return -ENODEV; }
 #endif
 #endif
-- 
2.12.0
