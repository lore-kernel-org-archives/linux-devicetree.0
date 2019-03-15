From: Alexis Ballier <aballier@gentoo.org>
Subject: [PATCH 2/3] arm64: dts: rockchip: rk3399-orangepi: Specify vid supply for the compass (AK09911)
Date: Fri, 15 Mar 2019 15:58:19 +0100
Message-ID: <20190315145818.23610-3-aballier@gentoo.org>
References: <20190315145818.23610-1-aballier@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315145818.23610-1-aballier@gentoo.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Alexis Ballier <aballier@gentoo.org>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Despite this not being mentioned in the binding documentation, this
generates a log at boot about it being missing.

Signed-off-by: Alexis Ballier <aballier@gentoo.org>
Cc: devicetree@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---

Should the binding doc be updated ?
---
 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts b/arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts
index 6bc2e545f2fb..96ccbe5c4f0c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts
@@ -472,6 +472,7 @@
 		compatible = "asahi-kasei,ak09911";
 		reg = <0x0c>;
 		vdd-supply = <&vcc3v3_s3>;
+		vid-supply = <&vcc3v3_s3>;
 	};
 
 	mpu6500@68 {
-- 
2.21.0
