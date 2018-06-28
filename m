From: Michel Pollet <michel.pollet@bp.renesas.com>
Subject: [PATCH v7 0/3] Renesas R9A06G032 SMP enabler
Date: Thu, 28 Jun 2018 09:17:11 +0100
Message-ID: <1530173842-56851-1-git-send-email-michel.pollet@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>
Cc: phil.edworthy@renesas.com, Michel Pollet <buserror+upstream@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, Douglas Anderson <dianders@chromium.org>, Kevin Hilman <khilman@baylibre.com>, Chen-Yu Tsai <wens@csie.org>, Stefan Wahren <stefan.wahren@i2se.com>, Rajendra Nayak <rnayak@codeaurora.org>, Carlo Caione <carlo@endlessm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

*WARNING -- this requires the base R9A06G032 support patches
already posted

This patch series is for enabling the second CA7 of the R9A06G032.
It's based on a spin_table method, and it reuses the same binding
property as that driver.

v7:
 + Moved to drivers/soc/renesas, as requested.
v6:
 + Passed scriptcheck --strict on the driver.
 + Rebased on base patchset v10
v5:
  + Fixed a couple of typos
  + Added the Reviewed-by tags where appropriate
  + Rebased on base patch v9
  + Replaced the dts property with a 64 bits one.
  + Changed the driver to support 32 or 64 bits property.
v4:
  + Geert's comments adressed.
  + Renamed symbols to r9a06g032 to match the rest of patchset
  + Rebased on base patch v8
v3:
  + Removed mentions of rz/?n1d?
  + Rebased on base patch v7
v2:
  + Added suggestions from Florian Fainelli
  + Use __pa_symbol()
  + Simplified logic in prepare_cpu()
  + Reordered the patches
  + Rebased on RZN1 Base patch v5

Michel Pollet (3):
  dt-bindings: cpu: Add Renesas R9A06G032 SMP enable method.
  arm: shmobile: Add the R9A06G032 SMP enabler driver
  ARM: dts: Renesas R9A06G032 SMP enable method

 Documentation/devicetree/bindings/arm/cpus.txt |  1 +
 arch/arm/boot/dts/r9a06g032.dtsi               |  2 +
 drivers/soc/renesas/Makefile                   |  1 +
 drivers/soc/renesas/r9a06g032-smp.c            | 96 ++++++++++++++++++++++++++
 4 files changed, 100 insertions(+)
 create mode 100644 drivers/soc/renesas/r9a06g032-smp.c

-- 
2.7.4
