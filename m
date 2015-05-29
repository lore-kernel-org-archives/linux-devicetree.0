From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] EDAC, edac_stub: Drop arch-specific include
Date: Fri, 29 May 2015 22:05:20 +0200
Message-ID: <20150529200520.GT31435@pd.tnic>
References: <1432337580-3750-1-git-send-email-lho@apm.com>
 <20150529094654.GD31435@pd.tnic>
 <CAPw-ZTnLqx0KsQkmv++zQRQ7hroaKML1rWgVafisENam0J17Mg@mail.gmail.com>
 <20150529185926.GP31435@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150529185926.GP31435-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 29, 2015 at 08:59:26PM +0200, Borislav Petkov wrote:
> Does it build when you remove it?

IOW, this should fix it:

---
From: Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>
Date: Fri, 29 May 2015 22:01:00 +0200
Subject: [PATCH] EDAC, edac_stub: Drop arch-specific include

<asm/edac.h> contains only the arch-specific scrubbing function and is
thus not needed in edac_stub.c. Kill it.

Signed-off-by: Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>
---
 drivers/edac/edac_stub.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/edac/edac_stub.c b/drivers/edac/edac_stub.c
index 9d9e18aefaaa..ff07aae5b7fb 100644
--- a/drivers/edac/edac_stub.c
+++ b/drivers/edac/edac_stub.c
@@ -16,7 +16,6 @@
 #include <linux/edac.h>
 #include <linux/atomic.h>
 #include <linux/device.h>
-#include <asm/edac.h>
 
 int edac_op_state = EDAC_OPSTATE_INVAL;
 EXPORT_SYMBOL_GPL(edac_op_state);
-- 
2.3.5

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
