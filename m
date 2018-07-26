From: <patrice.chotard@st.com>
Subject: [PATCH 4/4] ARM: dts: stm32: Remove cd-inverted property for
 stm32f746-disco
Date: Thu, 26 Jul 2018 09:19:56 +0200
Message-ID: <1532589596-22181-5-git-send-email-patrice.chotard@st.com>
References: <1532589596-22181-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1532589596-22181-1-git-send-email-patrice.chotard@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, alexandre.torgue@st.com, lee.jones@linaro.org
Cc: Patrice Chotard <patrice.chotard@st.com>, mcoquelin.stm32@gmail.com
List-Id: devicetree@vger.kernel.org

From: Patrice Chotard <patrice.chotard@st.com>

Remove cd-inverted property and update cd-gpios active level
accordingly

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---
 arch/arm/boot/dts/stm32f746-disco.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32f746-disco.dts b/arch/arm/boot/dts/stm32f746-disco.dts
index f9ad71f7c807..e3a7bd338d61 100644
--- a/arch/arm/boot/dts/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/stm32f746-disco.dts
@@ -101,8 +101,7 @@
 &sdio1 {
 	status = "okay";
 	vmmc-supply = <&mmc_vcard>;
-	cd-gpios = <&gpioc 13 GPIO_ACTIVE_HIGH>;
-	cd-inverted;
+	cd-gpios = <&gpioc 13 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default", "opendrain";
 	pinctrl-0 = <&sdio_pins_a>;
 	pinctrl-1 = <&sdio_pins_od_a>;
-- 
1.9.1
