From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH v2 0/7] Add support for triggered buffer mode to STM32 ADC
Date: Thu, 26 Jan 2017 15:28:28 +0100
Message-ID: <1485440915-30119-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jic23@kernel.org, linux@armlinux.org.uk, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, benjamin.gaignard@linaro.org, lars@metafoo.de, alexandre.torgue@st.com, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

The following patches add support for triggered buffer mode.
These are based on top of "Add PWM and IIO timer drivers for STM32"
series. Reference:
https://lkml.org/lkml/2017/1/20/116

STM32 ADC, can use either interrupts or DMA to collect data.
Either timer trigger output (TRGO) or PWM can be used as trigger source.
This patchset has been tested on STM32F429 eval board.

- Example to enable timer1 PWM:
cd /sys/devices/platform/soc/40010000.timers/40010000.timers:pwm/pwm/pwmchip4/
echo 0 > export # timer 1 channel 1
echo 1000000 > pwm0/period # 1000Hz
echo 500000 > pwm0/duty_cycle
echo 1 > pwm0/enable

- Example to enable timer3 TRGO:
cd /sys/bus/iio/devices/
cat trigger6/name 
tim1_ch1
cat trigger0/name 
tim3_trgo
echo 1000 > trigger0/sampling_frequency

- Example to configure STM32ADC in triggered buffer mode, with timer1 PWM
  or timer3 TRGO:
cd /sys/bus/iio/devices/iio\:device0
echo tim1_ch1 > trigger/current_trigger
OR: echo tim3_trgo > trigger/current_trigger
echo 1 > scan_elements/in_voltage8_en
echo 1 > buffer/enable

---
Changes in v2:
- Mainly updates following Jonathan's remarks.
- make data buffer part of stm32_adc structure
- remove defines
- add comment on reading DR to clear OEC flag
- use bitmap_weight()
- fix error handling in stm32_adc_buffer_postenable()
- Rename and document custom 'trigger_polarity' attribute
- use iio_trigger_poll_chained() to avoid bounce to irq context
- rework DMA buffer allocation and use hwfifo_set_watermark()
- Fix typo: using stm32f429i-eval

Fabrice Gasnier (7):
  iio: adc: stm32: add support for triggered buffer mode
  iio: adc: stm32: Enable use of stm32 timer triggers
  iio: adc: stm32: add trigger polarity extended attribute
  Documentation: dt: iio: stm32-adc: optional dma support
  iio: adc: stm32: add optional dma support
  ARM: dts: stm32: Enable dma by default on stm32f4 adc
  ARM: dts: stm32: Enable pwm1 and pwm3 on stm32f429i-eval

 Documentation/ABI/testing/sysfs-bus-iio-adc-stm32  |  18 +
 .../devicetree/bindings/iio/adc/st,stm32-adc.txt   |   7 +
 arch/arm/boot/dts/stm32429i-eval.dts               |  28 +
 arch/arm/boot/dts/stm32f429.dtsi                   |   6 +
 drivers/iio/adc/Kconfig                            |   5 +
 drivers/iio/adc/stm32-adc-core.c                   |   1 +
 drivers/iio/adc/stm32-adc-core.h                   |   2 +
 drivers/iio/adc/stm32-adc.c                        | 633 ++++++++++++++++++++-
 8 files changed, 676 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-stm32

-- 
1.9.1
