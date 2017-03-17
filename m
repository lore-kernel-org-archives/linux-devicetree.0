From: Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v2 3/3] arm64: dts: rockchip: disable mailbox of RK3368 SoCs
 defaultly
Date: Fri, 17 Mar 2017 11:32:44 +0800
Message-ID: <1489721564-32203-4-git-send-email-jay.xu@rock-chips.com>
References: <1489721564-32203-1-git-send-email-jay.xu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1489721564-32203-1-git-send-email-jay.xu@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, heiko@sntech.de, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Default to disable mailbox in rk3368 core dts file.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
changes since v1:
- none

 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 74fbcc2..eeb31f1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -662,6 +662,7 @@
 		clocks = <&cru PCLK_MAILBOX>;
 		clock-names = "pclk_mailbox";
 		#mbox-cells = <1>;
+		status = "disabled";
 	};
 
 	pmugrf: syscon@ff738000 {
-- 
1.9.1
