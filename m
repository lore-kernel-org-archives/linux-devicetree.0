From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 3/6] arm64: dts: rockchip: enable typec-phy for
 rk3399-sapphire.
Date: Thu,  1 Mar 2018 10:24:17 +0100
Message-ID: <20180301092420.1191-4-enric.balletbo@collabora.com>
References: <20180301092420.1191-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180301092420.1191-1-enric.balletbo@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: kishon@ti.com, heiko@sntech.de
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, gwendal@chromium.org, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Shawn Lin <shawn.lin@rock-chips.com>, Will Deacon <will.deacon@arm.com>, Kever Yang <kever.yang@rock-chips.com>, vicencb@gmail.com, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Jacob Chen <jacob-chen@iotwrt.com>, groeck@chromium.org, kernel@collabora.com, Jianqun Xu <jay.xu@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Commit c301b327aea898af ("arm64: dts: rockchip: add usb3-phy otg-port
support for rk3399") caused a regression regarding the USB3 type-A port.
During boot, the following message appears a few times:

  dwc3: failed to initialize core

The driver is deferred waiting for the typec-phy, but this never happens
bceause is disabled. So, enable it.

Fixes: c301b327aea898af ("arm64: dts: rockchip: add usb3-phy otg-port support for rk3399")
Reported-by: Vicente Bergas <vicencb@gmail.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi
index ce592a4c0c4c..9c685eab4748 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi
@@ -557,6 +557,14 @@
 	status = "okay";
 };
 
+&tcphy0 {
+	status = "okay";
+};
+
+&tcphy1 {
+	status = "okay";
+};
+
 &u2phy0 {
 	status = "okay";
 
-- 
2.16.1
