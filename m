From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH v3 0/8] arm64: rockchip: Initial GeekBox enablement
Date: Sun,  6 Mar 2016 20:53:49 +0100
Message-ID: <1457294038-14243-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Julien Chauveau <chauveau.julien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

This series adds initial support for the RK3368 based GeekBox.

Since v2 almost a month has passed with none of the first patches getti=
ng queued
despite Heiko offering to squash them himself, so here's a full update.

There were no more replies on the compatible string discussion for Land=
ingship;
I have now adopted Heiko's proposal of using "geekbuying,geekbox-landin=
gship".

v3 does minor cleanups and starts squashing undisputed patches. The pow=
er button
is still left separate, inserting cleanups to align all RK3368 boards a=
t least.

On next-20160304 the GMAC seems to have regressed, it no longer finds t=
he PHY:

libphy: PHY stmmac-0:ffffffff not found
eth0: Could not attach to PHY
stmmac_open: Cannot attach to PHY (error: -19)

=46or v2 I may have screwed up testing the Landingship FDT; I now ran i=
nto this:

rk3x-i2c ff140000.i2c: using default SCL frequency: 100000
INFO: rcu_preempt detected stalls on CPUs/tasks:
        1-...: (1 GPs behind) idle=3D481/140000000000000/0 softirq=3D13=
0/131 fqs=3D5250=20
        (detected by 7, t=3D5254 jiffies, g=3D-239, c=3D-240, q=3D90)
Task dump for CPU 1:
swapper/0       R  running task        0     1      0 0x00000002
Call trace:
[<ffffff8008085c5c>] __switch_to+0xc4/0xd0
[<ffffff8008bc1000>] nonblocking_pool_data+0x20/0x80

Keeping i2c1 disabled avoids that; i2c2 does not run into such problems=
=2E
A quick git-grep shows that I'm the first actual user of i2c1 (and i2c2=
),
so maybe something's wrong with clocks or pinctrl?

Regards,
Andreas

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Andreas F=C3=A4rber (8):
  Documentation: devicetree: Add vendor prefix for GeekBuying.com
  Documentation: devicetree: rockchip: Document GeekBox
  arm64: dts: rockchip: Add GeekBox config
  Documentation: devicetree: Clean up gpio-keys example
  arm64: dts: rockchip: Clean up gpio-keys nodes
  arm64: dts: rockchip: Add power key to GeekBox
  Documentation: devicetree: rockchip: Document Landingship
  arm64: dts: rockchip: Add Landingship config

 Documentation/devicetree/bindings/arm/rockchip.txt |   9 +
 .../devicetree/bindings/input/gpio-keys.txt        |   2 -
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm64/boot/dts/rockchip/Makefile              |   2 +
 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi       |   5 +-
 .../dts/rockchip/rk3368-geekbox-landingship.dts    |  57 ++++
 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts    | 319 +++++++++++++=
++++++++
 arch/arm64/boot/dts/rockchip/rk3368-r88.dts        |   5 +-
 8 files changed, 392 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-geekbox-landing=
ship.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts

--=20
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
