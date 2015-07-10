From: Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 1/6] Document: bindings: DT: Add SMP enable method for
 MT6580 SoC platform
Date: Fri, 10 Jul 2015 14:04:04 +0800
Message-ID: <1436508249-49338-2-git-send-email-scott.shu@mediatek.com>
References: <Scott Shu <scott.shu@gmail.com>
 <1436508249-49338-1-git-send-email-scott.shu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1436508249-49338-1-git-send-email-scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Radha Mohan Chintakuntla <rchintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, scott.shu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

For MT6580 SoC platform, the secondary cores are in powered off state
as default, so compared with MT65xx series SoC, one new enable method
is needed. This method using the SPM (System Power Manager) inside
the SCPSYS to control the CPU power.

Signed-off-by: Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/cpus.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index be35054..eaee089 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -195,6 +195,7 @@ nodes to be present and contain the properties described below.
 			    "marvell,armada-380-smp"
 			    "marvell,armada-390-smp"
 			    "marvell,armada-xp-smp"
+			    "mediatek,mt6580-smp"
 			    "mediatek,mt65xx-smp"
 			    "mediatek,mt81xx-tz-smp"
 			    "qcom,gcc-msm8660"
-- 
1.8.1.1.dirty
