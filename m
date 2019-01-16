From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 2/6] gnss: sirf: set power state initially off
Date: Wed, 16 Jan 2019 22:18:08 +0100
Message-ID: <20190116211812.6337-3-andreas@kemnade.info>
References: <20190116211812.6337-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116211812.6337-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: letux-kernel@openphoenux.org, johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

On the GTA04 mobile phone, it was observed that the gps was powered
on sometimes intially. Generally a reboot without powering the device
off (direct reset of the processor, reboot from a system where gps
power toggle was done in userspace) or glitches on the gpio pin during
power on could cause this problem.
This has the drawback that probing takes some seconds on
systems without wakeup signal. On systems with wakeup signal
this penalty is much lower.
But if the chip is initially on and that is not fixed, the suspend
current will be multiple times higher, so this sacrifice should
be justified

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
- was part of 2/5 in v2

 drivers/gnss/sirf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
index b21e14351b82..c7706b91f6f0 100644
--- a/drivers/gnss/sirf.c
+++ b/drivers/gnss/sirf.c
@@ -367,6 +367,13 @@ static int sirf_probe(struct serdev_device *serdev)
 	if (IS_ENABLED(CONFIG_PM)) {
 		pm_runtime_set_suspended(dev);	/* clear runtime_error flag */
 		pm_runtime_enable(dev);
+		/*
+		 * Device might be enabled at boot, so ensure it is off.
+		 * This was observed in practice on GTA04.
+		 */
+		ret = sirf_set_active(data, false);
+		if (ret < 0)
+			goto err_disable_rpm;
 	} else {
 		ret = sirf_runtime_resume(dev);
 		if (ret < 0)
-- 
2.11.0
