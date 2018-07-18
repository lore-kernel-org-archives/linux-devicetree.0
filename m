From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] DeviceTree fixes for 4.18
Date: Wed, 18 Jul 2018 16:43:43 -0600
Message-ID: <CAL_JsqLCA0QLD-_EUS+bZPpa61y9+7Ym=eO3aSC7x_VerJZ+bQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Linus,

Please pull a couple of DT fixes. Details below.

Rob

The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40=
:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.18

for you to fetch changes up to b9952b5218added5577e4a3443969bc20884cea9:

  of: overlay: update phandle cache on overlay apply and remove
(2018-07-16 08:41:32 -0600)

----------------------------------------------------------------
DeviceTree fixes for 4.18:

- Fix phandle cache to work with overlays

- Correct the default clock-frequency for QCom geni-i2c

- Binding doc quote and spelling fixes

----------------------------------------------------------------
Douglas Anderson (1):
      dt-bindings: soc: qcom: Fix default clock-freq for qcom,geni-i2c

Enric Balletbo i Serra (1):
      Documentation: devicetree: tilcdc: fix spelling mistake
"suppors" -> "supports"

Fabio Estevam (1):
      dt-bindings: w1-gpio: Remove unneeded unit address

Frank Rowand (1):
      of: overlay: update phandle cache on overlay apply and remove

Jonathan Neusch=C3=A4fer (1):
      dt-bindings: Fix unbalanced quotation marks

 .../devicetree/bindings/arm/samsung/samsung-boards.txt        |  2 +-
 Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt   |  2 +-
 .../devicetree/bindings/gpio/nintendo,hollywood-gpio.txt      |  2 +-
 .../devicetree/bindings/input/touchscreen/hideep.txt          |  2 +-
 .../bindings/interrupt-controller/nvidia,tegra20-ictlr.txt    |  2 +-
 .../bindings/interrupt-controller/st,stm32-exti.txt           |  2 +-
 Documentation/devicetree/bindings/mips/brcm/soc.txt           |  2 +-
 Documentation/devicetree/bindings/net/fsl-fman.txt            |  2 +-
 Documentation/devicetree/bindings/power/power_domain.txt      |  2 +-
 Documentation/devicetree/bindings/regulator/tps65090.txt      |  2 +-
 Documentation/devicetree/bindings/reset/st,sti-softreset.txt  |  2 +-
 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt   |  2 +-
 Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt  |  2 +-
 Documentation/devicetree/bindings/sound/qcom,apq8096.txt      |  2 +-
 Documentation/devicetree/bindings/w1/w1-gpio.txt              |  2 +-
 drivers/of/base.c                                             |  6 +++---
 drivers/of/of_private.h                                       |  2 ++
 drivers/of/overlay.c                                          | 11 +++++++=
++++
 18 files changed, 31 insertions(+), 18 deletions(-)
