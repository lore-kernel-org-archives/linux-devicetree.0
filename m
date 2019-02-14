From: thor.thayer@linux.intel.com
Subject: [PATCHv4 6/6] arm64: dts: stratix10: New System Manager compatible
Date: Thu, 14 Feb 2019 14:44:18 -0600
Message-ID: <1550177058-1860-7-git-send-email-thor.thayer@linux.intel.com>
References: <1550177058-1860-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550177058-1860-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, arnd@arndb.de, dinguyen@kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, olof@lixom.net
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com, mchehab+samsung@kernel.org, mark.rutland@arm.com, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Thor Thayer <thor.thayer@linux.intel.com>
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Use the new compatible string defined for the Stratix10
System Manager. Remove syscon since it is not correct
on this platform.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
v2  New. Use new Stratix10 System Manager compatible
v3  Use "altr,sys-mgr" as the non-specific compatible.
v4  No change
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index b2c9bb664595..18e4e54db0bb 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -363,7 +363,7 @@
 		};
 
 		sysmgr: sysmgr@ffd12000 {
-			compatible = "altr,sys-mgr", "syscon";
+			compatible = "altr,sys-mgr-s10","altr,sys-mgr";
 			reg = <0xffd12000 0x228>;
 		};
 
-- 
2.7.4
