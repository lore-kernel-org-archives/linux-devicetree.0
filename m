From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 0/2] ARM: dts: at91: nattis/tse850: drop 3 indentation levels
Date: Fri, 31 Aug 2018 22:44:01 +0200
Message-ID: <20180831204403.14653-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi!

I just noticed that the pinctrl and watchdog nodes in sama5d3.dtsi have
gained labels, something which I have had a plan to add myself at some
point. But now that they are here, I just have to make use of them...

Cheers,
Peter

Peter Rosin (2):
  ARM: dts: at91: nattis: drop three indentation levels
  ARM: dts: at91: tse850: drop three indentation levels

 arch/arm/boot/dts/at91-nattis-2-natte-2.dts | 72 ++++++++++++-----------------
 arch/arm/boot/dts/at91-tse850-3.dts         | 32 ++++++-------
 2 files changed, 43 insertions(+), 61 deletions(-)

-- 
2.11.0
