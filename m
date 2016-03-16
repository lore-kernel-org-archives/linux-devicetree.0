From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v4 0/8] arm64: rockchip: Initial GeekBox enablement
Date: Wed, 16 Mar 2016 14:58:38 +0100
Message-ID: <1458136727-32075-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

This series adds initial support for the RK3368 based GeekBox.

v4 does small cleanups and decouples us again from the stmmac discussio=
ns v3 kicked off.

stmmac patches have been proposed to fix GMAC issues in linux-next (and=
 v4.5):

https://patchwork.ozlabs.org/patch/598331/
https://patchwork.ozlabs.org/patch/598332/

Regards,
Andreas

Cc: devicetree@vger.kernel.org

Andreas F=C3=A4rber (8):
  arm64: dts: rockchip: Clean up /memory nodes
  Documentation: devicetree: Add vendor prefix for GeekBuying.com
  Documentation: devicetree: rockchip: Document GeekBox
  arm64: dts: rockchip: Add GeekBox config
  arm64: dts: rockchip: Clean up gpio-keys nodes
  arm64: dts: rockchip: Add power key to GeekBox
  Documentation: devicetree: rockchip: Document Landingship
  arm64: dts: rockchip: Add Landingship config

 Documentation/devicetree/bindings/arm/rockchip.txt |   9 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm64/boot/dts/rockchip/Makefile              |   2 +
 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi       |   9 +-
 .../dts/rockchip/rk3368-geekbox-landingship.dts    |  57 ++++
 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts    | 319 +++++++++++++=
++++++++
 arch/arm64/boot/dts/rockchip/rk3368-r88.dts        |   9 +-
 7 files changed, 396 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-geekbox-landing=
ship.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts

--=20
2.6.2
