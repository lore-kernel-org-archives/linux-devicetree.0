From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/6] ARM: dts: rockchip: Add BQ Edison2 QuadCore tablet
Date: Tue, 13 Nov 2018 14:05:53 +0100
Message-ID: <20181113130559.31221-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a devicetree for the BQ Edison2 tablet from MundoReader.
Incidentially this is the device I wanted to run mainline Linux
on when starting the Rockchip port - thinking, "this can't take
thaaat long" ;-) - so I've come somewhat full-circle now.

With Lima it can also use gpu acceleration for gles2.

Notable absent peripherals are the touchscreen (ft5606),
IT66121 hdmi bridge (internal panel is working nicely) and sound.
All areas I'm still trying to get working.

The series includes some smallish cleanups before the board
with cleaning up the cpu-core nodes being a big part.

And there are a number of driver-side additions pending that
should get accepted before the board itself can go in.
(bq24196, Innolux panel, tmp108-interrupt).


Heiko Stuebner (6):
  ARM: dts: rockchip: add #sound-dai-cells to Cortex-A9 i2s
  ARM: dts: rockchip: convert rk3188 to opp-v2
  ARM: dts: rockchip: add cpu-core resets for rk3188
  ARM: dts: rockchip: add phandles to secondary cpu cores
  ARM: dts: rockchip: update cpu supplies on rk3188
  ARM: dts: rockchip: add BQ Edison 2 QC devicetree

 .../devicetree/bindings/arm/rockchip.txt      |   4 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/rk3066a.dtsi                |   3 +
 arch/arm/boot/dts/rk3188-bqedison2qc.dts      | 711 ++++++++++++++++++
 arch/arm/boot/dts/rk3188-px3-evb.dts          |  14 +-
 arch/arm/boot/dts/rk3188-radxarock.dts        |  14 +-
 arch/arm/boot/dts/rk3188.dtsi                 |  66 +-
 7 files changed, 797 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm/boot/dts/rk3188-bqedison2qc.dts

-- 
2.18.0
