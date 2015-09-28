From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] doc: dt: arm,pl172: add description of PL175 and PL176 controllers
Date: Mon, 28 Sep 2015 19:51:21 +0300
Message-ID: <1443459081-24199-4-git-send-email-vz@mleia.com>
References: <1443459043-24144-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443459043-24144-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 .../devicetree/bindings/memory-controllers/arm,pl172.txt          | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/arm,pl172.txt b/Documentation/devicetree/bindings/memory-controllers/arm,pl172.txt
index e6df32f..22b77ee 100644
--- a/Documentation/devicetree/bindings/memory-controllers/arm,pl172.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/arm,pl172.txt
@@ -1,8 +1,9 @@
-* Device tree bindings for ARM PL172 MultiPort Memory Controller
+* Device tree bindings for ARM PL172/PL175/PL176 MultiPort Memory Controller
 
 Required properties:
 
-- compatible:		"arm,pl172", "arm,primecell"
+- compatible:		Must be "arm,primecell" and exactly one from
+			"arm,pl172", "arm,pl175" or "arm,pl176".
 
 - reg:			Must contains offset/length value for controller.
 
@@ -56,7 +57,8 @@ Optional child cs node config properties:
 
 - mpmc,extended-wait:	Enable extended wait.
 
-- mpmc,buffer-enable:	Enable write buffer.
+- mpmc,buffer-enable:	Enable write buffer, option is not supported by
+			PL175 and PL176 controllers.
 
 - mpmc,write-protect:	Enable write protect.
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
