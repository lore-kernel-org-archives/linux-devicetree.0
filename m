From: Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 2/6] ARM: davinci: remove rtc kicker release
Date: Wed, 25 Jul 2012 11:42:13 +0530
Message-ID: <2b8ac8b7d69c1629b5e4ed1e892d358add82fe1d.1343191280.git.afzal@ti.com>
References: <cover.1343191280.git.afzal@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <cover.1343191280.git.afzal-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, khilman-l0cyMroinI0@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

rtc-omap driver is now capable of handling kicker mechanism,
hence remove kicker handling at platform level, instead
provide proper device name so that driver can handle kicker
mechanism by itself

Signed-off-by: Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>
---

v2:
 Use device name da830-rtc instead of am1808-rtc

 arch/arm/mach-davinci/devices-da8xx.c |   13 +------------
 1 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-davinci/devices-da8xx.c b/arch/arm/mach-davinci/devices-da8xx.c
index d1624a3..da5e4c7 100644
--- a/arch/arm/mach-davinci/devices-da8xx.c
+++ b/arch/arm/mach-davinci/devices-da8xx.c
@@ -679,7 +679,7 @@ static struct resource da8xx_rtc_resources[] = {
 };
 
 static struct platform_device da8xx_rtc_device = {
-	.name           = "omap_rtc",
+	.name           = "da830-rtc",
 	.id             = -1,
 	.num_resources	= ARRAY_SIZE(da8xx_rtc_resources),
 	.resource	= da8xx_rtc_resources,
@@ -688,17 +688,6 @@ static struct platform_device da8xx_rtc_device = {
 int da8xx_register_rtc(void)
 {
 	int ret;
-	void __iomem *base;
-
-	base = ioremap(DA8XX_RTC_BASE, SZ_4K);
-	if (WARN_ON(!base))
-		return -ENOMEM;
-
-	/* Unlock the rtc's registers */
-	__raw_writel(0x83e70b13, base + 0x6c);
-	__raw_writel(0x95a4f1e0, base + 0x70);
-
-	iounmap(base);
 
 	ret = platform_device_register(&da8xx_rtc_device);
 	if (!ret)
-- 
1.7.1
