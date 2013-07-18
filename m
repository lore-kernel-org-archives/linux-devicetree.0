From: Oleksandr Kravchenko <x0199363-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 2/3] of: Add Avago Technologies vendor prefix
Date: Thu, 18 Jul 2013 12:44:43 +0300
Message-ID: <1374140685-20549-2-git-send-email-x0199363@ti.com>
References: <1374140685-20549-1-git-send-email-x0199363@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374140685-20549-1-git-send-email-x0199363-l0cyMroinI0@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org, srinivas.pandruvada-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, Oleksandr Kravchenko <o.v.kravchenko-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Oleksandr Kravchenko <o.v.kravchenko-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org>

This commit adds a device tree vendor prefix for Avago Technologies.

Signed-off-by: Oleksandr Kravchenko <o.v.kravchenko-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org>
---
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index d5a79ca..8aab9c6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -11,6 +11,7 @@ amcc	Applied Micro Circuits Corporation (APM, formally AMCC)
 apm	Applied Micro Circuits Corporation (APM)
 arm	ARM Ltd.
 atmel	Atmel Corporation
+avago	Avago Technologies
 bosch	Bosch Sensortec GmbH
 brcm	Broadcom Corporation
 cavium	Cavium, Inc.
-- 
1.7.9.5
