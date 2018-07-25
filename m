Return-Path: <SRS0=GvcF=KJ=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 0/3] ARM: shmobile: Add support for RZ/A2
Date: Wed, 25 Jul 2018 16:22:17 -0500
Message-Id: <20180725212220.44525-1-chris.brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Introduce RZ/A2 (R7S9210) as an SoC that can be selected.

There is no DT mainlined yet, so this is what the entry would look
like for the BSID register:

	bsid: chipid@fcfe8004 {
		compatible = "renesas,bsid";
		reg = <0xfcfe8004 4>;
	};



Chris Brandt (3):
  ARM: shmobile: Add basic RZ/A2 SoC support
  soc: renesas: identify RZ/A2
  dt-bindings: arm: Document RZ/A2 SoC DT bindings

 Documentation/devicetree/bindings/arm/shmobile.txt |  4 +-
 arch/arm/mach-shmobile/Kconfig                     |  6 +++
 arch/arm/mach-shmobile/Makefile                    |  1 +
 arch/arm/mach-shmobile/setup-r7s9210.c             | 27 ++++++++++
 drivers/soc/renesas/renesas-soc.c                  | 60 +++++++++++++++++-----
 5 files changed, 85 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm/mach-shmobile/setup-r7s9210.c

-- 
2.16.1
