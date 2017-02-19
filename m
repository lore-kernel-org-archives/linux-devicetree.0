From: Tomasz Duszynski <tduszyns-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] of: add vendor prefix for Sensirion company
Date: Sun, 19 Feb 2017 15:59:49 +0100
Message-ID: <20170219145949.22750-1-tduszyns@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds prefix for Sensirion company.

Signed-off-by: Tomasz Duszynski <tduszyns-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 44ddc980b085..992ec480be53 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -203,6 +203,7 @@ sbs	Smart Battery System
 schindler	Schindler
 seagate	Seagate Technology PLC
 semtech	Semtech Corporation
+sensirion Sensirion AG
 sgx	SGX Sensortech
 sharp	Sharp Corporation
 sigma	Sigma Designs, Inc.
--
2.11.1
