From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH 0/3] implement poweroff for mt6323/6397
Date: Tue,  2 Jul 2019 11:40:42 +0200
Message-ID: <20190702094045.3652-1-frank-w@public-files.de>
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Frank Wunderlich <frank-w@public-files.de>
List-Id: devicetree@vger.kernel.org

i got this Patchset from josef friedl and want got get it in mainline

tested on bananapi-r2 (mt7623)

with this Patchset real power off (in mailine only "system halted") and
reboot by power-key is working

Josef Friedl (3):
  add doc and MAINTAINERS for poweroff
  add dts for poweroff
  add driver and MAINTAINERS for poweroff

 .../devicetree/bindings/mfd/mt6397.txt        |  10 +-
 .../bindings/power/reset/mt6323-poweroff.txt  |  20 ++++
 .../devicetree/bindings/rtc/rtc-mt6397.txt    |  29 +++++
 MAINTAINERS                                   |   7 ++
 arch/arm/boot/dts/mt6323.dtsi                 |  27 +++++
 drivers/mfd/mt6397-core.c                     |  40 +++++--
 drivers/power/reset/Kconfig                   |  10 ++
 drivers/power/reset/Makefile                  |   1 +
 drivers/power/reset/mt6323-poweroff.c         |  97 +++++++++++++++
 drivers/rtc/rtc-mt6397.c                      | 110 ++++--------------
 include/linux/mfd/mt6397/core.h               |   2 +
 include/linux/mfd/mt6397/rtc.h                |  71 +++++++++++
 12 files changed, 325 insertions(+), 99 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/reset/mt6323-p=
oweroff.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
 create mode 100644 drivers/power/reset/mt6323-poweroff.c
 create mode 100644 include/linux/mfd/mt6397/rtc.h

=2D-
2.17.1
