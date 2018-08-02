From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 3/3] arm64: dts: rockchip: enable dwc2-based otg controller on
 px30-evb
Date: Thu,  2 Aug 2018 15:01:33 +0200
Message-ID: <20180802130133.4898-4-heiko@sntech.de>
References: <20180802130133.4898-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180802130133.4898-1-heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-usb@vger.kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, balbi@kernel.org, gregkh@linuxfoundation.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, cl@rock-chips.com, hminas@synopsys.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Enable the newly added controller on the px30 evaluation board.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/px30-evb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30-evb.dts b/arch/arm64/boot/dts/rockchip/px30-evb.dts
index c74aa910a631..263d7f3dbc44 100644
--- a/arch/arm64/boot/dts/rockchip/px30-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-evb.dts
@@ -206,6 +206,10 @@
 	status = "okay";
 };
 
+&usb20_otg {
+	status = "okay";
+};
+
 &usb_host0_ehci {
 	status = "okay";
 };
-- 
2.17.0
