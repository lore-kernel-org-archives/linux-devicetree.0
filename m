From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/10] pinctrl: use postcore_initcall
Date: Thu, 18 Oct 2012 17:06:55 +0800
Message-ID: <1350551224-12857-1-git-send-email-haojian.zhuang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Since pins are configured in device driver, pinctrl driver should be
loaded by those device driver. module_platform_driver() only declares
pinctrl driver is in module_initcall privilege. Use postcore_initcall
privilege instead.

Signed-off-by: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/pinctrl/pinctrl-single.c |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 76a4260..64d109a 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -980,7 +980,17 @@ static struct platform_driver pcs_driver = {
 	},
 };
 
-module_platform_driver(pcs_driver);
+static int __init pcs_driver_init(void)
+{
+	return platform_driver_register(&pcs_driver);
+}
+postcore_initcall(pcs_driver_init);
+
+static void __exit pcs_driver_exit(void)
+{
+	platform_driver_unregister(&pcs_driver);
+}
+module_exit(pcs_driver_exit);
 
 MODULE_AUTHOR("Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>");
 MODULE_DESCRIPTION("One-register-per-pin type device tree based pinctrl driver");
-- 
1.7.0.4
