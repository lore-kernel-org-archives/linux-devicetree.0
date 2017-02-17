From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [RFC 0/4] iio: trigger: Add OF support and GPIO based trigger
Date: Fri, 17 Feb 2017 17:03:45 +0100
Message-ID: <1487347429-31761-1-git-send-email-fabrice.gasnier@st.com>
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
Cc: mark.rutland@arm.com, benjamin.gaignard@linaro.org, lars@metafoo.de, alexandre.torgue@st.com, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com, linus.walleij@linaro.org, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

Hi,

I send this as an RFC, as I'm digging to try to get as generic
as possible GPIO based trigger support, as discussed earlier in
other patchset "Add EXTI GPIO trigger support to STM32 ADC":
https://www.spinics.net/lists/arm-kernel/msg559091.html

Following various comments on this, I sent this RFC to address two
topics, that I see as possible prerequisite:
- Add trigger OF support
- GPIO based trigger

Please feel free to advise.
Best Regards.

Fabrice Gasnier (4):
  dt-bindings: iio: introduce trigger providers, consumers
  iio: trigger: add OF support
  dt-bindings: iio: add support for GPIO triggers
  iio: trigger: add GPIO trigger

 .../devicetree/bindings/iio/iio-bindings.txt       |  37 +++++++
 .../bindings/iio/trigger/iio-trig-gpio.txt         |  26 +++++
 drivers/iio/industrialio-trigger.c                 | 100 ++++++++++++++++++
 drivers/iio/trigger/Kconfig                        |   9 ++
 drivers/iio/trigger/Makefile                       |   1 +
 drivers/iio/trigger/iio-trig-gpio.c                | 112 +++++++++++++++++++++
 include/linux/iio/trigger.h                        |   4 +
 7 files changed, 289 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/trigger/iio-trig-gpio.txt
 create mode 100644 drivers/iio/trigger/iio-trig-gpio.c

-- 
1.9.1
