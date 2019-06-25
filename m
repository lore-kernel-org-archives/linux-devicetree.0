From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH 1/4] MAINTAINERS: Add Purism mail alias as reviewer for their devkit's panel
Date: Tue, 25 Jun 2019 19:05:16 +0200
Message-ID: <a392758c914d436ec5e449980f619bc906c3054a.1561482165.git.agx@sigxcpu.org>
References: <cover.1561482165.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1561482165.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>
List-Id: devicetree@vger.kernel.org

Add a mail alias as reviewer for the rocktech jh057n00900 panel driver.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10359a30ed3c..b7de43a4910d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5133,6 +5133,7 @@ F:	include/uapi/drm/r128_drm.h
 
 DRM DRIVER FOR ROCKTECH JH057N00900 PANELS
 M:	Guido Günther <agx@sigxcpu.org>
+R:	Purism Kernel Team <kernel@puri.sm>
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
 F:	Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
-- 
2.20.1
