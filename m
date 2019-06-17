From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 4/4] MAINTAINERS: Add entry for ATC260x PMIC
Date: Mon, 17 Jun 2019 21:20:11 +0530
Message-ID: <20190617155011.15376-5-manivannan.sadhasivam@linaro.org>
References: <20190617155011.15376-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617155011.15376-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org
Cc: afaerber@suse.de, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com, devicetree@vger.kernel.org, linus.walleij@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add MAINTAINERS entry for ATC260x PMIC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 11d6937c4688..57112194cd90 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2646,6 +2646,15 @@ S:	Supported
 F:	Documentation/aoe/
 F:	drivers/block/aoe/
 
+ATC260X PMIC MFD DRIVER
+M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+S:	Maintained
+L:	linux-actions@lists.infradead.org
+F:	Documentation/devicetree/bindings/mfd/atc260x.txt
+F:	include/linux/mfd/atc260x/*
+F:	drivers/mfd/atc260*
+F:	drivers/regulator/atc260x-regulator.c
+
 ATHEROS 71XX/9XXX GPIO DRIVER
 M:	Alban Bedel <albeu@free.fr>
 W:	https://github.com/AlbanBedel/linux
-- 
2.17.1
