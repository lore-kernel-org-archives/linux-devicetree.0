From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 3.14 004/228] mips: dts: Fix missing device_type="memory" property in memory nodes
Date: Wed,  4 Jun 2014 16:20:33 -0700
Message-ID: <20140604232348.220747739@linuxfoundation.org>
References: <20140604232347.966798903@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20140604232347.966798903@linuxfoundation.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Leif Lindholm <leif.lindholm@linaro.org>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, John Crispin <blogic@openwrt.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

3.14-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Leif Lindholm <leif.lindholm@linaro.org>

commit dfc44f8030653b345fc6fb337558c3a07536823f upstream.

A few platforms lack a 'device_type = "memory"' for their memory
nodes, relying on an old ppc quirk in order to discover its memory.
Add the missing data so that all parsing code can find memory nodes
correctly.

Signed-off-by: Leif Lindholm <leif.lindholm@linaro.org>
Cc: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>
Acked-by: John Crispin <blogic@openwrt.org>
Signed-off-by: Grant Likely <grant.likely@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/mips/lantiq/dts/easy50712.dts    |    1 +
 arch/mips/ralink/dts/mt7620a_eval.dts |    1 +
 arch/mips/ralink/dts/rt2880_eval.dts  |    1 +
 arch/mips/ralink/dts/rt3052_eval.dts  |    1 +
 arch/mips/ralink/dts/rt3883_eval.dts  |    1 +
 5 files changed, 5 insertions(+)

--- a/arch/mips/lantiq/dts/easy50712.dts
+++ b/arch/mips/lantiq/dts/easy50712.dts
@@ -8,6 +8,7 @@
 	};
 
 	memory@0 {
+		device_type = "memory";
 		reg = <0x0 0x2000000>;
 	};
 
--- a/arch/mips/ralink/dts/mt7620a_eval.dts
+++ b/arch/mips/ralink/dts/mt7620a_eval.dts
@@ -7,6 +7,7 @@
 	model = "Ralink MT7620A evaluation board";
 
 	memory@0 {
+		device_type = "memory";
 		reg = <0x0 0x2000000>;
 	};
 
--- a/arch/mips/ralink/dts/rt2880_eval.dts
+++ b/arch/mips/ralink/dts/rt2880_eval.dts
@@ -7,6 +7,7 @@
 	model = "Ralink RT2880 evaluation board";
 
 	memory@0 {
+		device_type = "memory";
 		reg = <0x8000000 0x2000000>;
 	};
 
--- a/arch/mips/ralink/dts/rt3052_eval.dts
+++ b/arch/mips/ralink/dts/rt3052_eval.dts
@@ -7,6 +7,7 @@
 	model = "Ralink RT3052 evaluation board";
 
 	memory@0 {
+		device_type = "memory";
 		reg = <0x0 0x2000000>;
 	};
 
--- a/arch/mips/ralink/dts/rt3883_eval.dts
+++ b/arch/mips/ralink/dts/rt3883_eval.dts
@@ -7,6 +7,7 @@
 	model = "Ralink RT3883 evaluation board";
 
 	memory@0 {
+		device_type = "memory";
 		reg = <0x0 0x2000000>;
 	};
 
