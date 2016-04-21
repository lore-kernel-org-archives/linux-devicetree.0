From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 11/18] ARM: multi_v7_defconfig: Enable STi and simple-card
 drivers.
Date: Thu, 21 Apr 2016 12:04:28 +0100
Message-ID: <1461236675-10176-12-git-send-email-peter.griffin@linaro.org>
References: <1461236675-10176-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1461236675-10176-1-git-send-email-peter.griffin@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, vinod.koul@intel.com
Cc: devicetree@vger.kernel.org, arnd@arndb.de, arnaud.pouliquen@st.com, peter.griffin@linaro.org, broonie@kernel.org, dmaengine@vger.kernel.org, lee.jones@linaro.org, ludovic.barre@st.com
List-Id: devicetree@vger.kernel.org

This patch enables the STi ALSA drivers found on STi platforms
as well as the simple-card driver which is a dependency to have
working sound.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Cc: arnaud.pouliquen@st.com
---
 arch/arm/configs/multi_v7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 61008a0..b391882 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -588,6 +588,9 @@ CONFIG_SND_SOC_AK4642=m
 CONFIG_SND_SOC_SGTL5000=m
 CONFIG_SND_SOC_SPDIF=m
 CONFIG_SND_SOC_WM8978=m
+CONFIG_SND_SOC_STI=m
+CONFIG_SND_SOC_STI_SAS=m
+CONFIG_SND_SIMPLE_CARD=m
 CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_MVEBU=y
-- 
1.9.1
