From: thor.thayer@linux.intel.com
Subject: [PATCHv3 2/6] Documentation: dt: socfpga: Add S10 System Manager binding
Date: Mon, 28 Jan 2019 16:14:11 -0600
Message-ID: <1548713655-25940-3-git-send-email-thor.thayer@linux.intel.com>
References: <1548713655-25940-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548713655-25940-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, arnd@arndb.de, dinguyen@kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com, mchehab+samsung@kernel.org, mark.rutland@arm.com, bjorn.andersson@linaro.org, olof@lixom.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Thor Thayer <thor.thayer@linux.intel.com>
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Add the device tree bindings for the Stratix10 System Manager.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
v2  New compatible string and usage for Stratix10
v3  No change
---
 .../devicetree/bindings/arm/altera/socfpga-system.txt        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-system.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-system.txt
index f4d04a067282..82edbaaa3f85 100644
--- a/Documentation/devicetree/bindings/arm/altera/socfpga-system.txt
+++ b/Documentation/devicetree/bindings/arm/altera/socfpga-system.txt
@@ -11,3 +11,15 @@ Example:
 		reg = <0xffd08000 0x1000>;
 		cpu1-start-addr = <0xffd080c4>;
 	};
+
+ARM64 - Stratix10
+Required properties:
+- compatible : "altr,sys-mgr-s10"
+- reg : Should contain 1 register range(address and length)
+        for system manager register.
+
+Example:
+	 sysmgr@ffd12000 {
+		compatible = "altr,sys-mgr-s10";
+		reg = <0xffd12000 0x228>;
+	};
-- 
2.7.4
