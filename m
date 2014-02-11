From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 5/7] Documentation: devicetree: fix up pl18x clocks
Date: Tue, 11 Feb 2014 11:37:10 +0000
Message-ID: <1392118632-11312-6-git-send-email-mark.rutland@arm.com>
References: <1392118632-11312-1-git-send-email-mark.rutland@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392118632-11312-1-git-send-email-mark.rutland-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Currently the pl18x driver expects clocks, and dts provide them, yet the
binding does not mention clocks at all.

This patch adds a description of the clocks, "apb_pclk" (as required by
the primecell binding) and "mclk" for the pl18x itself. The "mclk"
name was chosen to match the official documentation, as currently a
variety of names are used in its place; it is expected that any
operating system supporting these can continue to do so in the absence
of an "mclk" entry.

Signed-off-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
---
 Documentation/devicetree/bindings/mmc/mmci.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmci.txt b/Documentation/devicetree/bindings/mmc/mmci.txt
index 2b584ca..1b72d4d 100644
--- a/Documentation/devicetree/bindings/mmc/mmci.txt
+++ b/Documentation/devicetree/bindings/mmc/mmci.txt
@@ -9,6 +9,10 @@ by mmc.txt and the properties used by the mmci driver.
 Required properties:
 - compatible             : contains "arm,pl18x", "arm,primecell".
 - arm,primecell-periphid : contains the PrimeCell Peripheral ID.
+- clocks : a list of phandles + clock-specifiers, one for each entry in
+           clock-names.
+- clock-names : should contain "apb_pclk" and "mclk".
+
 
 Optional properties:
 - mmc-cap-mmc-highspeed  : indicates whether MMC is high speed capable
-- 
1.8.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
