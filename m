From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH 3/3] ARM: multi_v7_defconfig: Enable MiPHY28lp - ST's Generic
 (SATA, PCIe & USB3) PHY
Date: Wed, 14 Jan 2015 10:54:59 +0100
Message-ID: <1421229299-8206-4-git-send-email-gabriel.fernandez@linaro.org>
References: <1421229299-8206-1-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1421229299-8206-1-git-send-email-gabriel.fernandez@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Grant Likely <grant.likely@linaro.org>
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 4b87fd1..88dfa7e 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -459,6 +459,7 @@ CONFIG_PWM_VT8500=y
 CONFIG_PHY_HIX5HD2_SATA=y
 CONFIG_OMAP_USB2=y
 CONFIG_TI_PIPE3=y
+CONFIG_PHY_MIPHY28LP=y
 CONFIG_PHY_MIPHY365X=y
 CONFIG_PHY_STIH41X_USB=y
 CONFIG_PHY_STIH407_USB=y
-- 
1.9.1
