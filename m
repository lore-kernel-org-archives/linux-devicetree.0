From: thor.thayer@linux.intel.com
Subject: [PATCHv4 2/6] Documentation: dt: socfpga: Add S10 System Manager
 binding
Date: Thu, 14 Feb 2019 14:44:14 -0600
Message-ID: <1550177058-1860-3-git-send-email-thor.thayer@linux.intel.com>
References: <1550177058-1860-1-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550177058-1860-1-git-send-email-thor.thayer@linux.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: lee.jones@linaro.org, arnd@arndb.de, dinguyen@kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, olof@lixom.net
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Thor Thayer <thor.thayer@linux.intel.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com, mchehab+samsung@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Add the device tree bindings for the Stratix10 System Manager.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2  New compatible string and usage for Stratix10
v3  No change
v4  Add Reviewed-by from v2.
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
