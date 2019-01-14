From: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 0/4] NanoPC-T4 (and a bit of NanoPi M4) support
Date: Mon, 14 Jan 2019 12:05:30 +0000
Message-ID: <cover.1547466003.git.robin.murphy@arm.com>
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
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi all,

With the initial patch now queued (thankfully solving the version-number
conundrum), here's an updated v2 of my further changes with the tweaks
Heiko pointed out. Comparing GRF dumps didn't give any insight into the
SD card thing, so I've kept the GPIO patch; ~100 interrupts per insertion
is still more useful than 0!

Robin.


Robin Murphy (4):
  arm64: dts: rockchip: Add DT for NanoPi M4
  arm64: dts: rockchip: Refine nanopi4 differences
  arm64: dts: rockchip: Add NanoPC-T4 IR receiver
  arm64: dts: rockchip: 'Fix' nanopi4 uSD card detect

 .../devicetree/bindings/arm/rockchip.yaml     |  6 +-
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../boot/dts/rockchip/rk3399-nanopc-t4.dts    | 74 +++++++++++++++++++
 .../boot/dts/rockchip/rk3399-nanopi-m4.dts    | 66 +++++++++++++++++
 .../boot/dts/rockchip/rk3399-nanopi4.dtsi     | 74 ++++---------------
 5 files changed, 158 insertions(+), 63 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dts

-- 
2.20.1.dirty
