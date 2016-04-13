From: Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH 6/6] Revert "staging: fsl-mc: Do not allow building as a
 module"
Date: Wed, 13 Apr 2016 12:30:56 +0200
Message-ID: <1460543456-11345-7-git-send-email-mbrugger@suse.com>
References: <1460543456-11345-1-git-send-email-mbrugger@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1460543456-11345-1-git-send-email-mbrugger@suse.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, frowand.list@gmail.com, grant.likely@linaro.org, German.Rivera@freescale.com, jiang.liu@linux.intel.com, marc.zyngier@arm.com, tglx@linutronix.de
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, bp@suse.de, mbrugger@suse.com, bhaktipriya96@gmail.com, stuart.yoder@nxp.com, agraf@suse.de, jroedel@suse.de, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, treding@nvidia.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Matthias Brugger <matthias.bgg@gmail.com>

This reverts commit <dfb11fe2281c> ("staging: fsl-mc: Do not allow building as a module")

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 drivers/staging/fsl-mc/bus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fsl-mc/bus/Kconfig b/drivers/staging/fsl-mc/bus/Kconfig
index 1f95933..c498ac6 100644
--- a/drivers/staging/fsl-mc/bus/Kconfig
+++ b/drivers/staging/fsl-mc/bus/Kconfig
@@ -7,7 +7,7 @@
 #
 
 config FSL_MC_BUS
-	bool "Freescale Management Complex (MC) bus driver"
+	tristate "Freescale Management Complex (MC) bus driver"
 	depends on OF && ARM64
 	select GENERIC_MSI_IRQ_DOMAIN
 	help
-- 
2.6.6
