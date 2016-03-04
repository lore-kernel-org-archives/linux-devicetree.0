From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 2/3] drm/vc4: Recognize a more specific compatible string for V3D.
Date: Fri,  4 Mar 2016 12:32:07 -0800
Message-ID: <1457123528-13482-3-git-send-email-eric@anholt.net>
References: <1457123528-13482-1-git-send-email-eric@anholt.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457123528-13482-1-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

The Raspberry Pi Foundation's firmware updates are shipping device
trees using the old string, so we'll keep recognizing that as this rev
of V3D.  Still, we should use a more specific name in the upstream DT
to clarify which board is being supported, in case we do other revs of
V3D in the future.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/vc4/vc4_v3d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 31de5d1..e6d3c60 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -268,6 +268,7 @@ static int vc4_v3d_dev_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id vc4_v3d_dt_match[] = {
+	{ .compatible = "brcm,bcm2835-v3d" },
 	{ .compatible = "brcm,vc4-v3d" },
 	{}
 };
-- 
2.7.0
