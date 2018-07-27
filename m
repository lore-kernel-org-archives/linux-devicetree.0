Return-Path: <SRS0=Pf9O=KL=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 0/4] serial: sh-sci: Clean up previous RZ/A2 support
Date: Fri, 27 Jul 2018 16:09:12 -0500
Message-Id: <20180727210916.66642-1-chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch series doesn't really provide much new functionality, but
rather provides a cleaner solution for adding RZ/A2 support.


Chris Brandt (4):
  serial: sh-sci: Improve interrupts description
  serial: sh-sci: Allow for compressed SCIF address
  serial: sh-sci: Remove SCIx_RZ_SCIFA_REGTYPE
  serial: sh-sci: Improve support for separate TEI and DRI interrupts

 .../bindings/serial/renesas,sci-serial.txt         |  16 ++-
 drivers/tty/serial/sh-sci.c                        | 143 ++++++++-------------
 include/linux/serial_sci.h                         |   1 -
 3 files changed, 68 insertions(+), 92 deletions(-)

-- 
2.16.1
