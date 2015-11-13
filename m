From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] driver-core: platform: probe of-devices only using list of compatibles
Date: Fri, 13 Nov 2015 09:14:20 +0100
Message-ID: <1447402460-2016-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Corentin LABBE <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Frans Klaver <fransklaver-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are several indications that make a platform device match a
platform driver. For devices that are instantiated by a device tree
matching by name, id table or acpi mechanisms doesn't make sense and
might result in surprising effects. So limit matching to use the
driver's of_match_table for these.

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
Hello,

this issue popped up when it was discussed if of_match_device could
return NULL for several different drivers:

	http://mid.gmane.org/20151112082617.GE24008-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
	http://mid.gmane.org/20151112074447.GA24008-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
	http://mid.gmane.org/20151112134519.GJ24008-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org

(and probably more that I'm not aware of). IMHO this doesn't make these
fixes obsolete, but YMMV.

Thierry: You gave your ack before I wrote a commit log. I added it
nevertheless and hope that's ok for you. If not please say so.

Best regards
Uwe

 drivers/base/platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 1dd6d3bf1098..09b2972e60d7 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -900,8 +900,8 @@ static int platform_match(struct device *dev, struc=
t device_driver *drv)
 		return !strcmp(pdev->driver_override, drv->name);
=20
 	/* Attempt an OF style match first */
-	if (of_driver_match_device(dev, drv))
-		return 1;
+	if (pdev->dev.of_node)
+		return of_driver_match_device(dev, drv);
=20
 	/* Then try ACPI style match */
 	if (acpi_driver_match_device(dev, drv))
--=20
2.6.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
