From: Murali Karicheri <m-karicheri2@ti.com>
Subject: [linux-next PATCH 4/4] ARM: keystone: k2g: enable micrel and dp83867 phys
Date: Fri, 11 May 2018 15:29:12 -0400
Message-ID: <1526066952-5230-5-git-send-email-m-karicheri2@ti.com>
References: <1526066952-5230-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526066952-5230-1-git-send-email-m-karicheri2@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ssantosh@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enable micrel and dp83867 phys for K2G Boards in keystone_defconfig
to support Network driver on these boards (K2G ICE and GP EVM).

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
---
 arch/arm/configs/keystone_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index 2536c23..85cf2fc 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -235,3 +235,5 @@ CONFIG_INPUT_GPIO_DECODER=m
 CONFIG_GPIO_PCA953X=m
 CONFIG_LEDS_TRIGGER_ACTIVITY=y
 CONFIG_LEDS_TRIGGER_CPU=y
+CONFIG_MICREL_PHY=y
+CONFIG_DP83867_PHY=y
-- 
1.9.1
