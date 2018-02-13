From: <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v3 00/11] ARM: dts: STi: Fix DT dtc warnings
Date: Tue, 13 Feb 2018 13:53:26 +0100
Message-ID: <1518526417-11919-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: patrice.chotard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>

This series fixes all dtc warnings related to STi platforms dt files.
It has been reported by Rob Herring [1]

For most of implicated node, the addition of a fake reg property
fixes these warnings. For others nodes, their location in device tree
have been updated.

[1] https://www.spinics.net/lists/devicetree/msg206209.html

v3: _ Update sound node location in patch 9
    _ Merge preivous patch 10 and 11 by updating some clocks node location

v2: _ Add a fake reg property to node without reg property, instead 
      of moving them outside soc node.

Patrice Chotard (11):
  ARM: dts: STi: Fix bindings notation
  ARM: dts: STi: Move leds node outside soc node
  ARM: dts: STi: Add fake reg property for sti-display-subsystem
  ARM: dts: STi: Add fake reg property for miphy28lp_phy
  ARM: dts: STi: Add fake reg property for irq-syscfg
  ARM: dts: STi: Add fake reg property for remote processors
  ARM: dts: STi: Add fake reg for restart, powerdown and
    picophy/softreset
  ARM: dts: STi: Add fake reg property for usb2_picophyX nodes
  ARM: dts: STi: Update sound related nodes location
  ARM: dts: STi: Update clocks node location
  ARM: dts: STi: Remove unused clk_ext2f_a9 clock

 arch/arm/boot/dts/stih407-b2120.dts    |   2 +-
 arch/arm/boot/dts/stih407-clock.dtsi   |  92 +++++++++++-------------
 arch/arm/boot/dts/stih407-family.dtsi  |  42 ++++++-----
 arch/arm/boot/dts/stih407-pinctrl.dtsi |  10 +--
 arch/arm/boot/dts/stih407.dtsi         |   4 +-
 arch/arm/boot/dts/stih410-b2120.dts    |   8 +--
 arch/arm/boot/dts/stih410-b2260.dts    |  89 ++++++++++++-----------
 arch/arm/boot/dts/stih410-clock.dtsi   |  96 +++++++++++--------------
 arch/arm/boot/dts/stih410-pinctrl.dtsi |   2 +-
 arch/arm/boot/dts/stih410.dtsi         |  13 ++--
 arch/arm/boot/dts/stih418-b2199.dts    |  30 ++++----
 arch/arm/boot/dts/stih418-clock.dtsi   |  95 +++++++++++--------------
 arch/arm/boot/dts/stih418.dtsi         |   6 +-
 arch/arm/boot/dts/stihxxx-b2120.dtsi   | 126 +++++++++++++++++----------------
 14 files changed, 300 insertions(+), 315 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
