From: <gabriel.fernandez@st.com>
Subject: [PATCH v2 0/3] STM32F4 Clock binding fix & update
Date: Mon, 9 Jan 2017 10:07:10 +0100
Message-ID: <1483952833-14704-1-git-send-email-gabriel.fernandez@st.com>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org, andrea.merello@gmail.com, radoslaw.pietrzyk@gmail.com
Cc: devicetree@vger.kernel.org, amelie.delaunay@st.com, olivier.bideau@st.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, gabriel.fernandez@st.com, ludovic.barre@st.com
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@st.com>

v2:
- Only rename commit subject of first patch to avoid the error:
 Remote Server returned '<vger.kernel.org #5.7.1 SMTP;
 550 5.7.1 Content-Policy reject msg: The capital Triple-X in subject
 is way too often associated with junk email,

This patch-set includes:
 - a fix to STM32F4_X_CLOCK() macro
 - an update of missing binding definition
 - a patch to use STM32F4_X_CLOCK() macro

Gabriel Fernandez (3):
  dt-bindings: mfd: stm32f4: Fix STM32F4_X_CLOCK() macro
  dt-bindings: mfd: stm32f4: Add missing binding definition
  ARM: dts: stm32: Use clock DT binding definition on stm32f429 family

 arch/arm/boot/dts/stm32429i-eval.dts  |  2 +-
 arch/arm/boot/dts/stm32f429.dtsi      | 66 +++++++++++++++++++----------------
 include/dt-bindings/mfd/stm32f4-rcc.h | 24 +++++++++----
 3 files changed, 53 insertions(+), 39 deletions(-)

-- 
1.9.1
