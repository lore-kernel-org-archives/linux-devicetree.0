From: William Wu <william.wu@rock-chips.com>
Subject: [PATCH v2 0/2] Add usb2 nodes on RK3328 SoCs and enable usb2 on
 RK3328 evb
Date: Fri, 16 Jun 2017 18:34:13 +0800
Message-ID: <1497609255-15724-1-git-send-email-william.wu@rock-chips.com>
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
To: heiko@sntech.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, huangtao@rock-chips.com, frank.wang@rock-chips.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, william.wu@rock-chips.com, daniel.meng@rock-chips.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series adds support for usb2 on RK3328 SoCs.
Tested on RK3328 evaluation board.

William Wu (2):
  arm64: dts: rockchip: add usb2 nodes for RK3328 SoCs
  arm64: dts: rockchip: enable usb2 for RK3328 evaluation board

 arch/arm64/boot/dts/rockchip/rk3328-evb.dts | 25 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3328.dtsi    | 76 +++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)

-- 
2.0.0
