From: Christina Quast <cquast@hanoverdisplays.com>
Subject: [PATCH] Document: dt: binding: imx: Fix PAD_CTL_DSE_X*
Date: Fri, 22 Feb 2019 17:00:38 +0000
Message-ID: <20190222170038.9669-1-cquast@hanoverdisplays.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: aisheng.dong@nxp.com
Cc: festevam@gmail.com, shawnguo@kernel.org, stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cquast@hanoverdisplays.com
List-Id: devicetree@vger.kernel.org

In the iMX7d datasheet, the PAD_CTL_DSE_X* values are different from
the documentation.

Signed-off-by: Christina Quast <cquast@hanoverdisplays.com>
---
 .../devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
index 6666277c3acb..8ac1d0851a0f 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
@@ -48,9 +48,9 @@ PAD_CTL_HYS                     (1 << 3)
 PAD_CTL_SRE_SLOW                (1 << 2)
 PAD_CTL_SRE_FAST                (0 << 2)
 PAD_CTL_DSE_X1                  (0 << 0)
-PAD_CTL_DSE_X2                  (1 << 0)
-PAD_CTL_DSE_X3                  (2 << 0)
-PAD_CTL_DSE_X4                  (3 << 0)
+PAD_CTL_DSE_X4                  (1 << 0)
+PAD_CTL_DSE_X2                  (2 << 0)
+PAD_CTL_DSE_X6                  (3 << 0)
 
 Examples:
 While iomuxc-lpsr is intended to be used by dedicated peripherals to take
-- 
2.20.1




 
Please consider the environment before printing this email
 

 
 
 
The information transmitted is intended only for the person or entity to which it is addressed and may contain confidential and/or privileged material. Any review, retransmission, dissemination or other use of, or taking of any action in reliance upon, this information by persons or entities other than the intended recipient is prohibited.
If you received this in error, please contact the sender or postmaster (postmaster@hanoverdisplays.com) and delete the material from any computer.
Although we routinely screen for viruses, addressees should check this e-mail and any attachment for viruses. We make no warranty as to absence of viruses in this e-mail or any attachments.
Our Company's email policy is to permit incidental personal use. If this email is of a personal nature, it must not be relied upon as expressing the views or opinions of the company.
