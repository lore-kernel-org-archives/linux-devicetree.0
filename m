From: Chris Brand <chris.brand-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH RESEND] docs: Move brcm,bcm21664-resetmgr.txt
Date: Tue, 21 Jun 2016 16:17:36 -0700
Message-ID: <1466551056-15580-1-git-send-email-chris.brand@broadcom.com>
References: <1465413404-28468-1-git-send-email-chris.brand () broadcom ! com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465413404-28468-1-git-send-email-chris.brand () broadcom ! com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Sebastian pointed out that .../bindings/reset is usually used for
peripheral reset controllers, whereas .../bindings/power/reset is
used for Board/System reset controllers.

Reported-by: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Chris Brand <chris.brand-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/{ => power}/reset/brcm,bcm21664-resetmgr.txt      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{ => power}/reset/brcm,bcm21664-resetmgr.txt (100%)

diff --git a/Documentation/devicetree/bindings/reset/brcm,bcm21664-resetmgr.txt b/Documentation/devicetree/bindings/power/reset/brcm,bcm21664-resetmgr.txt
similarity index 100%
rename from Documentation/devicetree/bindings/reset/brcm,bcm21664-resetmgr.txt
rename to Documentation/devicetree/bindings/power/reset/brcm,bcm21664-resetmgr.txt
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
