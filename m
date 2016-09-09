From: bd-phuc-HEF513clHfp3+QwDJ9on6Q@public.gmane.org
Subject: [PATCH 1/8] devicetree: binding: R-car Gen3 CMT0 and CMT1 bindings
Date: Fri,  9 Sep 2016 20:43:07 +0900
Message-ID: <1473421394-9745-2-git-send-email-bd-phuc@jinso.co.jp>
References: <1473421394-9745-1-git-send-email-bd-phuc@jinso.co.jp>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473421394-9745-1-git-send-email-bd-phuc-HEF513clHfp3+QwDJ9on6Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, ryusuke.sakato.bx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, h-inayoshi-HEF513clHfp3+QwDJ9on6Q@public.gmane.org, cm-hiep-HEF513clHfp3+QwDJ9on6Q@public.gmane.org, nv-dung-HEF513clHfp3+QwDJ9on6Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Bui Duc Phuc <bd-phuc-HEF513clHfp3+QwDJ9on6Q@public.gmane.org>

Add documentation for new separate CMT0 and CMT1 DT compatible strings
for R-Car Gen3.

Signed-off-by: Bui Duc Phuc <bd-phuc-HEF513clHfp3+QwDJ9on6Q@public.gmane.org>
---
 Documentation/devicetree/bindings/timer/renesas,cmt.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
index 1a05c1b..72fd526 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
@@ -52,6 +52,8 @@ Required Properties:
 		(CMT[01] on r8a73a4, r8a7790 and r8a7791)
 		This is a fallback for the renesas,cmt-48-r8a73a4,
 		renesas,cmt-48-r8a7790 and renesas,cmt-48-r8a7791 entries.
+    - "renesas,cmt-48-gen3" for third generation 48-bit CMT
+		(CMT[01] on r8a7795 and r8a7796)
 
   - reg: base address and length of the registers block for the timer module.
   - interrupts: interrupt-specifier for the timer, one per channel.
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
