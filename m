From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [(RFC) PATCH v2 7/7] soc: qcom: aoss-qmp: Add cooling device support
Date: Sun,  6 Jan 2019 00:09:15 -0800
Message-ID: <20190106080915.4493-8-bjorn.andersson@linaro.org>
References: <20190106080915.4493-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190106080915.4493-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The AOSS provides three cooling devices "cx", "mx" and "ebi" that must
be enabled when temperature goes below a certain level to counter low
temperature issues. Probe these devices, when described in DeviceTree.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

We do not yet have the necessary support in the thermal framework to implement
the cooling device associated with the QMP, so I've just included this patch as
an RFC in this series.

 .../bindings/soc/qcom/qcom,aoss-qmp.txt       | 18 ++++++++++
 drivers/soc/qcom/aoss-qmp.c                   | 36 +++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
index 9b0d9785efe0..aae300f32421 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
@@ -42,6 +42,16 @@ power-domains.
 		    modem state (3), SLPI state (4), SPSS state (5) and Venus
 		    state (6).
 
+= SUBNODES
+The AOSS side channel also provides the controls for three cooling devices,
+these are expressed as subnodes of the QMP node. The name of the node is used
+to identify the resource and must therefor be "cx", "mx" or "ebi".
+
+- #cooling-cells:
+	Usage: optional
+	Value type: <u32>
+	Definition: must be 2
+
 = EXAMPLE
 
 The following example represents the AOSS side-channel message RAM and the
@@ -54,4 +64,12 @@ mechanism exposing the power-domains, as found in SDM845.
           mboxes = <&apss_shared 0>;
 
 	  #power-domain-cells = <1>;
+
+	  cx_cdev: cx {
+		#cooling-cells = <2>;
+	  };
+
+	  mx_cdev: mx {
+		#cooling-cells = <2>;
+	  };
   };
diff --git a/drivers/soc/qcom/aoss-qmp.c b/drivers/soc/qcom/aoss-qmp.c
index de52703b96b6..6e9299e3b2bd 100644
--- a/drivers/soc/qcom/aoss-qmp.c
+++ b/drivers/soc/qcom/aoss-qmp.c
@@ -33,6 +33,8 @@
 #define QMP_MAGIC	0x4d41494c
 #define QMP_VERSION	1
 
+#define QMP_MAX_COOLING_DEVICES		3
+
 /**
  * struct qmp - driver state for QMP implementation
  * @msgram: iomem referencing the message RAM used for communication
@@ -44,6 +46,8 @@
  * @event: wait_queue for synchronization with the IRQ
  * @tx_lock: provides syncrhonization between multiple callers of qmp_send()
  * @pd_pdev: platform device for the power-domain child device
+ * @cdev_pdevs: platform device for the cooling devices
+ * @cdev_count: number of valid @cdev_pdevs
  */
 struct qmp {
 	void __iomem *msgram;
@@ -60,6 +64,9 @@ struct qmp {
 	struct mutex tx_lock;
 
 	struct platform_device *pd_pdev;
+
+	struct platform_device *cdev_pdevs[QMP_MAX_COOLING_DEVICES];
+	size_t cdev_count;
 };
 
 static void qmp_kick(struct qmp *qmp)
@@ -230,6 +237,8 @@ EXPORT_SYMBOL(qmp_send);
 
 static int qmp_probe(struct platform_device *pdev)
 {
+	struct platform_device *cdev;
+	struct device_node *cdev_node;
 	struct resource *res;
 	struct qmp *qmp;
 	int irq;
@@ -279,13 +288,40 @@ static int qmp_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "failed to register AOSS PD\n");
 	}
 
+	for_each_available_child_of_node(pdev->dev.of_node, cdev_node) {
+		if (!of_property_read_bool(cdev_node, "#cooling-cells"))
+			continue;
+
+		/* Register cooling device, with its device_node as platform_data */
+		cdev = platform_device_register_data(&pdev->dev,
+						     "aoss_qmp_cdev",
+						     PLATFORM_DEVID_AUTO,
+						     of_node_get(cdev_node),
+						     sizeof(cdev_node));
+		if (IS_ERR(cdev)) {
+			dev_err(&pdev->dev,
+				"failed to register cooling device: %pOFn\n",
+				cdev_node);
+			continue;
+		}
+
+		qmp->cdev_pdevs[qmp->cdev_count++] = cdev;
+	}
+
 	return 0;
 }
 
 static int qmp_remove(struct platform_device *pdev)
 {
 	struct qmp *qmp = platform_get_drvdata(pdev);
+	struct device_node *np;
+	int i;
 
+	for (i = 0; i < qmp->cdev_count; i++) {
+		np = dev_get_platdata(&qmp->cdev_pdevs[i]->dev);
+		platform_device_unregister(qmp->cdev_pdevs[i]);
+		of_node_put(np);
+	}
 	platform_device_unregister(qmp->pd_pdev);
 
 	qmp_close(qmp);
-- 
2.18.0
