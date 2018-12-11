Return-Path: <SRS0=v28C=OU=gmail.com=thierry.reding@kernel.org>
From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 3/3] media: tegra-cec: Export OF device ID match table
Date: Tue, 11 Dec 2018 10:48:41 +0100
Message-Id: <20181211094841.16027-3-thierry.reding@gmail.com>
In-Reply-To: <20181211094841.16027-1-thierry.reding@gmail.com>
References: <20181211094841.16027-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

Exporting the OF device ID match table allows udev to automatically load
the module upon receiving an "ADD" uevent for the CEC controller device.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/media/platform/tegra-cec/tegra_cec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/tegra-cec/tegra_cec.c b/drivers/media/platform/tegra-cec/tegra_cec.c
index 8a1e10d008d0..4e9f91528f77 100644
--- a/drivers/media/platform/tegra-cec/tegra_cec.c
+++ b/drivers/media/platform/tegra-cec/tegra_cec.c
@@ -476,6 +476,7 @@ static const struct of_device_id tegra_cec_of_match[] = {
 	{ .compatible = "nvidia,tegra194-cec", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, tegra_cec_of_match);
 
 static struct platform_driver tegra_cec_driver = {
 	.driver = {
-- 
2.19.1
