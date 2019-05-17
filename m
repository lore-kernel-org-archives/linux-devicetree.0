From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v5 0/6] Allwinner H6 Mali GPU support
Date: Fri, 17 May 2019 20:46:53 +0200
Message-ID: <20190517184659.18828-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Neil Armstrong <narmstrong@baylibre.com>, Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

The Allwinner H6 has a Mali-T720 MP2 which should be supported by
the new panfrost driver. This series fix two issues and introduce the
dt-bindings but a simple benchmark show that it's still NOT WORKING.

I'm pushing it in case someone want to continue the work.

This has been tested with Mesa3D 19.1.0-RC2 and a GPU bitness patch[1].

One patch is from Icenowy Zheng where I changed the order has required
by Rob Herring[2].

Thanks,
Clement

[1] https://gitlab.freedesktop.org/kszaq/mesa/tree/panfrost_64_32
[2] https://patchwork.kernel.org/patch/10699829/

[  345.204813] panfrost 1800000.gpu: mmu irq status=1
[  345.209617] panfrost 1800000.gpu: Unhandled Page fault in AS0 at VA
0x0000000002400400
[  345.209617] Reason: TODO
[  345.209617] raw fault status: 0x800002C1
[  345.209617] decoded fault status: SLAVE FAULT
[  345.209617] exception type 0xC1: TRANSLATION_FAULT_LEVEL1
[  345.209617] access type 0x2: READ
[  345.209617] source id 0x8000
[  345.729957] panfrost 1800000.gpu: gpu sched timeout, js=0,
status=0x8, head=0x2400400, tail=0x2400400, sched_job=000000009e204de9
[  346.055876] panfrost 1800000.gpu: mmu irq status=1
[  346.060680] panfrost 1800000.gpu: Unhandled Page fault in AS0 at VA
0x0000000002C00A00
[  346.060680] Reason: TODO
[  346.060680] raw fault status: 0x810002C1
[  346.060680] decoded fault status: SLAVE FAULT
[  346.060680] exception type 0xC1: TRANSLATION_FAULT_LEVEL1
[  346.060680] access type 0x2: READ
[  346.060680] source id 0x8100
[  346.561955] panfrost 1800000.gpu: gpu sched timeout, js=1,
status=0x8, head=0x2c00a00, tail=0x2c00a00, sched_job=00000000b55a9a85
[  346.573913] panfrost 1800000.gpu: mmu irq status=1
[  346.578707] panfrost 1800000.gpu: Unhandled Page fault in AS0 at VA
0x0000000002C00B80

Changes in v4:
 - Add bus_clock probe
 - Fix sanity check in io-pgtable
 - Add vramp-delay
 - Merge all boards into one patch
 - Remove upstreamed Neil A. patch

Changes in v3 (Thanks to Maxime Ripard):
 - Reauthor Icenowy for her path

Changes in v2 (Thanks to Maxime Ripard):
 - Drop GPU OPP Table
 - Add clocks and clock-names in required

Clément Péron (5):
  drm: panfrost: add optional bus_clock
  iommu: io-pgtable: fix sanity check for non 48-bit mali iommu
  dt-bindings: gpu: mali-midgard: Add H6 mali gpu compatible
  arm64: dts: allwinner: Add ARM Mali GPU node for H6
  arm64: dts: allwinner: Add mali GPU supply for H6 boards

Icenowy Zheng (1):
  dt-bindings: gpu: add bus clock for Mali Midgard GPUs

 .../bindings/gpu/arm,mali-midgard.txt         | 15 ++++++++++-
 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  6 +++++
 .../dts/allwinner/sun50i-h6-orangepi-3.dts    |  6 +++++
 .../dts/allwinner/sun50i-h6-orangepi.dtsi     |  6 +++++
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  6 +++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 14 +++++++++++
 drivers/gpu/drm/panfrost/panfrost_device.c    | 25 ++++++++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_device.h    |  1 +
 drivers/iommu/io-pgtable-arm.c                |  2 +-
 9 files changed, 78 insertions(+), 3 deletions(-)

-- 
2.17.1
