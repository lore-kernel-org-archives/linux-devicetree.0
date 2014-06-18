From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ARM: stih41x: Rename stih416-b2020-revE.dts to stih416-b2020e.dts
Date: Wed, 18 Jun 2014 11:31:48 +0100
Message-ID: <1403087508-6710-1-git-send-email-lee.jones@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Two reasons for this rename.  Firstly, it removes the camel case
convention which isn't used by any other platform and secondly it
matches the naming convention for the internal kernel, which can
become annoying when flipping between the two.

Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/{stih416-b2020-revE.dts => stih416-b2020e.dts} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename arch/arm/boot/dts/{stih416-b2020-revE.dts => stih416-b2020e.dts} (100%)

diff --git a/arch/arm/boot/dts/stih416-b2020-revE.dts b/arch/arm/boot/dts/stih416-b2020e.dts
similarity index 100%
rename from arch/arm/boot/dts/stih416-b2020-revE.dts
rename to arch/arm/boot/dts/stih416-b2020e.dts
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
