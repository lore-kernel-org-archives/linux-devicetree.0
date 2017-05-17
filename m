From: Frank Wang <frank.wang@rock-chips.com>
Subject: [PATCH v2 1/3] arm: dts: rk322x: fix i2s1 pinctrl error
Date: Wed, 17 May 2017 17:52:24 +0800
Message-ID: <1495014746-27621-2-git-send-email-frank.wang@rock-chips.com>
References: <1495014746-27621-1-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1495014746-27621-1-git-send-email-frank.wang@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: heiko@sntech.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, wim@iguana.be, linux@roeck-us.net, ellisys@163.com
Cc: huangtao@rock-chips.com, devicetree@vger.kernel.org, charles.chen@rock-chips.com, wmc@rock-chips.com, kevan.lan@rock-chips.com, linux-kernel@vger.kernel.org, sugar.zhang@rock-chips.com, linux-rockchip@lists.infradead.org, Frank Wang <frank.wang@rock-chips.com>, cody.xie@rock-chips.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Sugar Zhang <sugar.zhang@rock-chips.com>

Refer to Chapter 5.3.2 of rk3229 TRM, we can see that GPIO1A[2,4,5]
using RK_FUNC_2 not RK_FUNC_1. This patch fixes it.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
---
 arch/arm/boot/dts/rk322x.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index 48a0c1c..cc6a27d 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -621,9 +621,9 @@
 						<0 12 RK_FUNC_1 &pcfg_pull_none>,
 						<0 13 RK_FUNC_1 &pcfg_pull_none>,
 						<0 14 RK_FUNC_1 &pcfg_pull_none>,
-						<1 2 RK_FUNC_1 &pcfg_pull_none>,
-						<1 4 RK_FUNC_1 &pcfg_pull_none>,
-						<1 5 RK_FUNC_1 &pcfg_pull_none>;
+						<1 2 RK_FUNC_2 &pcfg_pull_none>,
+						<1 4 RK_FUNC_2 &pcfg_pull_none>,
+						<1 5 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
-- 
2.0.0
