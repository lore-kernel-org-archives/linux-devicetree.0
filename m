From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH V3 0/3] add iwdg2 support for stm32mp157c
Date: Wed, 20 Jun 2018 15:51:35 +0200
Message-ID: <1529502698-13263-1-git-send-email-ludovic.Barre@st.com>
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
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch series updates stm32_iwdg driver to manage config
by compatible. stm32mp1 config requires a pclk clock.

v3:
-remove stm32_iwdg_config structure, just assign the
 boolean directly to .dat

Ludovic Barre (3):
  watchdog: stm32: add pclk feature for stm32mp1
  ARM: dts: stm32: add iwdg2 support for stm32mp157c
  ARM: dts: stm32: add iwdg2 support for stm32mp157c-ed1

 .../devicetree/bindings/watchdog/st,stm32-iwdg.txt |  21 +++-
 arch/arm/boot/dts/stm32mp157c-ed1.dts              |   5 +
 arch/arm/boot/dts/stm32mp157c.dtsi                 |   8 ++
 drivers/watchdog/stm32_iwdg.c                      | 116 +++++++++++++--------
 4 files changed, 104 insertions(+), 46 deletions(-)

-- 
2.7.4
