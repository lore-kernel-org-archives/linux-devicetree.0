From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v4 02/20] arm64: dts: hisilicon: update compatible string for hikey960
Date: Thu, 15 Jun 2017 11:03:59 +0800
Message-ID: <20170615030417.14059-3-guodong.xu@linaro.org>
References: <20170615030417.14059-1-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170615030417.14059-1-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, arnd@arndb.de, gregory.clement@free-electrons.com, horms+renesas@verge.net.au, olof@lixom.net, thomas.petazzoni@free-electrons.com, yamada.masahiro@socionext.com, riku.voipio@linaro.org, treding@nvidia.com, krzk@kernel.org, eric@anholt.net, damm+renesas@opensource.se, ard.biesheuvel@linaro.org, linus.walleij@linaro.org, geert+renesas@glider.be
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, hw.wangxiaoyin@hisilicon.com, Guodong Xu <guodong.xu@linaro.org>, Chen Feng <puck.chen@hisilicon.com>
List-Id: devicetree@vger.kernel.org

Update compatible string for hikey960. HiKey960 is a develpment board built
with SoC Hi3660.

Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
Signed-off-by: Chen Feng <puck.chen@hisilicon.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index 186251f..64875a5 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -12,7 +12,7 @@
 
 / {
 	model = "HiKey960";
-	compatible = "hisilicon,hi3660";
+	compatible = "hisilicon,hi3660-hikey960", "hisilicon,hi3660";
 
 	aliases {
 		serial5 = &uart5;       /* console UART */
-- 
2.10.2
