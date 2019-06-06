Return-Path: <SRS0=gQZM=UF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36109 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbfFFNYs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Jun 2019 09:24:48 -0400
Received: by mail-lj1-f195.google.com with SMTP id i21so2024711ljj.3
        for <devicetree@vger.kernel.org>; Thu, 06 Jun 2019 06:24:46 -0700 (PDT)
From: Krzysztof Michonski <michonskikrzysztof@gmail.com>
Subject: [PATCH 1/2] meson_sm: Extend meson_sm driver to be compatible with gxl chip
Date: Thu,  6 Jun 2019 15:24:38 +0200
Message-Id: <20190606132439.25182-1-krzysztof.michonski@digitalstrom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: khilman@baylibre.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: afenkart@gmail.com, Krzysztof Michonski <michonskikrzysztof@gmail.com>
List-ID: <devicetree@vger.kernel.org>

From: Krzysztof Michonski <michonskikrzysztof@gmail.com>

Extend the meson_sm driver by adding gxl structure and SECURITY_KEY
commands.

Signed-off-by: Krzysztof Michonski <michonskikrzysztof@gmail.com>
---
 drivers/firmware/meson/meson_sm.c       | 14 ++++++++++++++
 include/linux/firmware/meson/meson_sm.h |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 29fbc818a573..b19489f759fc 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -54,6 +54,19 @@ struct meson_sm_chip gxbb_chip = {
 	},
 };
 
+struct meson_sm_chip gxl_chip = {
+	.shmem_size		= SZ_4K,
+	.cmd_shmem_in_base	= 0x82000023,
+	.cmd_shmem_out_base	= 0x82000024,
+	.cmd = {
+		CMD(SM_SECURITY_KEY_READ,	0x82000061),
+		CMD(SM_SECURITY_KEY_WRITE,	0x82000062),
+		CMD(SM_SECURITY_KEY_TELL,	0x82000063),
+		CMD(SM_GET_CHIP_ID,	0x82000044),
+		{ /* sentinel */ },
+	},
+};
+
 struct meson_sm_firmware {
 	const struct meson_sm_chip *chip;
 	void __iomem *sm_shmem_in_base;
@@ -269,6 +282,7 @@ static const struct attribute_group meson_sm_sysfs_attr_group = {
 
 static const struct of_device_id meson_sm_ids[] = {
 	{ .compatible = "amlogic,meson-gxbb-sm", .data = &gxbb_chip },
+	{ .compatible = "amlogic,meson-gxl-sm", .data = &gxl_chip },
 	{ /* sentinel */ },
 };
 
diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index f98c20dd266e..9352d35c6e96 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -18,6 +18,9 @@ enum {
 	SM_EFUSE_WRITE,
 	SM_EFUSE_USER_MAX,
 	SM_GET_CHIP_ID,
+	SM_SECURITY_KEY_READ,
+	SM_SECURITY_KEY_WRITE,
+	SM_SECURITY_KEY_TELL,
 };
 
 struct meson_sm_firmware;
-- 
2.21.0
