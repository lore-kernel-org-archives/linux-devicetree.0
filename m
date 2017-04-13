From: Nandor Han <nandor.han@ge.com>
Subject: [PATCH v2 4/4] Add XRA1403 support to MAINTAINERS file
Date: Thu, 13 Apr 2017 13:27:51 +0300
Message-ID: <e37304435b118b295ab62ee324a62f6c7b1d7879.1492077070.git.nandor.han@ge.com>
References: <cover.1492077070.git.nandor.han@ge.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1492077070.git.nandor.han@ge.com>
In-Reply-To: <cover.1492077070.git.nandor.han@ge.com>
References: <cover.1492077070.git.nandor.han@ge.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, davem@davemloft.net, geert@linux-m68k.org, mchehab@kernel.org, daniel.vetter@ffwll.ch, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Nandor Han <nandor.han@ge.com>
List-Id: devicetree@vger.kernel.org

Add XRA1403 support to MAINTAINERS list.

Signed-off-by: Nandor Han <nandor.han@ge.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 892e958..0c5b984 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14013,6 +14013,14 @@ L:	linux-kernel@vger.kernel.org
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
