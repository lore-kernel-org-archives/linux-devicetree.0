From: Maxime COQUELIN <maxime.coquelin@st.com>
Subject: [PATCH v6 1/4] ARM: dts: Sort STi boards in Makefile
Date: Tue, 20 May 2014 11:46:29 +0200
Message-ID: <1400579192-17620-2-git-send-email-maxime.coquelin@st.com>
References: <1400579192-17620-1-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1400579192-17620-1-git-send-email-maxime.coquelin@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>, Rob Landley <rob@landley.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Maxime Coquelin <maxime.coquelin@st.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
Cc: lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

The boards have to be sorted in alphanumerical order in the Makefile.

Cc: Olof Johansson <olof@lixom.net>
Signed-off-by: Maxime Coquelin <maxime.coquelin@st.com>
---
 arch/arm/boot/dts/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 35c146f..6fa1343 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -336,8 +336,8 @@ dtb-$(CONFIG_ARCH_SPEAR3XX)+= spear300-evb.dtb \
 	spear320-hmi.dtb
 dtb-$(CONFIG_ARCH_SPEAR6XX)+= spear600-evb.dtb
 dtb-$(CONFIG_ARCH_STI)+= stih415-b2000.dtb \
-	stih416-b2000.dtb \
 	stih415-b2020.dtb \
+	stih416-b2000.dtb \
 	stih416-b2020.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += \
 	sun4i-a10-a1000.dtb \
-- 
1.9.1
