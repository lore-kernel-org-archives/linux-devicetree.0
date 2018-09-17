From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH v3 1/4] staging/vc04_services: Use correct cache line size
Date: Mon, 17 Sep 2018 09:22:21 +0100
Message-ID: <1537172544-104852-2-git-send-email-phil@raspberrypi.org>
References: <1537172544-104852-1-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1537172544-104852-1-git-send-email-phil@raspberrypi.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phil Elwell <phil@raspberrypi.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devel@driverdev.osuosl.org
List-Id: devicetree@vger.kernel.org

Use the compatible string in the DTB to select the correct cache line
size for the SoC - 32 for BCM2835, and 64 for BCM2836 and BCM2837.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
---
 .../interface/vchiq_arm/vchiq_2835_arm.c           |  4 ++-
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  | 35 +++++++++++++++-------
 .../vc04_services/interface/vchiq_arm/vchiq_arm.h  |  5 ++++
 3 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
index e767209..83d740f 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
@@ -109,7 +109,8 @@ free_pagelist(struct vchiq_pagelist_info *pagelistinfo,
 int vchiq_platform_init(struct platform_device *pdev, VCHIQ_STATE_T *state)
 {
 	struct device *dev = &pdev->dev;
-	struct rpi_firmware *fw = platform_get_drvdata(pdev);
+	struct vchiq_drvdata *drvdata = platform_get_drvdata(pdev);
+	struct rpi_firmware *fw = drvdata->fw;
 	VCHIQ_SLOT_ZERO_T *vchiq_slot_zero;
 	struct resource *res;
 	void *slot_mem;
@@ -127,6 +128,7 @@ int vchiq_platform_init(struct platform_device *pdev, VCHIQ_STATE_T *state)
 	if (err < 0)
 		return err;
 
+	g_cache_line_size = drvdata->cache_line_size;
 	g_fragments_size = 2 * g_cache_line_size;
 
 	/* Allocate space for the channels in coherent memory */
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index bc05c69..ea78937 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -170,6 +170,14 @@ static struct device *vchiq_dev;
 static DEFINE_SPINLOCK(msg_queue_spinlock);
 static struct platform_device *bcm2835_camera;
 
+static struct vchiq_drvdata bcm2835_drvdata = {
+	.cache_line_size = 32,
+};
+
+static struct vchiq_drvdata bcm2836_drvdata = {
+	.cache_line_size = 64,
+};
+
 static const char *const ioctl_names[] = {
 	"CONNECT",
 	"SHUTDOWN",
@@ -3573,12 +3581,25 @@ void vchiq_platform_conn_state_changed(VCHIQ_STATE_T *state,
 	}
 }
 
+static const struct of_device_id vchiq_of_match[] = {
+	{ .compatible = "brcm,bcm2835-vchiq", .data = &bcm2835_drvdata },
+	{ .compatible = "brcm,bcm2836-vchiq", .data = &bcm2836_drvdata },
+	{},
+};
+MODULE_DEVICE_TABLE(of, vchiq_of_match);
+
 static int vchiq_probe(struct platform_device *pdev)
 {
 	struct device_node *fw_node;
-	struct rpi_firmware *fw;
+	const struct of_device_id *of_id;
+	struct vchiq_drvdata *drvdata;
 	int err;
 
+	of_id = of_match_node(vchiq_of_match, pdev->dev.of_node);
+	drvdata = (struct vchiq_drvdata *)of_id->data;
+	if (!drvdata)
+		return -EINVAL;
+
 	fw_node = of_find_compatible_node(NULL, NULL,
 					  "raspberrypi,bcm2835-firmware");
 	if (!fw_node) {
@@ -3586,12 +3607,12 @@ static int vchiq_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
-	fw = rpi_firmware_get(fw_node);
+	drvdata->fw = rpi_firmware_get(fw_node);
 	of_node_put(fw_node);
-	if (!fw)
+	if (!drvdata->fw)
 		return -EPROBE_DEFER;
 
-	platform_set_drvdata(pdev, fw);
+	platform_set_drvdata(pdev, drvdata);
 
 	err = vchiq_platform_init(pdev, &g_state);
 	if (err != 0)
@@ -3661,12 +3682,6 @@ static int vchiq_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id vchiq_of_match[] = {
-	{ .compatible = "brcm,bcm2835-vchiq", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, vchiq_of_match);
-
 static struct platform_driver vchiq_driver = {
 	.driver = {
 		.name = "bcm2835_vchiq",
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index 40bb0c6..2f3ebc9 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -123,6 +123,11 @@ typedef struct vchiq_arm_state_struct {
 
 } VCHIQ_ARM_STATE_T;
 
+struct vchiq_drvdata {
+	const unsigned int cache_line_size;
+	struct rpi_firmware *fw;
+};
+
 extern int vchiq_arm_log_level;
 extern int vchiq_susp_log_level;
 
-- 
2.7.4
