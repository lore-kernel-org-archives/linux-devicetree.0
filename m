From: Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 0/3] arm64: dts: rockchip: rk3368 add dmac and i2s nodes
Date: Fri, 17 Mar 2017 11:32:41 +0800
Message-ID: <1489721564-32203-1-git-send-email-jay.xu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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

These patches add dmac, i2s nodes, and disable mailbox.

Jianqun Xu (3):
  arm64: dts: rockchip: add amba node support for RK3368 SoCs
  arm64: dts: rockchip: add i2s nodes support for RK3368 SoCs
  arm64: dts: rockchip: disable mailbox of RK3368 SoCs defaultly

 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 70 ++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

-- 
1.9.1
