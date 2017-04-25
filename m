From: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: [PATCH v4 1/9] MAINTAINERS: NFC: trf7970a: Add Mark Greer as maintainer
Date: Tue, 25 Apr 2017 11:40:28 -0700
Message-ID: <20170425184036.1212-2-mgreer@animalcreek.com>
References: <20170425184036.1212-1-mgreer@animalcreek.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170425184036.1212-1-mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add Mark Greer as the maintainer of the trf7970a NFC driver.

Signed-off-by: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a8eaa0a8e522..d7441b69f101 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11118,6 +11118,14 @@ F:	kernel/time/alarmtimer.c
 F:	kernel/time/ntp.c
 F:	tools/testing/selftests/timers/
 
+TI TRF7970A NFC DRIVER
+M:	Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
+L:	linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+L:	linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org (moderated for non-subscribers)
+S:	Supported
+F:	drivers/nfc/trf7970a.c
+F:	Documentation/devicetree/bindings/net/nfc/trf7970a.txt
+
 SC1200 WDT DRIVER
 M:	Zwane Mwaikambo <zwanem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 S:	Maintained
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
