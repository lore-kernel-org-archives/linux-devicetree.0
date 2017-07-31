From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 04/14] dt-bindings: i2c: rk3x: add support for rv1108
Date: Mon, 31 Jul 2017 18:11:57 +0800
Message-ID: <1501495917-21554-1-git-send-email-andy.yan@rock-chips.com>
References: <1501495449-21290-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501495449-21290-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, wsa@the-dreams.de, Andy Yan <andy.yan@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add dt Document for i2c controller on rv1108

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 Documentation/devicetree/bindings/i2c/i2c-rk3x.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.txt b/Documentation/devicetree/bindings/i2c/i2c-rk3x.txt
index e18445d..22f2eeb 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.txt
@@ -7,6 +7,7 @@ Required properties :
 
  - reg : Offset and length of the register set for the device
  - compatible: should be one of the following:
+   - "rockchip,rv1108-i2c": for rv1108
    - "rockchip,rk3066-i2c": for rk3066
    - "rockchip,rk3188-i2c": for rk3188
    - "rockchip,rk3228-i2c": for rk3228
-- 
2.7.4
