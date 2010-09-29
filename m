From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 2/7] of: MTD: Fix OF probing on little-endian systems
Date: Wed, 29 Sep 2010 15:52:13 +1000
Message-ID: <1285739538-29058-3-git-send-email-monstr@monstr.eu>
References: <1285739538-29058-1-git-send-email-monstr@monstr.eu>
	<1285739538-29058-2-git-send-email-monstr@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1285739538-29058-2-git-send-email-monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, duyl-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linnj-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, edgar.iglesias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Convert big-endian DTB to little-endian if necessary.

Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
CC: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
CC: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
CC: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
CC: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
CC: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
CC: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
---
 drivers/mtd/maps/physmap_of.c |    2 +-
 drivers/mtd/ofpart.c          |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index fe63f6b..ec3edf6 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -294,7 +294,7 @@ static int __devinit of_flash_probe(struct platform_device *dev,
 		info->list[i].map.name = dev_name(&dev->dev);
 		info->list[i].map.phys = res.start;
 		info->list[i].map.size = res_size;
-		info->list[i].map.bankwidth = *width;
+		info->list[i].map.bankwidth = be32_to_cpup(width);
 
 		err = -ENOMEM;
 		info->list[i].map.virt = ioremap(info->list[i].map.phys,
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 8bf7dc6..7bd171e 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -53,8 +53,8 @@ int __devinit of_mtd_parse_partitions(struct device *dev,
 			continue;
 		}
 
-		(*pparts)[i].offset = reg[0];
-		(*pparts)[i].size = reg[1];
+		(*pparts)[i].offset = be32_to_cpu(reg[0]);
+		(*pparts)[i].size = be32_to_cpu(reg[1]);
 
 		partname = of_get_property(pp, "label", &len);
 		if (!partname)
-- 
1.5.5.1
