From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 2/2] ARM: dts: stm32: update rtc st,
 syscfg property on stm32f746
Date: Wed, 9 May 2018 17:18:14 +0200
Message-ID: <1525879094-19562-3-git-send-email-amelie.delaunay@st.com>
References: <1525879094-19562-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1525879094-19562-1-git-send-email-amelie.delaunay@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

To fit with latest rtc driver updates, rtc st,syscfg property must contain
the control register offset of pwrcfg and the mask corresponding to the
DBP (Disable Backup Protection) bit.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32f746.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index 1479e3e..f48d06a 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -297,7 +297,7 @@
 			interrupt-parent = <&exti>;
 			interrupts = <17 1>;
 			interrupt-names = "alarm";
-			st,syscfg = <&pwrcfg>;
+			st,syscfg = <&pwrcfg 0x00 0x100>;
 			status = "disabled";
 		};
 
-- 
2.7.4
