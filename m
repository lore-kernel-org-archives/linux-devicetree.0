From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] ARM/arm64: dts: renesas: Describe RTS/CTS hardware flow control
Date: Wed,  4 May 2016 10:57:55 +0200
Message-ID: <1462352278-30327-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus,

This patch series updates the various Renesas DTSes to describe that
some UARTS have dedicated lines for RTS/CTS hardware flow control, and
that they are available for use (wired and enabled by pinmux
configuration), by adding the "uart-has-rtscts" property to
board-specific DTS files where appropriate.

While the actual DT binding updates documenting the "uart-has-rtscts"
property for SCIF(A) UARTs ("serial: sh-sci: Update DT binding
documentation for dedicated RTS/CTS") hasn't been accepted into tty-next
yet, this property is part of the Generic Serial DT Bindings
(Documentation/devicetree/bindings/serial/serial.txt), which has been
accepted.

Actual enablement of RTS/CTS hardware flow control (through setting the
CRTSCTS termios flag from userspace) depends on series "[PATCH v2 00/11]
serial: sh-sci: Hardware Flow Control Updates"
(http://www.spinics.net/lists/linux-serial/msg22535.html).
Note that setting the CRTSCTS flag for a serial port that is being used
as the kernel console is a bad idea ;-) You'll have better luck with
UARTs on expansion connectors, cfr. the topic/renesas-overlays branch of
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

Thanks!

Geert Uytterhoeven (3):
  ARM: dts: bockw: SCIF0 supports RTS/CTS hardware flow control
  ARM: dts: kzm9g: SCIFA4 supports RTS/CTS hardware flow control
  arm64: dts: salvator-x: SCIF1 supports RTS/CTS hardware flow control

 arch/arm/boot/dts/r8a7778-bockw.dts                | 1 +
 arch/arm/boot/dts/sh73a0-kzm9g.dts                 | 1 +
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 1 +
 3 files changed, 3 insertions(+)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
