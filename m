Return-Path: <SRS0=m83C=J3=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 0/2] serial: sh-sci: Add support for RZ/A2
Date: Wed, 11 Jul 2018 09:41:29 -0500
Message-Id: <20180711144131.73552-1-chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

The RZ/A2 uses a modified SCIF that until recently was only used in
Renesas MCU devices (not MPU devices).
So, while it functions mostly the same as a normal SCIF, some things
needed to be shifted around.


Chris Brandt (2):
  serial: sh-sci: Add support for R7S9210
  serial: sh-sci: Document r7s9210 bindings

 .../bindings/serial/renesas,sci-serial.txt         |  1 +
 drivers/tty/serial/sh-sci.c                        | 77 +++++++++++++++++++++-
 include/linux/serial_sci.h                         |  1 +
 3 files changed, 77 insertions(+), 2 deletions(-)

-- 
2.16.1
