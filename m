From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 0/5] ARM: dts: at91: nattis: some cleanup
Date: Tue, 28 Aug 2018 11:48:39 +0200
Message-ID: <20180828094844.10018-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi!

Now that some other patches [1][2] have finally landed in -next, I
feel that it is time for this cleanup series that I have been hoarding
for a while waiting on those (weak) dependencies.

Cheers,
Peter

[1] https://lkml.org/lkml/2018/8/24/187
[2] https://lkml.org/lkml/2018/8/25/64

Peter Rosin (5):
  ARM: dts: at91: nattis: set the PRLUD and HIPOW signals low
  ARM: dts: at91: nattis: make the SD-card slot work
  ARM: dts: at91: nattis: state the actual lvds-encoder chip
  ARM: dts: at91: nattis: move pinctrls for the lvds chip to the lvds
    node
  ARM: dts: at91: nattis: describe the lvds panel

 arch/arm/boot/dts/at91-nattis-2-natte-2.dts | 43 ++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 10 deletions(-)

-- 
2.11.0
