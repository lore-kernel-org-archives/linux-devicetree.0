Return-Path: <SRS0=8Sio=KO=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 0/4] serial: sh-sci: Clean up previous RZ/A2 support
Date: Mon, 30 Jul 2018 08:17:12 -0500
Message-Id: <20180730131716.75484-1-chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch series doesn't really provide much new functionality, but
rather provides a cleaner solution for adding RZ/A2 support.

This series applies on top of tty-next

v2:
* Incorporated feedback from Geert
* Added Reviewed-by


Chris Brandt (4):
  serial: sh-sci: Improve interrupts description
  serial: sh-sci: Allow for compressed SCIF address
  serial: sh-sci: Remove SCIx_RZ_SCIFA_REGTYPE
  serial: sh-sci: Improve support for separate TEI and DRI interrupts

 .../bindings/serial/renesas,sci-serial.txt         |  16 ++-
 drivers/tty/serial/sh-sci.c                        | 146 ++++++++-------------
 include/linux/serial_sci.h                         |   1 -
 3 files changed, 70 insertions(+), 93 deletions(-)

-- 
2.16.1
