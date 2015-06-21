From: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 03/08] devicetree: bindings: R-Car Gen2 CMT0 and CMT1 bindings
Date: Sun, 21 Jun 2015 17:09:38 +0900
Message-ID: <20150621080938.10187.47239.sendpatchset@little-apple>
References: <20150621080903.10187.20998.sendpatchset@little-apple>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150621080903.10187.20998.sendpatchset@little-apple>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>

Add documentation for new separate CMT0 and CMT1 DT compatible strings
for R-Car Gen2. These compat strings allow us to enable CMT1-specific
features in the driver. The old compat strings will be deprecated in
the not so distant future.

Signed-off-by: Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>
---

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |    3 +++
 1 file changed, 3 insertions(+)

--- 0004/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2015-06-20 14:04:25.592366518 +0900
@@ -40,6 +40,9 @@ Required Properties:
 		(CMT1 on sh7372, sh73a0 and r8a7740)
 		This is a fallback for the above renesas,cmt-48-* entries.
 
+    - "renesas,cmt0-rcar-gen2" for 32-bit CMT0 devices included in R-Car Gen2.
+    - "renesas,cmt1-rcar-gen2" for 48-bit CMT1 devices included in R-Car Gen2.
+
     - "renesas,cmt-48-r8a73a4" for the r8a73a4 48-bit CMT
 		(CMT[01])
     - "renesas,cmt-48-r8a7790" for the r8a7790 48-bit CMT
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
