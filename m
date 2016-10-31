From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 3/7] base: soc: Check for NULL SoC device attributes
Date: Mon, 31 Oct 2016 12:30:51 +0100
Message-ID: <1477913455-5314-4-git-send-email-geert+renesas@glider.be>
References: <1477913455-5314-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477913455-5314-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Yangbo Lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

If soc_device_match() is used to check the value of a specific
attribute that is not present for the current SoC, the kernel crashes
with a NULL pointer dereference.

Fix this by explicitly checking for the absence of a needed property,
and considering this a non-match.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Acked-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
---
v2:
  - Add Acked-by.
---
 drivers/base/soc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 04ee597fc3a3fda0..dc26e5949a320223 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -176,19 +176,23 @@ static int soc_device_match_one(struct device *dev, void *arg)
 	const struct soc_device_attribute *match = arg;
 
 	if (match->machine &&
-	    !glob_match(match->machine, soc_dev->attr->machine))
+	    (!soc_dev->attr->machine ||
+	     !glob_match(match->machine, soc_dev->attr->machine)))
 		return 0;
 
 	if (match->family &&
-	    !glob_match(match->family, soc_dev->attr->family))
+	    (!soc_dev->attr->family ||
+	     !glob_match(match->family, soc_dev->attr->family)))
 		return 0;
 
 	if (match->revision &&
-	    !glob_match(match->revision, soc_dev->attr->revision))
+	    (!soc_dev->attr->revision ||
+	     !glob_match(match->revision, soc_dev->attr->revision)))
 		return 0;
 
 	if (match->soc_id &&
-	    !glob_match(match->soc_id, soc_dev->attr->soc_id))
+	    (!soc_dev->attr->soc_id ||
+	     !glob_match(match->soc_id, soc_dev->attr->soc_id)))
 		return 0;
 
 	return 1;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
