From: Tomasz Duszynski <tduszyns-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] of: add vendor prefixes for Samyoung and Shinyei
Date: Sun,  5 Feb 2017 16:02:52 +0100
Message-ID: <20170205150252.10884-1-tduszyns@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds prefixes for Samyoung and Shinyei companies.

Signed-off-by: Tomasz Duszynski <tduszyns-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index cf1c36616507..1a090a330674 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -252,6 +252,7 @@ rikomagic	Rikomagic Tech Corp. Ltd
 rockchip	Fuzhou Rockchip Electronics Co., Ltd
 samsung	Samsung Semiconductor
 samtec	Samtec/Softing company
+samyoung Samyoung S&C Co., Ltd
 sandisk	Sandisk Corporation
 sbs	Smart Battery System
 schindler	Schindler
@@ -259,6 +260,7 @@ seagate	Seagate Technology PLC
 semtech	Semtech Corporation
 sgx	SGX Sensortech
 sharp	Sharp Corporation
+shinyei Shinyei Technology Co., Ltd
 si-en	Si-En Technology Ltd.
 sigma	Sigma Designs, Inc.
 sii	Seiko Instruments, Inc.
-- 
2.11.1
