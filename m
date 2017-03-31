From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH v2 0/2] iio: allow to set STM32 ADC resolution
Date: Fri, 31 Mar 2017 14:32:36 +0200
Message-ID: <1490963559-32159-1-git-send-email-fabrice.gasnier@st.com>
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

STM32 ADC supports several resolution. Add dt option so resolution
can be tuned at probe time. By default, maximum resolution is used
when it isn't set.

---
Changes in v2:
 - rename property from 'st,adc-res' to 'assigned-resolution-bits' so it
 is more common.

Fabrice Gasnier (2):
  dt-bindings: iio: stm32-adc: add option to set resolution
  iio: adc: stm32: add dt option to set resolution

 .../devicetree/bindings/iio/adc/st,stm32-adc.txt   |  4 ++
 drivers/iio/adc/stm32-adc.c                        | 50 +++++++++++++++++++++-
 2 files changed, 53 insertions(+), 1 deletion(-)

-- 
1.9.1
