From: Camelia Groza <camelia.groza@nxp.com>
Subject: [PATCH 1/3] powerpc/configs/dpaa: enable the Cortina PHY driver
Date: Wed, 18 Jul 2018 14:46:49 +0300
Message-ID: <d372017b89bd1c5da5d9d3e7e6b3ddce69158181.1531903211.git.camelia.groza@nxp.com>
References: <cover.1531903211.git.camelia.groza@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1531903211.git.camelia.groza@nxp.com>
In-Reply-To: <cover.1531903211.git.camelia.groza@nxp.com>
References: <cover.1531903211.git.camelia.groza@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, benh@kernel.crashing.org
Cc: paulus@samba.org, mpe@ellerman.id.au, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Camelia Groza <camelia.groza@nxp.com>
List-Id: devicetree@vger.kernel.org

Cortina PHYs are present on T4240RDB and T2080RDB. Enable the driver
by default.

Signed-off-by: Camelia Groza <camelia.groza@nxp.com>
---
 arch/powerpc/configs/dpaa.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/dpaa.config b/arch/powerpc/configs/dpaa.config
index 2fe76f5..4ffacaf 100644
--- a/arch/powerpc/configs/dpaa.config
+++ b/arch/powerpc/configs/dpaa.config
@@ -2,3 +2,4 @@ CONFIG_FSL_DPAA=y
 CONFIG_FSL_PAMU=y
 CONFIG_FSL_FMAN=y
 CONFIG_FSL_DPAA_ETH=y
+CONFIG_CORTINA_PHY=y
-- 
1.9.1
