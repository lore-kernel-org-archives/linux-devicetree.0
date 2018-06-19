From: <jan.tuerk@emtrion.com>
Subject: [PATCH 3/3] drm/panel: Add support for the EDT ETM0700G0EDH6
Date: Tue, 19 Jun 2018 11:55:45 +0200
Message-ID: <20180619095546.24445-3-jan.tuerk@emtrion.com>
References: <20180427132445.3458-2-jan.tuerk@emtrion.com>
 <20180619095546.24445-1-jan.tuerk@emtrion.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619095546.24445-1-jan.tuerk@emtrion.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jan Tuerk <jan.tuerk@emtrion.com>

The Emerging Display Technology ETM0700G0EDH6 is the
uses the same panel as the ETM0700G0BDH6. It differs
in the hardware design for the backlight and the
touchscreen i2c interface. As the new display type has
different requirements for drive-strengths on the i2c-bus,
add an additional compatible to allow the handling of it or warn
about incompatible cpu and display combinations.

Signed-off-by: Jan Tuerk <jan.tuerk@emtrion.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 8b7feb2888f2..2eed60134fa3 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2148,6 +2148,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "edt,etm0700g0bdh6",
 		.data = &edt_etm0700g0bdh6,
+	}, {
+		.compatible = "edt,etm0700g0edh6",
+		.data = &edt_etm0700g0bdh6,
 	}, {
 		.compatible = "foxlink,fl500wvr00-a0t",
 		.data = &foxlink_fl500wvr00_a0t,
-- 
2.17.1
