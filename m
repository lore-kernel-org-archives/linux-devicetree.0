From: Nikolay Borisov <Nikolay.Borisov-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 2/2] documentation/devicetree: Update GIC compat strings
Date: Wed, 21 May 2014 14:48:05 +0100
Message-ID: <1400680085-10430-3-git-send-email-Nikolay.Borisov@arm.com>
References: <1400680085-10430-1-git-send-email-Nikolay.Borisov@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400680085-10430-1-git-send-email-Nikolay.Borisov-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds two new implementation-agonostic GIC compatible strings,
"gic-v1" and "gic-v2". Any implementation compatible with these revisions=
=20
of the spec may include these strings in their compatible list in addition=
=20
to any more specific string.

Signed-off-by: Nikolay Borisov <Nikolay.Borisov-5wv7dgnIgG8@public.gmane.org>i
Acked-by: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/gic.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/gic.txt b/Documentation/=
devicetree/bindings/arm/gic.txt
index 5573c08..223b4cc 100644
--- a/Documentation/devicetree/bindings/arm/gic.txt
+++ b/Documentation/devicetree/bindings/arm/gic.txt
@@ -12,6 +12,8 @@ Main node required properties:
=20
 - compatible : should be one of:
 =09"arm,gic-400"
+=09"arm,gic-v1"
+=09"arm,gic-v2"
 =09"arm,cortex-a15-gic"
 =09"arm,cortex-a9-gic"
 =09"arm,cortex-a7-gic"
--=20
1.8.1.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
