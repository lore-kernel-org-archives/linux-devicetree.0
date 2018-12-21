From: thor.thayer@linux.intel.com
Subject: [PATCHv2 6/6] arm64: dts: stratix10: New System Manager compatible
Date: Thu, 20 Dec 2018 18:23:22 -0600
Message-ID: <1545351802-4354-7-git-send-email-thor.thayer@linux.intel.com>
References: <1545351802-4354-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1545351802-4354-1-git-send-email-thor.thayer@linux.intel.com>
Sender: netdev-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, arnd@arndb.de, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com, mchehab+samsung@kernel.org, bjorn.andersson@linaro.org, olof@lixom.net, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Thor Thayer <thor.thayer@linux.intel.com>
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Use the new compatible string defined for the Stratix10
System Manager. Remove syscon since it is not correct
on this platform.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
v2  New. Use new Stratix10 System Manager compatible
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 8253a1a9e985..ad9615241b64 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -340,7 +340,7 @@
 		};
 
 		sysmgr: sysmgr@ffd12000 {
-			compatible = "altr,sys-mgr", "syscon";
+			compatible = "altr,sys-mgr-s10";
 			reg = <0xffd12000 0x228>;
 		};
 
-- 
2.7.4
