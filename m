From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 0/5] iio: add support for STM32H7 ADC
Date: Fri, 19 May 2017 14:45:23 +0200
Message-ID: <1495197928-1439-1-git-send-email-fabrice.gasnier@st.com>
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

Add support for STM32H7 Analog to Digital Converter variant.
It has up to 20 external channels, resolution ranges from 8 to 16bits.
Differences are regarding clocking, registers and bitfields have also
been re-arranged, but behavior is similar. It also has additional self
calibration and power on/off procedures.

Fabrice Gasnier (5):
  dt-bindings: iio: stm32-adc: add support for STM32H7
  iio: adc: stm32: make core adc clock optional by default
  iio: adc: stm32: introduce compatible data cfg
  iio: adc: stm32: make per instance bus clock optional
  iio: adc: stm32: add support for STM32H7

 .../devicetree/bindings/iio/adc/st,stm32-adc.txt   |  20 +-
 drivers/iio/adc/stm32-adc-core.c                   | 269 ++++++-
 drivers/iio/adc/stm32-adc-core.h                   |   2 +
 drivers/iio/adc/stm32-adc.c                        | 775 +++++++++++++++++++--
 4 files changed, 980 insertions(+), 86 deletions(-)

-- 
1.9.1
