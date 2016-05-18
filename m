From: Robin van der Gracht <robin@protonic.nl>
Subject: [PATCH v6 3/3] MAINTAINERS: auxdisplay: Added myself as maintainer for ht16k33 driver
Date: Wed, 18 May 2016 14:23:19 +0200
Message-ID: <1463574199-21077-4-git-send-email-robin@protonic.nl>
References: <1463574199-21077-1-git-send-email-robin@protonic.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463574199-21077-1-git-send-email-robin@protonic.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Thierry Reding <treding@nvidia.com>, Shawn Guo <shawnguo@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Matt Ranostay <mranostay@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kalle Valo <kvalo@codeaurora.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Guenter Roeck <linux@roeck-us.net>, Jiri Slaby <jslaby@suse.com>, devicetree@vger.kernel.org, Robin van der Gracht <robin@protonic.nl>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Robin van der Gracht <robin@protonic.nl>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9c567a4..54aed16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2816,6 +2816,12 @@ F:	drivers/usb/host/whci/
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
