From: Inha Song <ideal.song@samsung.com>
Subject: [alsa-devel] [PATCH v2 1/2] mfd: arizona: Add support for OUTn_MONO
 register control
Date: Thu, 18 Dec 2014 19:53:15 +0900
Message-ID: <1418899996-19744-2-git-send-email-ideal.song@samsung.com>
References: <1418899996-19744-1-git-send-email-ideal.song@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1418899996-19744-1-git-send-email-ideal.song@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lee.jones@linaro.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, ckeepax@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com, Inha Song <ideal.song@samsung.com>
List-Id: devicetree@vger.kernel.org

Some boards need to set the OUTn_MONO register to configurates
the output signal path as a mono differential output. This
wlf,out-mono property is optional. If present, values must be
specified less than or equal to the number of output signals.
If values less than the number of output signals, elements
that has not been specified are set to 0 by default.

Example:
 - wlf,out-mono = <1 0 1>; /* set OUT1,OUT3 to mono differential */

Signed-off-by: Inha Song <ideal.song@samsung.com>
---
 drivers/mfd/arizona-core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index bce7c07..cc2927d 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -561,6 +561,16 @@ static int arizona_of_get_core_pdata(struct arizona *arizona)
 		count++;
 	}
 
+	count = 0;
+	of_property_for_each_u32(arizona->dev->of_node,
+				 "wlf,out-mono", prop, cur, val) {
+		if (count >= ARRAY_SIZE(arizona->pdata.out_mono))
+			break;
+
+		arizona->pdata.out_mono[count] = !!val;
+		count++;
+	}
+
 	return 0;
 }
 
-- 
2.0.0.390.gcb682f8
