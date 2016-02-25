From: Lars Persson <lars.persson-VrBV9hrLPhE@public.gmane.org>
Subject: [PATCH v4 0/2] clk: Add Artpec-6 SoC support
Date: Thu, 25 Feb 2016 15:58:13 +0100
Message-ID: <cover.1456411894.git.larper@axis.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lars Persson <larper-VrBV9hrLPhE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add clock support for the Artpec-6 SoC port. The ARM parts are in the series
"arm: Add Artpec-6 SoC" and it goes through the arm-soc tree.

Changes since v3:
- The binding was corrected to handle two fractional divider clocks as input to
  the clock controller.
- Updated clk-artpec6.c to handle a distinct fractional divider input for each
  i2s clock mux.

Changes since v2:
- Moved axis,artpec6-clkctrl.h to the first patch with the DT bindings.

Changes since v1:

- The driver now provides all clocks from the main clock controller block
  through one DT node.
- Added a header file for the clock indexes.
- Refer to clock-bindings.txt in the bindings document.

A platform driver was not possible because the clocks are needed earlier in the
kernel startup.

Lars Persson (2):
  clk: add device tree binding for Artpec-6 clock controller
  clk: add artpec-6 clock controller

 .../devicetree/bindings/clock/artpec6.txt          |  41 +++++
 drivers/clk/Makefile                               |   1 +
 drivers/clk/axis/Makefile                          |   1 +
 drivers/clk/axis/clk-artpec6.c                     | 189 +++++++++++++++++++++
 include/dt-bindings/clock/axis,artpec6-clkctrl.h   |  38 +++++
 5 files changed, 270 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/artpec6.txt
 create mode 100644 drivers/clk/axis/Makefile
 create mode 100644 drivers/clk/axis/clk-artpec6.c
 create mode 100644 include/dt-bindings/clock/axis,artpec6-clkctrl.h

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
