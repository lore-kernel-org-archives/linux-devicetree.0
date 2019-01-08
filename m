From: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 0/5] NanoPC-T4 (and a bit of NanoPi M4) support
Date: Tue,  8 Jan 2019 21:57:22 +0000
Message-ID: <cover.1546981251.git.robin.murphy@arm.com>
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
Cc: linux-rockchip@lists.infradead.org, tomeu.vizoso@collabora.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi all,

Since I finally got to spend some quality time with my NanoPC-T4 over
the holidays, I set to testing Tomeu's v4 patch, and ended up poring
over the schematics of all 3 boards and doing a fair bit more hacking.
I've taken the liberty of addressing the remaining review comments and
posting it as v5 here so as to also start adding stuff on top. My
current step is trying to get Wifi and Bluetooth working reliably...

Robin.


Robin Murphy (4):
  arm64: dts: rockchip: Add DT for NanoPi M4
  arm64: dts: rockchip: Refine nanopi4 differences
  arm64: dts: rockchip: Add NanoPC-T4 IR receiver
  arm64: dts: rockchip: Fix nanopi4 uSD card detect

Tomeu Vizoso (1):
  arm64: dts: rockchip: Add DT for NanoPC-T4

 .../devicetree/bindings/arm/rockchip.yaml     |  10 +
 arch/arm64/boot/dts/rockchip/Makefile         |   2 +
 .../boot/dts/rockchip/rk3399-nanopc-t4.dts    |  91 +++
 .../boot/dts/rockchip/rk3399-nanopi-m4.dts    |  66 ++
 .../boot/dts/rockchip/rk3399-nanopi4.dtsi     | 677 ++++++++++++++++++
 5 files changed, 846 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi

-- 
2.17.1
