From: Arnaud Ebalard <arno@natisbad.org>
Subject: [PATCHv1 0/3] Alarm support for ISL12057 + RFC dt property
Date: Tue, 16 Dec 2014 00:54:13 +0100
Message-ID: <cover.1418687005.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Darshana Padmadas <darshanapadmadas@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

Changes since v0:

 - Basic alarm support is now the first patch of the series with nothing
   fancy in it: as per Uwe's request, all the "Chip IRQ#2 is not routed
   to the SoC but device can still be woken up with the alarm" is in the
   second patch. Uwe, can you review that one, so that Andrew can then
   merge it if it is ok?
 - Second patch has simple changes going on top of first patch to
   support the use case for current in-tree users, i.e. ReadyNAS 102,
   104 and 2120. It's a simple property with complete documentation
   about what it does and does not.
 - Third and last patch add that property to 102, 104 nd 2120 .dts
   files (in a single patch as suggested by Jason)

Comments welcome,

Cheers,

a+

Arnaud Ebalard (3):
  rtc: rtc-isl12057: add alarm support to Intersil ISL12057 RTC driver
  rtc: rtc-isl12057: add isil,irq2-can-wakeup-machine property for in-tree users
  ARM: mvebu: ISL12057 rtc chip can now wake up RN102, RN104 and RN2120

 .../devicetree/bindings/rtc/isil,isl12057.txt      |  78 +++++
 arch/arm/boot/dts/armada-370-netgear-rn102.dts     |   1 +
 arch/arm/boot/dts/armada-370-netgear-rn104.dts     |   1 +
 arch/arm/boot/dts/armada-xp-netgear-rn2120.dts     |   1 +
 drivers/rtc/rtc-isl12057.c                         | 346 ++++++++++++++++++++-
 5 files changed, 419 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/isil,isl12057.txt

-- 
2.1.1

