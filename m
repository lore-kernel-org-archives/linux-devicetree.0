From: "jianqun.xu" <jay.xu@rock-chips.com>
Subject: [PATCH v4 3/6] spi: rockchip: add bindings for rk3399 spi
Date: Fri, 19 Feb 2016 09:56:15 +0800
Message-ID: <1455846978-4272-4-git-send-email-jay.xu@rock-chips.com>
References: <1455846978-4272-1-git-send-email-jay.xu@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455846978-4272-1-git-send-email-jay.xu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, jwerner@chromium.org, broonie@kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, sboyd@codeaurora.org, linus.walleij@linaro.org, sjoerd.simons@collabora.co.uk
Cc: huangtao@rock-chips.com, jay.xu@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jianqun Xu <jay.xu@rock-chips.com>

Add devicetree bindings for Rockchip rk3399 spi which found on
Rockchip rk3399 SoCs.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
changes in v4:
- none
changes in v3:
- add compatible for rk3399 spi (Mark, Heiko)
changes in v2:
- none

 Documentation/devicetree/bindings/spi/spi-rockchip.txt | 1 +
 drivers/spi/spi-rockchip.c                             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-rockchip.txt b/Documentation/devicetree/bindings/spi/spi-rockchip.txt
index 0c491bd..1b14d69 100644
--- a/Documentation/devicetree/bindings/spi/spi-rockchip.txt
+++ b/Documentation/devicetree/bindings/spi/spi-rockchip.txt
@@ -9,6 +9,7 @@ Required Properties:
     "rockchip,rk3066-spi" for rk3066.
     "rockchip,rk3188-spi", "rockchip,rk3066-spi" for rk3188.
     "rockchip,rk3288-spi", "rockchip,rk3066-spi" for rk3288.
+    "rockchip,rk3399-spi", "rockchip,rk3066-spi" for rk3399.
 - reg: physical base address of the controller and length of memory mapped
        region.
 - interrupts: The interrupt number to the cpu. The interrupt specifier format
diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
index 79a8bc4..345fefd 100644
--- a/drivers/spi/spi-rockchip.c
+++ b/drivers/spi/spi-rockchip.c
@@ -868,6 +868,7 @@ static const struct of_device_id rockchip_spi_dt_match[] = {
 	{ .compatible = "rockchip,rk3066-spi", },
 	{ .compatible = "rockchip,rk3188-spi", },
 	{ .compatible = "rockchip,rk3288-spi", },
+	{ .compatible = "rockchip,rk3399-spi", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, rockchip_spi_dt_match);
-- 
1.9.1
