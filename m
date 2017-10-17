From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 0/3] iio: adc: stm32: Add support for differential channels
Date: Tue, 17 Oct 2017 15:15:42 +0200
Message-ID: <1508246145-19417-1-git-send-email-fabrice.gasnier@st.com>
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
To: jic23@kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, benjamin.gaignard@linaro.org, lars@metafoo.de, alexandre.torgue@st.com, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com, linux-arm-kernel@lists.infradead.org, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

Add support for differential channels that can be found on STM32H7 ADC:
- Introduce new DT property 'st,adc-diff-channels'.
- Slightly rework single-ended channels definition in stm32-adc driver.
- Add support for differential channels to stm32-adc driver.

Fabrice Gasnier (3):
  dt-bindings: iio: adc: stm32: add support for diff channels
  iio: adc: stm32: remove const channel names definition
  iio: adc: stm32: add support for differential channels

 .../devicetree/bindings/iio/adc/st,stm32-adc.txt   |   6 +
 drivers/iio/adc/stm32-adc.c                        | 181 +++++++++++++--------
 2 files changed, 119 insertions(+), 68 deletions(-)

-- 
1.9.1
