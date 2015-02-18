From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [PATCH v1 3/3] MAINTAINERS: add info for e3x0-poweroff driver.
Date: Wed, 18 Feb 2015 10:18:16 -0800
Message-ID: <1424283496-4479-4-git-send-email-moritz.fischer@ettus.com>
References: <1424283496-4479-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424283496-4479-1-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sre@kernel.org
Cc: dbaryshkov@gmail.com, dwmw2@infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 85024e2..19c0ae1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3522,6 +3522,14 @@ S:	Supported
 F:	drivers/input/misc/e3x0-button.c
 F:	Documentation/devicetree/bindings/input/e3x0-button.txt
 
+E3X0 POWEROFF DRIVER
+M:	Moritz Fischer <moritz.fischer@ettus.com>
+L:	usrp-users@lists.ettus.com
+W:	http://www.ettus.com
+S:	Supported
+F:	drivers/power/reset/e3x0-poweroff.c
+F:	Documentation/devicetree/bindings/power/reset/e3x0-poweroff.txt
+
 E4000 MEDIA DRIVER
 M:	Antti Palosaari <crope@iki.fi>
 L:	linux-media@vger.kernel.org
-- 
1.9.3
