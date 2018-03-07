From: Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 1/6] staging: vc04_services: Replace "firmware" node with a compatible lookup.
Date: Wed,  7 Mar 2018 10:57:11 -0800
Message-ID: <20180307185716.17449-1-eric@anholt.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phil Elwell <phil@raspberrypi.org>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, bcm-kernel-feedback-list@broadcom.com, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

This was requested by Rob Herring in DT bindings review.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
v2: new patch

 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index f5cefda49b22..8068c0308b34 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -3594,7 +3594,8 @@ static int vchiq_probe(struct platform_device *pdev)
 	struct rpi_firmware *fw;
 	int err;
 
-	fw_node = of_parse_phandle(pdev->dev.of_node, "firmware", 0);
+	fw_node = of_find_compatible_node(NULL, NULL,
+					  "raspberrypi,bcm2835-firmware");
 	if (!fw_node) {
 		dev_err(&pdev->dev, "Missing firmware node\n");
 		return -ENOENT;
-- 
2.16.2
