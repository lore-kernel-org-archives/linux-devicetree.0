From: Damian Kos <dkos@cadence.com>
Subject: [PATCH 01/12] HACK: increase timeout for drm_atomic_helper_wait_for_vblanks
Date: Tue, 3 Jul 2018 11:02:12 +0100
Message-ID: <1530612152-27555-2-git-send-email-dkos@cadence.com>
References: <1530612152-27555-1-git-send-email-dkos@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530612152-27555-1-git-send-email-dkos@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Gustavo Padovan <gustavo@padovan.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, Sandy Huang <hjc@rock-chips.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Damian Kos <dkos@cadence.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: ltyrala@cadence.com, pgaj@cadence.com, stelford@cadence.com, Quentin Schulz <quentin.schulz@free-electrons.com>
List-Id: devicetree@vger.kernel.org

From: Quentin Schulz <quentin.schulz@free-electrons.com>

Due to the DP IP being simulated in a different and way slower way than
the rest of the hardware, increase the timeout in
drm_atomic_helper_wait_for_vblanks so that we don't miss the vblank
event.

Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
Signed-off-by: Damian Kos <dkos@cadence.com>
---
 drivers/gpu/drm/drm_atomic_helper.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index c356545..0171249 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1345,7 +1345,7 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
 		ret = wait_event_timeout(dev->vblank[i].queue,
 				old_state->crtcs[i].last_vblank_count !=
 					drm_crtc_vblank_count(crtc),
-				msecs_to_jiffies(50));
+				msecs_to_jiffies(4000));
 
 		WARN(!ret, "[CRTC:%d:%s] vblank wait timed out\n",
 		     crtc->base.id, crtc->name);
-- 
1.7.1
