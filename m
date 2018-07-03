From: Damian Kos <dkos@cadence.com>
Subject: [PATCH 08/12] drm/dp: add max number of lanes supported
Date: Tue, 3 Jul 2018 11:02:19 +0100
Message-ID: <1530612152-27555-9-git-send-email-dkos@cadence.com>
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

Currently, a maximum of 4 lanes is supported in DP.

It can be useful to add this maximum so that we can e.g. create arrays
in drivers that can store data for several lanes (e.g.
DP_TRAINING_LANEx_SET).

Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
Signed-off-by: Damian Kos <dkos@cadence.com>
---
 include/drm/drm_dp_helper.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index a63a548..accefbb 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -69,6 +69,7 @@
 
 #define DP_MAX_LANE_COUNT                   0x002
 # define DP_MAX_LANE_COUNT_MASK		    0x1f
+# define DP_MAX_NUM_LANES		    4
 # define DP_TPS3_SUPPORTED		    (1 << 6) /* 1.2 */
 # define DP_ENHANCED_FRAME_CAP		    (1 << 7)
 
-- 
1.7.1
