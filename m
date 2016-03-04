From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 0/3] ARM: bcm2835: Include VC4 GPU in the DT
Date: Fri,  4 Mar 2016 12:32:05 -0800
Message-ID: <1457123528-13482-1-git-send-email-eric@anholt.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

This has been floating around out of tree, and the Pi Foundation is
including a variant of it in the device tree overlay in its firmware
update system.

Eric Anholt (3):
  dt-bindings: Add binding docs for V3D.
  drm/vc4: Recognize a more specific compatible string for V3D.
  ARM: bcm2835: Add VC4 to the device tree.

 .../devicetree/bindings/display/brcm,bcm-vc4.txt   | 12 ++++++
 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts           |  4 ++
 arch/arm/boot/dts/bcm2835-rpi-a.dts                |  4 ++
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts           |  4 ++
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts           |  4 ++
 arch/arm/boot/dts/bcm2835-rpi-b.dts                |  4 ++
 arch/arm/boot/dts/bcm2835-rpi.dtsi                 |  9 +++++
 arch/arm/boot/dts/bcm2836-rpi-2-b.dts              |  4 ++
 arch/arm/boot/dts/bcm283x.dtsi                     | 47 ++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_v3d.c                      |  1 +
 10 files changed, 93 insertions(+)

-- 
2.7.0
