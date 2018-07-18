From: Camelia Groza <camelia.groza@nxp.com>
Subject: [PATCH 0/3] powerpc/dpaa: use the Cortina PHY driver
Date: Wed, 18 Jul 2018 14:46:48 +0300
Message-ID: <cover.1531903211.git.camelia.groza@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, benh@kernel.crashing.org
Cc: paulus@samba.org, mpe@ellerman.id.au, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Camelia Groza <camelia.groza@nxp.com>
List-Id: devicetree@vger.kernel.org

The Cortina PHY on T2080RDB and T4240RDB requires the use of the
dedicated Cortina PHY driver. This patch series enables it for
DPAA platforms and uses it on T4240RDB and T2080RDB.

Camelia Groza (3):
  powerpc/configs/dpaa: enable the Cortina PHY driver
  powerpc/dts/fsl: t4240rdb: use the Cortina PHY driver compatible
  powerpc/dts/fsl: t2080rdb: use the Cortina PHY driver compatible

 arch/powerpc/boot/dts/fsl/t2080rdb.dts | 4 ++--
 arch/powerpc/boot/dts/fsl/t4240rdb.dts | 8 ++++----
 arch/powerpc/configs/dpaa.config       | 1 +
 3 files changed, 7 insertions(+), 6 deletions(-)

--
1.9.1
