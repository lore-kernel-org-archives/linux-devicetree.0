From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 1/2] ARM: vexpress: add basic DT platform matching support
Date: Wed, 13 Apr 2011 19:02:20 +0100
Message-ID: <1302717741-18753-2-git-send-email-lorenzo.pieralisi@arm.com>
References: <1302717741-18753-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1302717741-18753-1-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds a DT match table to the Versatile Express machine
description in order to enable basic device tree support.

Tested on a Versatile Express board where the device tree blob is
passed to the kernel by u-boot.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/mach-vexpress/v2m.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-vexpress/v2m.c b/arch/arm/mach-vexpress/v2m.c
index ba46e8e..e318df3 100644
--- a/arch/arm/mach-vexpress/v2m.c
+++ b/arch/arm/mach-vexpress/v2m.c
@@ -437,6 +437,11 @@ static void __init v2m_init(void)
 	ct_desc->init_tile();
 }
 
+static const char *vexpress_dt_match[] __initdata = {
+	"arm,vexpress",
+	NULL,
+};
+
 MACHINE_START(VEXPRESS, "ARM-Versatile Express")
 	.boot_params	= PLAT_PHYS_OFFSET + 0x00000100,
 	.map_io		= v2m_map_io,
@@ -444,4 +449,5 @@ MACHINE_START(VEXPRESS, "ARM-Versatile Express")
 	.init_irq	= v2m_init_irq,
 	.timer		= &v2m_timer,
 	.init_machine	= v2m_init,
+	.dt_compat	= vexpress_dt_match,
 MACHINE_END
-- 
1.7.4.4
