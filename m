From: Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: hisilicon: add bindings for hi3798cv200 SoC and Poplar board
Date: Wed, 22 Feb 2017 16:38:35 +0800
Message-ID: <1487752716-14824-2-git-send-email-xuejiancheng@hisilicon.com>
References: <1487752716-14824-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487752716-14824-1-git-send-email-xuejiancheng@hisilicon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, arnd@arndb.de, xuwei5@hisilicon.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, elder@linaro.org, mark.gregotski@linaro.org, peter.griffin@linaro.org, hermit.wangheming@hisilicon.com, yanhaifeng@hisilicon.com, xuejiancheng@hisilicon.com
List-Id: devicetree@vger.kernel.org

Add bindings for HiSilicon hi3798cv200 SoC and Poplar Board.

Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
---
 Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
index f1c1e21..1fd3dd7 100644
--- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
+++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
@@ -4,6 +4,10 @@ Hi3660 SoC
 Required root node properties:
 	- compatible = "hisilicon,hi3660";
 
+Hi3798cv200 Poplar Board
+Required root node properties:
+	- compatible = "hisilicon,hi3798cv200-poplar", "hisilicon,hi3798cv200";
+
 Hi4511 Board
 Required root node properties:
 	- compatible = "hisilicon,hi3620-hi4511";
-- 
1.9.1
