From: Mohit Kumar <mohit.kumar@st.com>
Subject: [PATCH 01/12] SPEAr13xx: Correct dt field name for stmmac phy-addr
Date: Wed, 11 Dec 2013 15:08:26 +0530
Message-ID: <1078549fa412fb34ab2c95a6232096570abee12d.1386752447.git.mohit.kumar@st.com>
References: <cover.1386752447.git.mohit.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1386752447.git.mohit.kumar@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mohit Kumar <mohit.kumar@st.com>, devicetree@vger.kernel.org, spear-devel@list.st.com, Viresh Kumar <viresh.linux@gmail.com>, Pratyush Anand <pratyush.anand@st.com>
List-Id: devicetree@vger.kernel.org

DT field name for the phy address changed since kernel 3.10. Set the
snps,phy-addr to 0xffffffff so that the driver probes for the phy.

Signed-off-by: Mohit Kumar <mohit.kumar@st.com>
Cc: Pratyush Anand <pratyush.anand@st.com>
Cc: Viresh Kumar <viresh.linux@gmail.com>
Cc: spear-devel@list.st.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
---
 arch/arm/boot/dts/spear13xx.dtsi |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/spear13xx.dtsi b/arch/arm/boot/dts/spear13xx.dtsi
index 4382547..3518803 100644
--- a/arch/arm/boot/dts/spear13xx.dtsi
+++ b/arch/arm/boot/dts/spear13xx.dtsi
@@ -155,6 +155,7 @@
 
 		gmac0: eth@e2000000 {
 			compatible = "st,spear600-gmac";
+			snps,phy-addr = <0xffffffff>;
 			reg = <0xe2000000 0x8000>;
 			interrupts = <0 33 0x4
 				      0 34 0x4>;
-- 
1.7.0.1
