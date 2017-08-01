From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 6/6] ARM: configs: keystone: Enable MMC and regulators
Date: Tue, 1 Aug 2017 10:11:19 +0530
Message-ID: <20170801044119.16201-7-lokeshvutla@ti.com>
References: <20170801044119.16201-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170801044119.16201-1-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Keerthy <j-keerthy@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
List-Id: devicetree@vger.kernel.org

Enable the TI OMAP HSMMC and fixed regulator support
for keystone platforms.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 arch/arm/configs/keystone_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index d47ea43d097e..3397e91a5db1 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -156,6 +156,8 @@ CONFIG_POWER_RESET_KEYSTONE=y
 # CONFIG_HWMON is not set
 CONFIG_WATCHDOG=y
 CONFIG_DAVINCI_WATCHDOG=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_USB=y
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_MON=y
@@ -164,6 +166,8 @@ CONFIG_USB_STORAGE=y
 CONFIG_USB_DWC3=y
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_KEYSTONE_USB_PHY=y
+CONFIG_MMC=y
+CONFIG_MMC_OMAP_HS=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
-- 
2.13.0
