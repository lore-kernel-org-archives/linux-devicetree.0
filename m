From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 0/3] Split Arizona DT bindings between subsystems
Date: Wed, 14 Oct 2015 15:12:21 +0100
Message-ID: <1444831944-4655-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lee.jones@linaro.org, cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

As discussed the Arizona device tree bindings documentation
will be split up into a seperate document holding properties
specific to each subsystem.

This series factors out the regulator and extcon
bindings. It will probably make sense to split out a GPIO
binding document as well but at the moment the only property
here is the gpio-defaults which are still handled in the MFD
driver and probably require significantly more thought to
split out.

Thanks,
Charles

Charles Keepax (3):
  extcon: arizona: Add extcon specific device tree binding document
  regulator: arizona: Add regulator specific device tree binding
    document
  mfd: arizona: Remove bindings covered in new subsystem specific docs

 .../devicetree/bindings/extcon/extcon-arizona.txt  |   15 +++++++++
 Documentation/devicetree/bindings/mfd/arizona.txt  |   30 ++---------------
 .../bindings/regulator/arizona-regulator.txt       |   34 ++++++++++++++++++++
 MAINTAINERS                                        |    3 ++
 4 files changed, 55 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-arizona.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/arizona-regulator.txt

-- 
1.7.2.5
