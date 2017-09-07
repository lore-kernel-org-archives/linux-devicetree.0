From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [PATCH v4 4/4] ARM: configs: stm32: Add MDMA support in STM32
 defconfig
Date: Thu, 7 Sep 2017 13:52:48 +0200
Message-ID: <1504785168-26572-5-git-send-email-pierre-yves.mordret@st.com>
References: <1504785168-26572-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1504785168-26572-1-git-send-email-pierre-yves.mordret@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Dan Williams <dan.j.williams@intel.com>, M'boumba
 Cedric Madianga <cedric.madianga@gmail.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, Herbert Xu <herbert@gondor.apana.org.au>, Fabien DESSENNE <fabien.dessenne@st.com>, Amelie Delaunay <amelie.delaunay@st.com>, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds MDMA support in STM32 defconfig file

Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
---
 Version history:
    v4:
    v3:
        * None
    v2:
        * Add MDMA support in STM32 defconfig
---
---
 arch/arm/configs/stm32_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index 90e5c46..988f395 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -67,6 +67,7 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_STM32=y
 CONFIG_DMADEVICES=y
 CONFIG_STM32_DMA=y
+CONFIG_STM32_DMAMUX=y
 CONFIG_IIO=y
 CONFIG_STM32_ADC_CORE=y
 CONFIG_STM32_ADC=y
-- 
2.7.4
