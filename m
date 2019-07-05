From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [RESEND PATCH next v2 6/6] ARM: configs: keystone: enable cpts
Date: Fri, 5 Jul 2019 18:12:47 +0300
Message-ID: <20190705151247.30422-7-grygorii.strashko@ti.com>
References: <20190705151247.30422-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705151247.30422-1-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Sekhar Nori <nsekhar@ti.com>, Murali Karicheri <m-karicheri2@ti.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: devicetree@vger.kernel.org

Enable CPTS support which is present in Network Coprocessor Gigabit
Ethernet (GbE) Switch Subsystem.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/configs/keystone_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index 72fee57aad2f..0b2281407ecf 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -136,6 +136,7 @@ CONFIG_BLK_DEV_SD=y
 CONFIG_NETDEVICES=y
 CONFIG_TI_KEYSTONE_NETCP=y
 CONFIG_TI_KEYSTONE_NETCP_ETHSS=y
+CONFIG_TI_CPTS=y
 CONFIG_MARVELL_PHY=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
-- 
2.17.1
