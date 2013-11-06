From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2 1/5] mfd: as3722: add clock driver as mfd-sub device
Date: Wed, 6 Nov 2013 17:48:19 +0530
Message-ID: <1383740303-10956-2-git-send-email-ldewangan@nvidia.com>
References: <1383740303-10956-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1383740303-10956-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, sameo@linux.intel.com, mturquette@linaro.org, dwmw2@infradead.org, anton@enomsg.org
Cc: mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, rob.herring@calxeda.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Device ams AS3722 supports the one 32KHz clock output. The clock
control support is provided through clock driver.

Add clock driver as mfd sub device to probe the clock driver.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
Changes from V1:
- Move the DT doc change to separate change.

 drivers/mfd/as3722.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mfd/as3722.c b/drivers/mfd/as3722.c
index f161f2e..1d3415c 100644
--- a/drivers/mfd/as3722.c
+++ b/drivers/mfd/as3722.c
@@ -72,6 +72,9 @@ static struct mfd_cell as3722_devs[] = {
 		.resources = as3722_adc_resource,
 	},
 	{
+		.name = "as3722-clk",
+	},
+	{
 		.name = "as3722-power-off",
 	},
 };
-- 
1.7.1.1
