From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCHv3 8/8] ARM: configs: stm32: Add RTC support in STM32 defconfig
Date: Thu, 5 Jan 2017 14:43:29 +0100
Message-ID: <1483623809-29937-9-git-send-email-amelie.delaunay@st.com>
References: <1483623809-29937-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1483623809-29937-1-git-send-email-amelie.delaunay@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, Gabriel Fernandez <gabriel.fernandez@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds STM32 RTC support in stm32_defconfig file.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/configs/stm32_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index be19e09..0acff9e 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -57,6 +57,8 @@ CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_STM32=y
 CONFIG_DMADEVICES=y
 CONFIG_STM32_DMA=y
 # CONFIG_FILE_LOCKING is not set
-- 
1.9.1
