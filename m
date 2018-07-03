From: Damian Kos <dkos@cadence.com>
Subject: [PATCH 07/12] drm/dp: fix drm_dp_link_train_clock_recovery_delay for DP 1.4
Date: Tue, 3 Jul 2018 11:02:18 +0100
Message-ID: <1530612152-27555-8-git-send-email-dkos@cadence.com>
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

In DP 1.4, interval between link status and adjust request read for the
clock recovery phase is fixed to 100us whatever the value of the
register is.

Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
Signed-off-by: Damian Kos <dkos@cadence.com>
---
 drivers/gpu/drm/drm_dp_helper.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index b6a27ab..92f3880 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -152,6 +152,11 @@ void drm_dp_link_train_clock_recovery_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 	unsigned int training_interval = dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
 		DP_TRAINING_AUX_RD_INTERVAL_MASK;
 
+	if (dpcd[DP_DPCD_REV] == 0x14) {
+		udelay(100);
+		return;
+	}
+
 	if (training_interval == 0)
 		udelay(100);
 	else
-- 
1.7.1
