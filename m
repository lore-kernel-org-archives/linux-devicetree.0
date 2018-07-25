Return-Path: <SRS0=GvcF=KJ=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 0/3] serial: sh-sci: Add support for RZ/A2
Date: Wed, 25 Jul 2018 09:38:47 -0500
Message-Id: <20180725143850.32985-1-chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

The RZ/A2 uses a modified SCIF that until recently was only used in
Renesas MCU devices (not MPU devices).
So, while it functions mostly the same as a normal SCIF, some things
needed to be shifted around.

In the end, a standard compatible = "renesas,scif" is all that is really
needed (not a SoC specific "renesas,scif-r7s9210").

Becase there is no device tree yet, here is sample of what it would
look like:

	scif0: serial@e8007000 {
		compatible = "renesas,scif-r7s9210", "renesas,scif";
		reg = <0xe8007000 18>;
		interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
			     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
			     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
			     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
			     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
			     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
		clocks = <&mstp4_clks R7S9210_CLK_SCIF0>;
		clock-names = "fck";
		power-domains = <&cpg_clocks>;
		status = "disabled";
	};



Chris Brandt (3):
  serial: sh-sci: Allow for compressed SCIF address space
  serial: sh-sci: Add support for separate TEI+DRI interrupts
  serial: sh-sci: Document r7s9210 bindings

 .../bindings/serial/renesas,sci-serial.txt         | 17 +++++-
 drivers/tty/serial/sh-sci.c                        | 66 ++++++++++++++++++----
 2 files changed, 70 insertions(+), 13 deletions(-)

-- 
2.16.1
