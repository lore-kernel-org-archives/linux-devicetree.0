From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 0/3] pwm: lpc32xx: switch driver to one phandle argument for PWM consumers
Date: Mon,  5 Dec 2016 03:42:36 +0200
Message-ID: <20161205014237.1689-1-vz@mleia.com>
Return-path: <linux-pwm-owner@vger.kernel.org>
Sender: linux-pwm-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The change adds private of_xlate() function to process one argument given
along with a PWM phandle. LPC32xx SoCs have two independent single channel
PWM controllers, the argument is used as a description of PWM output
frequency, see previous discussion here:

  http://www.spinics.net/lists/arm-kernel/msg534068.html

The changes on actual board dts files are not needed at the moment, because
all LPC32xx boards in upstream don't describe any PWM consumers.

Vladimir Zapolskiy (3):
  dt: pwm: lpc32xx: add description of clocks and #pwm-cells properties
  pwm: lpc32xx: switch driver to one phandle argument for PWM consumers
  pwm: lpc32xx: remove handling of PWM channels

 .../devicetree/bindings/pwm/lpc32xx-pwm.txt        |  7 +++++
 drivers/pwm/pwm-lpc32xx.c                          | 36 +++++++++++++++-------
 2 files changed, 32 insertions(+), 11 deletions(-)

-- 
2.10.2
