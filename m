From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 0/2] ARM: topology: Allow to set the frequency through a clock
Date: Wed, 21 May 2014 21:33:14 +0200
Message-ID: <1400700796-5763-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Nicolas Pitre <nico@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Hi,

This patch series add the possibility for the topology code to get the
CPU frequency through a DT clock handle instead of needing a
clock-frequency property.

Indeed, this information can be quite redundant if the clock tree
defined in the DT is already describing the CPU parent clock.

Maxime

Maxime Ripard (2):
  ARM: topology: Use a clock if possible to get the CPU frequency
  ARM: sunxi: Add clocks node to the CPU nodes

 arch/arm/boot/dts/sun6i-a31.dtsi |  4 ++++
 arch/arm/boot/dts/sun7i-a20.dtsi |  2 ++
 arch/arm/kernel/topology.c       | 24 +++++++++++++++++-------
 3 files changed, 23 insertions(+), 7 deletions(-)

-- 
1.9.3
