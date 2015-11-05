From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [RFC 0/3] Adding support for NI Ettus Research USRP E3XX pinconf
Date: Thu,  5 Nov 2015 15:41:20 -0800
Message-ID: <1446766883-25703-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>
List-Id: devicetree@vger.kernel.org

Hi all,

I've been hacking on this pinctrl driver to control pins on
our FPGA idle image to use different daughterboards using
different pin configurations.

I send this as an RFC because it's still pretty early stage,
and while it seems to work fine I'm unsure about some of the
semantics (as always, there will probably other changes required).

I'm planning to use this pinctrl driver to set pins to either
input (do nothing, default), or output with a value of (1 or 0).

Can I use the 'output-low', 'output-high' bindings to achieve this,
or am I supposed to implement a gpio controller to do this kind of stuff?

I'm not sure if I'm using the pinctrl framework correctly to achieve this,
any suggestions on how to change a pin from output to input, as the bindings
documentation explicitly states 'input-enable' does *not* affect output.

Thanks for your help & feedback,

Moritz

Moritz Fischer (3):
  Documentation: dt: Add devicetree bindings for NI USRP E3xx pinconf
  pinctrl: e3xx: Adding support for NI Ettus Research USRP E3xx pinconf
  ARM: e3xx: Add header file for pinctrl constants

 .../devicetree/bindings/pinctrl/pinctrl-e3xx.txt   |  27 ++
 drivers/pinctrl/Kconfig                            |  11 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-e3xx.c                     | 403 +++++++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-e3xx.h         | 142 ++++++++
 5 files changed, 584 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-e3xx.txt
 create mode 100644 drivers/pinctrl/pinctrl-e3xx.c
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-e3xx.h

-- 
2.4.3
