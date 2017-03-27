From: Nandor Han <nandor.han@ge.com>
Subject: [PATCH 3/3] Add XRA1403 support to MAINTAINERS file
Date: Mon, 27 Mar 2017 09:23:02 +0300
Message-ID: <d9521d04c4abe989ed5ba939b70ab31727f52eee.1490595641.git.nandor.han@ge.com>
References: <cover.1490595641.git.nandor.han@ge.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.1490595641.git.nandor.han@ge.com>
In-Reply-To: <cover.1490595641.git.nandor.han@ge.com>
References: <cover.1490595641.git.nandor.han@ge.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Nandor Han <nandor.han@ge.com>
List-Id: devicetree@vger.kernel.org

Add the XRA1403 support to MAINTAINERS list.

Signed-off-by: Nandor Han <nandor.han@ge.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 58b3a22..539c88c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13903,6 +13903,14 @@ L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	drivers/char/xillybus/
 
+XRA1403 GPIO EXPANDER
+M:	Nandor Han <nandor.han@ge.com>
+M:	Semi Malinen <semi.malinen@ge.com>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	drivers/gpio/gpio-xra1403.c
+F:	Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
+
 XTENSA XTFPGA PLATFORM SUPPORT
 M:	Max Filippov <jcmvbkbc@gmail.com>
 L:	linux-xtensa@linux-xtensa.org
-- 
2.10.1

