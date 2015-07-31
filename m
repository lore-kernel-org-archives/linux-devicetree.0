From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [RFCv3 0/4] Adding support for Zynq Reset Controller
Date: Thu, 30 Jul 2015 18:13:53 -0700
Message-ID: <1438305237-18497-1-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>
List-Id: devicetree@vger.kernel.org

Hi all,

I made another RFC addressing most of the feedback that I got so far.

I haven't completly given up on S=C3=B6ren's idea of getting rid of hav=
ing
some sort of protection against people using wrong bits by accident,
but haven't come up with a clean way to do so yet (especially when look=
ing at
the possiblity of also supporting the upcoming Zynq's reset controller)=
=2E

I changed the reg property to <0x200 0x48> but I'm not sure if that's c=
orrect.
At 0x24C there's the RS_AWDT_CTRL which is not a reset. The last legit =
one
is A9_CPU_RST_CTRL at 0x244.

As Michal requested I removed the #include syntax from the devicetree b=
indings.

Thanks for your reviews,

Moritz

Moritz Fischer (4):
  docs: dts: Added documentation for Xilinx Zynq Reset Controller
    bindings.
  dts: zynq: Add devicetree entry for Xilinx Zynq reset controller.
  reset: reset-zynq: Adding support for Xilinx Zynq reset controller.
  ARM: zynq: Select ARCH_HAS_RESET_CONTROLLER

 .../devicetree/bindings/reset/zynq-reset.txt       |  68 +++++++++
 arch/arm/boot/dts/zynq-7000.dtsi                   |   8 ++
 arch/arm/mach-zynq/Kconfig                         |   1 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-zynq.c                         | 155 +++++++++++++=
++++++++
 5 files changed, 233 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/zynq-reset.=
txt
 create mode 100644 drivers/reset/reset-zynq.c

--=20
2.4.3
