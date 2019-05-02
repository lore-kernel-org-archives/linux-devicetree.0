From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH V2 0/3] watchdog: stm32: add dynamic prescaler support
Date: Thu, 2 May 2019 16:08:43 +0200
Message-ID: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
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
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch series updates stm32 watchdog driver on:
-use devm_watchdog_register_device
-Guenter's recommendation about return value:
set_timeout return 0 on succes, -EINVAL for "parameter out of range"
and -EIO for "could not write value to the watchdog".
Set of reload and prescaler registers are stay in start function,
because the stm32 watchdog must be enabled to write these registers.
-adds dynamic prescaler support

Ludovic Barre (3):
  watchdog: stm32: update to devm_watchdog_register_device
  watchdog: stm32: update return values recommended by watchdog kernel
    api
  watchdog: stm32: add dynamic prescaler support

 drivers/watchdog/stm32_iwdg.c | 96 ++++++++++++++++++++++++-------------------
 1 file changed, 54 insertions(+), 42 deletions(-)

-- 
2.7.4
