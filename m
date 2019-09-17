From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 11/13] dt-bindings: document PX30 usb2phy General Register Files
Date: Tue, 17 Sep 2019 10:26:57 +0200
Message-ID: <20190917082659.25549-11-heiko@sntech.de>
References: <20190917082659.25549-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917082659.25549-1-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-rockchip@lists.infradead.org, christoph.muellner@theobroma-systems.com, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

One of the separate General Register Files contains the registers for
controlling the usb2phy, so add the necessary binding compatible for it.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.txt b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
index 46e27cd69f18..d7debec26ba4 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.txt
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
@@ -30,6 +30,7 @@ Required Properties:
 - compatible: SGRF should be one of the following
    - "rockchip,rk3288-sgrf", "syscon": for rk3288
 - compatible: USB2PHYGRF should be one of the followings
+   - "rockchip,px30-usb2phy-grf", "syscon": for px30
    - "rockchip,rk3328-usb2phy-grf", "syscon": for rk3328
 - compatible: USBGRF should be one of the following
    - "rockchip,rv1108-usbgrf", "syscon": for rv1108
-- 
2.20.1
