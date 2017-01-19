From: Eddie Cai <eddie.cai.linux@gmail.com>
Subject: [PATCH 0/2] Add support for RK3288 Tinker board
Date: Thu, 19 Jan 2017 10:11:57 +0800
Message-ID: <1484791919-4665-1-git-send-email-eddie.cai@rock-chips.com>
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
To: robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de, linux@armlinux.org.uk
Cc: devicetree@vger.kernel.org, Eddie Cai <eddie.cai@rock-chips.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch set add support for RK3288 Tinker board. 
Tinker board is a credit card size develop board powered by RK3288.

Eddie Cai (2):
  dt-bindings: add Asus Tinker board
  ARM: dts: rockchip: add dts for RK3288-Tinker board

 Documentation/devicetree/bindings/arm/rockchip.txt |   3 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/rk3288-tinker.dts                | 556 +++++++++++++++++++++
 3 files changed, 560 insertions(+)
 create mode 100644 arch/arm/boot/dts/rk3288-tinker.dts

-- 
2.7.4
