From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v3 0/3] iio: adc: vf610: respect ADC clocking limitations
Date: Sun, 22 Mar 2015 00:22:04 +0100
Message-ID: <1426980127-16686-1-git-send-email-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, shawn.guo@linaro.org, kernel@pengutronix.de
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, B38611@freescale.com, maitysanchayan@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Respect ADC clocking limitations which lead to bogous reading on
500MHz clocked Vybrid SoC's. Additionally, also implement a
sysfs-property to configure the conversion mode available in this
ADC peripherial.

Changes since v2:
- Add sysfs ABI documentation
- Fix commit message spelling errors

Changes since v1:
- Use ext_info for conversion mode

Stefan Agner (3):
  iio: adc: vf610: use ADC clock within specification
  iio: adc: vf610: implement configurable conversion modes
  ARM: dts: add property for maximum ADC clock frequencies

 Documentation/ABI/testing/sysfs-bus-iio-vf610      |   7 +
 .../devicetree/bindings/iio/adc/vf610-adc.txt      |   9 +
 arch/arm/boot/dts/vfxxx.dtsi                       |   4 +
 drivers/iio/adc/vf610_adc.c                        | 225 +++++++++++++++------
 4 files changed, 179 insertions(+), 66 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-vf610

-- 
2.3.3
