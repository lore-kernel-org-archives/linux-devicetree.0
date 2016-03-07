From: <tthayer@opensource.altera.com>
Subject: [PATCHv2 08/11] Documentation: dt: socfpga: Add Altera Arria10 L2 cache binding
Date: Mon, 7 Mar 2016 13:43:04 -0600
Message-ID: <1457379787-8327-9-git-send-email-tthayer@opensource.altera.com>
References: <1457379787-8327-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457379787-8327-1-git-send-email-tthayer@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com, tthayer@opensource.altera.com
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

Add the device tree binding string needed to support the Altera L2
cache on the Arria10 chip.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v2 Correct spelling of Arria10 in patch title.
---
 .../bindings/arm/altera/socfpga-eccmgr.txt         |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
index 885f93d..4cea386 100644
--- a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
+++ b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
@@ -13,7 +13,8 @@ Subcomponents:
 
 L2 Cache ECC
 Required Properties:
-- compatible : Should be "altr,socfpga-l2-ecc"
+- compatible : Should be "altr,socfpga-l2-ecc" or
+	       "altr,socfpga-a10-l2-ecc"
 - reg : Address and size for ECC error interrupt clear registers.
 - interrupts : Should be single bit error interrupt, then double bit error
 	interrupt. Note the rising edge type.
-- 
1.7.9.5
