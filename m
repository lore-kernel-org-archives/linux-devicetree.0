From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/2] dt-bindings: ARM: dts: rockchip: Add rk3288-veyron-jerry rev 10-15
Date: Fri, 22 Mar 2019 12:59:23 -0700
Message-ID: <20190322195924.70448-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: mka@chromium.org, ryandcase@chromium.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Alexis Ballier <aballier@gentoo.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Akash Gajjar <Akash_Gajjar@mentor.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

As far as I can tell/remember rev10 was originally created to support
making a SKU of jerry that had a different LCD.  rev11-rev15 were
added to give some wiggle room for future builds.  Downstream has a
separate device tree for rev10-rev15 (compared to rev3-rev7) with the
expectation that differences relating to the LCD would be accounted
for there but nothing was ever added to the rev10-rev15 making it
identical to the rev3-rev7 one.

It's likely nothing actually shipped with rev10-rev15 but they are
listed in the downstream kernel's device tree and it seems like it
should add a little safety if we match them here just in case
something actually shipped with one of these revisions and that device
will break if we don't claim support.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 0161b4a66586..864ee1fddcb0 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -160,6 +160,12 @@ properties:
 
       - description: Google Jerry (Hisense Chromebook C11 and more)
         items:
+          - const: google,veyron-jerry-rev15
+          - const: google,veyron-jerry-rev14
+          - const: google,veyron-jerry-rev13
+          - const: google,veyron-jerry-rev12
+          - const: google,veyron-jerry-rev11
+          - const: google,veyron-jerry-rev10
           - const: google,veyron-jerry-rev7
           - const: google,veyron-jerry-rev6
           - const: google,veyron-jerry-rev5
-- 
2.21.0.392.gf8f6787159e-goog
