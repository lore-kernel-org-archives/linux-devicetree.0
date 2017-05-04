From: Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 0/3] iio: adc: sama5d2_adc hw triggers and buffers
Date: Thu, 4 May 2017 15:13:17 +0300
Message-ID: <1493900000-26220-1-git-send-email-eugen.hristev@microchip.com>
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
To: nicolas.ferre@microchip.com, jic23@kernel.org, alexandre.belloni@free-electrons.com, linux-iio@vger.kernel.org, lars@metafoo.de, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: eugen.hristev@microchip.com, ludovic.desroches@microchip.com
List-Id: devicetree@vger.kernel.org

This patch implements the hardware triggers support and buffer management
for sama5d2.
The DT modifications ( [PATCH 1/3] ARM: dts: at91: sama5d2_xplained:
enable ADTRG pin) are for demonstration purposes of the feature,
setting the pinctrl for the ADC hw trigger pin,should go through
at91 maintainers.
I also increased the buffer size for the trigger name in the
generic_buffer application to cope with longer names and avoid
stack smashing problem.
This is in patch [PATCH 3/3] iio: tools: generic_buffer: increase trigger length

  Changes in v2:
 - Moved buffer allocation and freeing into the preenable and postdisable
   callbacks.
   We have a total of scan bytes that can vary a lot depending on each channel
   enabled at a certain point.
 - made the at91 trigger list part of state structure
 - made the iio trigger list preallocated in state structure
 - moved irq enabling/disabling into the try_reenable callback
 - on trigger disable must write disable registries as well
 - Modified trigger name length to 64

Eugen Hristev (3):
  ARM: dts: at91: sama5d2_xplained: enable ADTRG pin
  iio: adc: at91-sama5d2_adc: add hw trigger and buffer support
  iio: tools: generic_buffer: increase trigger length

 arch/arm/boot/dts/at91-sama5d2_xplained.dts |  16 +-
 drivers/iio/adc/at91-sama5d2_adc.c          | 231 +++++++++++++++++++++++++++-
 tools/iio/iio_utils.h                       |   2 +-
 3 files changed, 244 insertions(+), 5 deletions(-)

-- 
2.7.4
