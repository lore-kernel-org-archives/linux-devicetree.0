From: Robin van der Gracht <robin@protonic.nl>
Subject: [PATCH v7 RESEND 3/3] MAINTAINERS: auxdisplay: Added myself as maintainer for ht16k33 driver
Date: Mon,  7 Nov 2016 10:56:36 +0100
Message-ID: <1478512596-19242-4-git-send-email-robin@protonic.nl>
References: <1478512596-19242-1-git-send-email-robin@protonic.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478512596-19242-1-git-send-email-robin@protonic.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Robin van der Gracht <robin@protonic.nl>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Robin van der Gracht <robin@protonic.nl>
CC: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 411e3b8..15d9712 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3030,6 +3030,12 @@ F:	drivers/usb/host/whci/
 F:	drivers/usb/wusbcore/
 F:	include/linux/usb/wusb*
 
+HT16K33 LED CONTROLLER DRIVER
+M:	Robin van der Gracht <robin@protonic.nl>
+S:	Maintained
+F:	drivers/auxdisplay/ht16k33.c
+F:	Documentation/devicetree/bindings/display/ht16k33.txt
+
 CFAG12864B LCD DRIVER
 M:	Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
 W:	http://miguelojeda.es/auxdisplay.htm
-- 
2.7.4
