From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 0/3] watchdog: orion_wdt: add pretimeout support
Date: Wed,  6 Mar 2019 09:19:21 +1300
Message-ID: <20190305201924.14853-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com, linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

It appears that the kernel has only ever used timer0 on the armada platfo=
rms so
timer1 appears to be spare on these. Timers 2 and 3 are also free which c=
ould
be used if it is deemed that timer1 should be kept for some other purpose=
.

Chris Packham (3):
  ARM: dts: armada-38x: add interrupts for watchdog
  watchdog: orion: remove orion_wdt_set_timeout
  watchdog: orion_wdt: use timer1 as a pretimeout

Changes in v2:

I've reduced this to just touching the Armada-38x. It would probably
also work on Armada-XP just by adding the appropriate interrupt nodes
to the dts. I don't have access to the Armada-370 datasheet but it'd
likely work there as well..

 arch/arm/boot/dts/armada-38x.dtsi |  2 +
 drivers/watchdog/orion_wdt.c      | 67 +++++++++++++++++++++++--------
 2 files changed, 52 insertions(+), 17 deletions(-)

--=20
2.21.0
