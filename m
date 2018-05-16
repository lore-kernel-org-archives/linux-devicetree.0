From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 0/2] usb: dwc3: support clocks and resets for DWC3 core
Date: Wed, 16 May 2018 11:41:05 +0900
Message-ID: <1526438467-12470-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Roger Quadros <rogerq@ti.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org


In the current design of DWC3 driver,
the DT typically becomes a nested structure like follows:

  dwc3-glue {
          compatible = "foo,dwc3";
          ...

          dwc3 {
                  compatible = "snps,dwc3";
                  ...
          };
  }

The current DWC3 core (drivers/usb/dwc3/core.c) can not handle
clocks / resets at all.

The only solution we have now, is to put DWC3 core node under
the glue layer node, then add clocks and resets there.
Actually, dwc3-of-simple.c exists to handle clocks and resets.

As always for digital circuits, DWC3 core IP itself needs clock input.
This is specific to this IP.  So, supporting clocks and resets in
dwc3/core.c makes sense.

In this version, the number of clocks (and names) is specific
to this IP, with clock names taken from Synopsys datasheet.


Masahiro Yamada (2):
  usb: dwc3: use local copy of resource to fix-up register offset
  usb: dwc3: support clocks and resets for DWC3 core

 Documentation/devicetree/bindings/usb/dwc3.txt |  21 +++++
 drivers/usb/dwc3/core.c                        | 118 +++++++++++++++++++------
 drivers/usb/dwc3/core.h                        |   8 ++
 3 files changed, 122 insertions(+), 25 deletions(-)

-- 
2.7.4
