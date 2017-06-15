From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v4 16/20] dt-bindings: mfd: hi6421: Add hi6421v530 compatible string
Date: Thu, 15 Jun 2017 11:04:13 +0800
Message-ID: <20170615030417.14059-17-guodong.xu@linaro.org>
References: <20170615030417.14059-1-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170615030417.14059-1-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, arnd@arndb.de, gregory.clement@free-electrons.com, horms+renesas@verge.net.au, olof@lixom.net, thomas.petazzoni@free-electrons.com, yamada.masahiro@socionext.com, riku.voipio@linaro.org, treding@nvidia.com, krzk@kernel.org, eric@anholt.net, damm+renesas@opensource.se, ard.biesheuvel@linaro.org, linus.walleij@linaro.org, geert+renesas@glider.be
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, hw.wangxiaoyin@hisilicon.com, Guodong Xu <guodong.xu@linaro.org>
List-Id: devicetree@vger.kernel.org

Add compatible string for HiSilicon Hi6421v530 PMIC.

Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
Acked-for-mfd-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/devicetree/bindings/mfd/hi6421.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/hi6421.txt b/Documentation/devicetree/bindings/mfd/hi6421.txt
index 0d5a446..22da96d 100644
--- a/Documentation/devicetree/bindings/mfd/hi6421.txt
+++ b/Documentation/devicetree/bindings/mfd/hi6421.txt
@@ -1,7 +1,9 @@
 * HI6421 Multi-Functional Device (MFD), by HiSilicon Ltd.
 
 Required parent device properties:
-- compatible	: contains "hisilicon,hi6421-pmic";
+- compatible    : One of the following chip-specific strings:
+	"hisilicon,hi6421-pmic";
+	"hisilicon,hi6421v530-pmic";
 - reg		: register range space of hi6421;
 
 Supported Hi6421 sub-devices include:
-- 
2.10.2
