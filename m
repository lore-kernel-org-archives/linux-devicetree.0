From: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2] arm64: dts: rename ns2.txt to brcm,ns2.txt
Date: Sat,  8 Oct 2016 13:48:04 -0700
Message-ID: <1475959684-18085-1-git-send-email-scott.branden@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rename ns2.txt to brcm,ns2.txt to match naming convention followed
by rest of Broadcom binding documentation.

Signed-off-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/bcm/{ns2.txt => brcm,ns2.txt} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/arm/bcm/{ns2.txt => brcm,ns2.txt} (100%)

diff --git a/Documentation/devicetree/bindings/arm/bcm/ns2.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,ns2.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/bcm/ns2.txt
rename to Documentation/devicetree/bindings/arm/bcm/brcm,ns2.txt
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
