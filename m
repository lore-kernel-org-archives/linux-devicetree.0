From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/4] drivers: of: initialize and assign reserved memory to
 newly created devices
Date: Wed, 02 Jul 2014 12:48:50 +0200
Message-ID: <1404298132-6050-3-git-send-email-m.szyprowski@samsung.com>
References: <1404298132-6050-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1404298132-6050-1-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Jon Medhurst <tixy@linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Tomasz Figa <t.figa@samsung.com>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Paul Mackerras <paulus@samba.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Josh Cartwright <joshc@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Grant Likely <grant.likely@linaro.org>, Laura Abbott <lauraa@codeaurora.org>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>, Michal Nazarewicz <mina86@mina86.com>, Marc <marc.ceeeee@gmail.com>, Nishanth Peethambaran <nishanth.p@gmail.com>, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K.V." <aneesh.kumar@linux.v>
List-Id: devicetree@vger.kernel.org

Use recently introduced of_reserved_mem_device_init() function to
automatically assign respective reserved memory region to the newly created
platform and amba device.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/of/platform.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 500436f9be7f..a9055d3da5c2 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -21,6 +21,7 @@
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 
 const struct of_device_id of_default_bus_match_table[] = {
@@ -233,12 +234,15 @@ static struct platform_device *of_platform_device_create_pdata(
 	dev->dev.bus = &platform_bus_type;
 	dev->dev.platform_data = platform_data;
 
+	of_reserved_mem_device_init(&dev->dev);
+
 	/* We do not fill the DMA ops for platform devices by default.
 	 * This is currently the responsibility of the platform code
 	 * to do such, possibly using a device notifier
 	 */
 
 	if (of_device_add(dev) != 0) {
+		of_reserved_mem_device_release(&dev->dev);
 		platform_device_put(dev);
 		goto err_clear_flag;
 	}
@@ -300,6 +304,8 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
 	else
 		of_device_make_bus_id(&dev->dev);
 
+	of_reserved_mem_device_init(&dev->dev);
+
 	/* Allow the HW Peripheral ID to be overridden */
 	prop = of_get_property(node, "arm,primecell-periphid", NULL);
 	if (prop)
@@ -326,6 +332,7 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
 	return dev;
 
 err_free:
+	of_reserved_mem_device_release(&dev->dev);
 	amba_device_put(dev);
 err_clear_flag:
 	of_node_clear_flag(node, OF_POPULATED);
-- 
1.9.2
