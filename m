From: Loic Poulain <loic.poulain-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v5 3/3] Bluetooth: btqcomsmd: retieve BD address from DT
Date: Tue,  5 Sep 2017 20:58:43 +0200
Message-ID: <1504637923-21652-3-git-send-email-loic.poulain@linaro.org>
References: <1504637923-21652-1-git-send-email-loic.poulain@linaro.org>
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504637923-21652-1-git-send-email-loic.poulain-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org, johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Loic Poulain <loic.poulain-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Retrieve BD address from the DT local-bd-address property.
This address must be unique and is usually added in the DT
by the bootloader which has access to the provisioned data.

Signed-off-by: Loic Poulain <loic.poulain-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 v2: Set device as unconfigured if default address detected
     Add warning if BD addr retrieved from DT
 v3: if no addr retrieved from DT, unconditionally set
     the invalid BD addr flag.
     swap and set bdaddr in the platform probe
 v4: Add dt-bindings documentation
     split patch in two parts (setup, dt prop)
     use local-bd-address name instead of local-mac-address
 v5: remove 2/3 merged in bluetooth-next tree
     Add bluetooth.txt for common BT bindings
     expect local-bd-address in little-endian format

 drivers/bluetooth/btqcomsmd.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/bluetooth/btqcomsmd.c b/drivers/bluetooth/btqcomsmd.c
index bd810d0..c6d3fd9 100644
--- a/drivers/bluetooth/btqcomsmd.c
+++ b/drivers/bluetooth/btqcomsmd.c
@@ -15,6 +15,8 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/rpmsg.h>
+#include <linux/of.h>
+
 #include <linux/soc/qcom/wcnss_ctrl.h>
 #include <linux/platform_device.h>
 
@@ -135,6 +137,7 @@ static int btqcomsmd_setup(struct hci_dev *hdev)
 
 static int btqcomsmd_probe(struct platform_device *pdev)
 {
+	const bdaddr_t *bdaddr;
 	struct btqcomsmd *btq;
 	struct hci_dev *hdev;
 	void *wcnss;
@@ -156,6 +159,15 @@ static int btqcomsmd_probe(struct platform_device *pdev)
 	if (IS_ERR(btq->cmd_channel))
 		return PTR_ERR(btq->cmd_channel);
 
+	/* The local-bd-address DT property is usually injected by the
+	 * bootloader which has access to the allocated BD address.
+	 */
+	bdaddr = of_get_property(pdev->dev.of_node, "local-bd-address", &ret);
+	if (bdaddr && ret == sizeof(bdaddr_t)) {
+		BT_INFO("BD address %pMR retrieved from device-tree", bdaddr);
+		bacpy(&btq->bdaddr, bdaddr);
+	}
+
 	hdev = hci_alloc_dev();
 	if (!hdev)
 		return -ENOMEM;
-- 
1.9.1
