From: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: [PATCH RESED v2 2/4] firmware: meson_sm: Add secure power domain support
Date: Thu, 10 Oct 2019 04:21:16 -0400
Message-ID: <1570695678-42623-3-git-send-email-jianxin.pan@amlogic.com>
References: <1570695678-42623-1-git-send-email-jianxin.pan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1570695678-42623-1-git-send-email-jianxin.pan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
Cc: Jianxin Pan <jianxin.pan@amlogic.com>, Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>
List-Id: devicetree@vger.kernel.org

The Amlogic Meson A1/C1 Secure Monitor implements calls to control power
domain.

Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
---
 drivers/firmware/meson/meson_sm.c       | 2 ++
 include/linux/firmware/meson/meson_sm.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 1d5b4d7..7ec09f5 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -44,6 +44,8 @@ static const struct meson_sm_chip gxbb_chip = {
 		CMD(SM_EFUSE_WRITE,	0x82000031),
 		CMD(SM_EFUSE_USER_MAX,	0x82000033),
 		CMD(SM_GET_CHIP_ID,	0x82000044),
+		CMD(SM_PWRC_SET,	0x82000093),
+		CMD(SM_PWRC_GET,	0x82000095),
 		{ /* sentinel */ },
 	},
 };
diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index 6669e2a..4ed3989 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -12,6 +12,8 @@ enum {
 	SM_EFUSE_WRITE,
 	SM_EFUSE_USER_MAX,
 	SM_GET_CHIP_ID,
+	SM_PWRC_SET,
+	SM_PWRC_GET,
 };
 
 struct meson_sm_firmware;
-- 
2.7.4
