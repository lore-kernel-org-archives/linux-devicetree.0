From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] Docs: DT: Add National Instruments vendor prefix
Date: Wed, 28 Sep 2016 09:59:19 -0700
Message-ID: <1475081961-3858-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, emilio.lopez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, moritz.fischer.private-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, julia-acOepvfBmUk@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add National Instruments (ni) vendor prefix to list of
vendor prefixes

Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 1992aa9..a92f62b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -179,6 +179,7 @@ netlogic	Broadcom Corporation (formerly NetLogic Microsystems)
 netxeon		Shenzhen Netxeon Technology CO., LTD
 newhaven	Newhaven Display International
 nintendo	Nintendo
+ni		National Instruments Corp
 nokia	Nokia
 nuvoton	Nuvoton Technology Corporation
 nvidia	NVIDIA
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
