From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: [PATCH v2 02/23] MAINTAINERS: Add file patterns for clocksource device tree bindings
Date: Sun, 12 Mar 2017 14:16:46 +0100
Message-ID: <1489324627-19126-3-git-send-email-geert@linux-m68k.org>
References: <1489324627-19126-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489324627-19126-1-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.

v2:
  - No changes.

Impact on next-20170310:

-Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS,commit_signer:10/13=77%)
+Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> (supporter:CLOCKSOURCE, CLOCKEVENT DRIVERS)
+Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> (supporter:CLOCKSOURCE, CLOCKEVENT DRIVERS)
+Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
-Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> (commit_signer:10/13=77%)
-Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> (commit_signer:2/13=15%)
-Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (commit_signer:2/13=15%,authored:2/13=15%)
-Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org> (commit_signer:2/13=15%,authored:2/13=15%)
-"Otto Kekäläinen" <otto-Gh1NM5ZPXYb1KXRcyAk9cg@public.gmane.org> (authored:1/13=8%)
-Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org> (authored:1/13=8%)
-Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> (authored:1/13=8%)
+linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:CLOCKSOURCE, CLOCKEVENT DRIVERS)
 devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
-linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list)
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 361673633c46da70..5a3655b474c5c0c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3261,6 +3261,7 @@ M:	Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
 L:	linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/core
 S:	Supported
+F:	Documentation/devicetree/bindings/timer/
 F:	drivers/clocksource
 
 CISCO FCOE HBA DRIVER
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
