Return-Path: <SRS0=v28C=OU=gmail.com=thierry.reding@kernel.org>
From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 2/3] media: tegra-cec: Support Tegra186 and Tegra194
Date: Tue, 11 Dec 2018 10:48:40 +0100
Message-Id: <20181211094841.16027-2-thierry.reding@gmail.com>
In-Reply-To: <20181211094841.16027-1-thierry.reding@gmail.com>
References: <20181211094841.16027-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

The CEC controller found on Tegra186 and Tegra194 is the same as on
earlier generations.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/media/platform/tegra-cec/tegra_cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/tegra-cec/tegra_cec.c b/drivers/media/platform/tegra-cec/tegra_cec.c
index aba488cd0e64..8a1e10d008d0 100644
--- a/drivers/media/platform/tegra-cec/tegra_cec.c
+++ b/drivers/media/platform/tegra-cec/tegra_cec.c
@@ -472,6 +472,8 @@ static const struct of_device_id tegra_cec_of_match[] = {
 	{ .compatible = "nvidia,tegra114-cec", },
 	{ .compatible = "nvidia,tegra124-cec", },
 	{ .compatible = "nvidia,tegra210-cec", },
+	{ .compatible = "nvidia,tegra186-cec", },
+	{ .compatible = "nvidia,tegra194-cec", },
 	{},
 };
 
-- 
2.19.1
