From: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 01/10] Documentation: sunxi: Update Allwinner
 SoC documentation
Date: Fri, 15 May 2015 18:38:51 +0200
Message-ID: <1431707940-19372-2-git-send-email-jenskuske@gmail.com>
References: <1431707940-19372-1-git-send-email-jenskuske@gmail.com>
Reply-To: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCC5XIE2SIHBBLWC3CVAKGQEF3V2QAY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1431707940-19372-1-git-send-email-jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

There are some new Allwinner SoCs available, namely A33, A83T and H3.
Update the documentation to mention those and the related documents.

Signed-off-by: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/arm/sunxi/README | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/arm/sunxi/README b/Documentation/arm/sunxi/README
index 1fe2d7f..5e38e15 100644
--- a/Documentation/arm/sunxi/README
+++ b/Documentation/arm/sunxi/README
@@ -36,7 +36,7 @@ SunXi family
         + User Manual
           http://dl.linux-sunxi.org/A20/A20%20User%20Manual%202013-03-22.pdf
 
-      - Allwinner A23
+      - Allwinner A23 (sun8i)
         + Datasheet
           http://dl.linux-sunxi.org/A23/A23%20Datasheet%20V1.0%2020130830.pdf
         + User Manual
@@ -55,7 +55,23 @@ SunXi family
         + User Manual
           http://dl.linux-sunxi.org/A31/A3x_release_document/A31s/IC/A31s%20User%20Manual%20%20V1.0%2020130322.pdf
 
+      - Allwinner A33 (sun8i)
+        + Datasheet
+          http://dl.linux-sunxi.org/A33/A33%20Datasheet%20release%201.1.pdf
+        + User Manual
+          http://dl.linux-sunxi.org/A33/A33%20user%20manual%20release%201.1.pdf
+
+      - Allwinner H3 (sun8i)
+        + Datasheet
+          http://dl.linux-sunxi.org/H3/Allwinner_H3_Datasheet_V1.0.pdf
+
     * Quad ARM Cortex-A15, Quad ARM Cortex-A7 based SoCs
       - Allwinner A80
         + Datasheet
 	  http://dl.linux-sunxi.org/A80/A80_Datasheet_Revision_1.0_0404.pdf
+
+    * Octa ARM Cortex-A7 based SoCs
+      - Allwinner A83T
+        + Not Supported
+        + Datasheet
+          http://dl.linux-sunxi.org/A83T/A83T_datasheet_Revision_1.1.pdf
-- 
2.4.0
