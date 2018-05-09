From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH v2 0/3] Introduce STM32MP1 RTC
Date: Wed, 9 May 2018 17:46:07 +0200
Message-ID: <1525880770-22263-1-git-send-email-amelie.delaunay@st.com>
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
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series introduces STM32MP1 RTC.
On STM32MP1:
- two clocks are needed, plck and rtc_ck;
- to wakeup the system, a wakeup alarm interrupt is needed;
- some registers or bits have moved, but the operation is the same;
- the Backup Domain Protection (DBP) is not managed by RTC driver.

---
Changes in v2:
* One compatible per line in bindings file
* Remove unnecessary comment under rtc_ck as this clock is required for all
* Remove interrupts-extended and add stm32mp1 rtc alarm wakeup interrupt in
  interrupts property description

Amelie Delaunay (3):
  rtc: stm32: rework register management to prepare other version of RTC
  dt-bindings: rtc: update stm32-rtc documentation for stm32mp1 rtc
  rtc: stm32: add stm32mp1 rtc support

 .../devicetree/bindings/rtc/st,stm32-rtc.txt       |  27 +-
 drivers/rtc/rtc-stm32.c                            | 272 ++++++++++++++++-----
 2 files changed, 228 insertions(+), 71 deletions(-)

-- 
2.7.4
