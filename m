From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 0/2] Fix STM32 timers dt-bindings
Date: Fri, 9 Jun 2017 09:37:52 +0200
Message-ID: <1496993874-9870-1-git-send-email-fabrice.gasnier@st.com>
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
To: lee.jones@linaro.org, benjamin.gaignard@linaro.org, jic23@kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, alexandre.torgue@st.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, linux-arm-kernel@lists.infradead.org, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

STM32 timers clock names has been updated during driver/DT binding review:
https://lkml.org/lkml/2016/12/13/718

STM32 timers driver has been fixed with these remarks. It looks like it's
been missed on DT binding part.
Update DT binding doc to reflect this as well.

Fabrice Gasnier (2):
  dt-bindings: mfd: update STM32 timers clock names
  dt-bindings: iio: update STM32 timers clock names

 Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt | 2 +-
 Documentation/devicetree/bindings/mfd/stm32-timers.txt              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1
