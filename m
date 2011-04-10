From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch 1/2] Add dt_compat field to struct s3c_gpio_chip
Date: Sun, 10 Apr 2011 17:33:12 +0200
Message-ID: <20110410153312.GB27088@dandreoli.com>
References: <20110410152735.338798127@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline;
	filename=arm-plat-samsung-add-dt_compat-to-s3c_gpio_chip
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This new field allows easy creation of GPIO chips in base of struct arrays.

Signed-off-by: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---
 arch/arm/plat-samsung/include/plat/gpio-core.h |    3 +++
 1 file changed, 3 insertions(+)

Index: b/arch/arm/plat-samsung/include/plat/gpio-core.h
===================================================================
--- a/arch/arm/plat-samsung/include/plat/gpio-core.h	2011-04-07 22:43:45.000000000 +0200
+++ b/arch/arm/plat-samsung/include/plat/gpio-core.h	2011-04-10 16:00:39.000000000 +0200
@@ -71,6 +71,9 @@
 #ifdef CONFIG_PM
 	u32			pm_save[4];
 #endif
+#ifdef CONFIG_OF_GPIO
+	const char		*dt_compat;
+#endif
 };
 
 static inline struct s3c_gpio_chip *to_s3c_gpio(struct gpio_chip *gpc)
