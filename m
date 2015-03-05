From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 1/2] phy: miphy365x: Convert to devm_kcalloc and fix wrong
 sizof
Date: Thu, 05 Mar 2015 09:52:59 +0800
Message-ID: <1425520379.1637.7.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Lee Jones <lee.jones@linaro.org>, Alexandre Torgue <alexandre.torgue@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Prefer devm_kcalloc over devm_kzalloc with multiply.
In additional, use sizeof(phy) is incorrect, fix it.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/phy/phy-miphy365x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/phy-miphy365x.c b/drivers/phy/phy-miphy365x.c
index 61177a6..51b459d 100644
--- a/drivers/phy/phy-miphy365x.c
+++ b/drivers/phy/phy-miphy365x.c
@@ -549,9 +549,8 @@ static int miphy365x_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	miphy_dev->nphys = of_get_child_count(np);
-	miphy_dev->phys = devm_kzalloc(&pdev->dev,
-				       sizeof(phy) * miphy_dev->nphys,
-				       GFP_KERNEL);
+	miphy_dev->phys = devm_kcalloc(&pdev->dev, miphy_dev->nphys,
+				       sizeof(*miphy_dev->phys), GFP_KERNEL);
 	if (!miphy_dev->phys)
 		return -ENOMEM;
 
-- 
1.9.1
