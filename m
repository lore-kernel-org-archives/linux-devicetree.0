From: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/gpio: add declaration of struct gpio_chip to silence
 warning if CONFIG_OF_GPIO=n && CONFIG_GPIOLIB=n
Date: Mon, 21 May 2012 17:54:03 -0700
Message-ID: <20120522005400.GA15267@lizard>
References: <201205201639.21378.sfking@fdwdc.com>
 <20120521103257.GA9328@lizard>
 <201205210950.59719.sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201205210950.59719.sfking-xS0NTnu2YfYAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Steven King <sfking-xS0NTnu2YfYAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 21, 2012 at 09:50:59AM -0700, Steven King wrote:
[...]
> The arch is m68knommu (Coldfire).   Currently it has GENERIC_GPIO and 
> ARCH_REQUIRES_GPIOLIB but thats overkill for small, resource constrained 
> systems such as most Coldfire v2 and v3 systems (often 16 megs or less of 
> ram) that don't have any off-chip GPIO, so I was changing it to 
> ARCH_WANTS_OPTIONAL_GPIOLIB.  Which, with the appropriate patches to the 
> Coldfire GPIO code, works fine, one can select GPIOLIB=n and get the smaller 
> footprint for small systems or GPIOLIB=y and get the full implementation for 
> targets with off-chip GPIO -- with the exception of 
> drivers/net/ethernet/freescale/fec.c which gives the warning.

OK, understood. But still, adding the forward-declaration to linux/gpio.h
is preffered, i.e. something along these lines:

diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 6155ecf..968607e 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -32,6 +32,8 @@ struct gpio {
 	const char	*label;
 };
 
+struct gpio_chip;
+
 #ifdef CONFIG_GENERIC_GPIO
 #include <asm/gpio.h>
 
@@ -43,7 +45,6 @@ struct gpio {
 #include <linux/bug.h>
 
 struct device;
-struct gpio_chip;
 
 static inline bool gpio_is_valid(int number)
 {
