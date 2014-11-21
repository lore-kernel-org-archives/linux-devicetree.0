From: Ganapatrao Kulkarni <ganapatrao.kulkarni@caviumnetworks.com>
Subject: [RFC PATCH v2 3/4] arm64:thunder: Add initial dts for Cavium's
 Thunder SoC in 2 Node topology.
Date: Sat, 22 Nov 2014 02:53:29 +0530
Message-ID: <1416605010-10442-4-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
References: <1416605010-10442-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1416605010-10442-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, Will.Deacon@arm.com, catalin.marinas@arm.com, grant.likely@linaro.org, devicetree@vger.kernel.org, leif.lindholm@linaro.org, roy.franz@linaro.org, ard.biesheuvel@linaro.org, msalter@redhat.com, robh+dt@kernel.org, steve.capper@linaro.org, hanjun.guo@linaro.org, jchandra@broadcom.com, al.stone@linaro.org
Cc: gpkulkarni@gmail.com
List-Id: devicetree@vger.kernel.org

adding devicetree definition for Cavium's Thunder SoC in 2 Node topology.

Signed-off-by: Ganapatrao Kulkarni <ganapatrao.kulkarni@caviumnetworks.com>
---
 arch/arm64/boot/dts/thunder-88xx-2n.dts  |  88 ++++
 arch/arm64/boot/dts/thunder-88xx-2n.dtsi | 694 +++++++++++++++++++++++++++++++
 2 files changed, 782 insertions(+)
 create mode 100644 arch/arm64/boot/dts/thunder-88xx-2n.dts
 create mode 100644 arch/arm64/boot/dts/thunder-88xx-2n.dtsi

diff --git a/arch/arm64/boot/dts/thunder-88xx-2n.dts b/arch/arm64/boot/dts/thunder-88xx-2n.dts
new file mode 100644
index 0000000..f87a7a4
--- /dev/null
+++ b/arch/arm64/boot/dts/thunder-88xx-2n.dts
@@ -0,0 +1,88 @@
+/*
+ * Cavium Thunder DTS file - Thunder board description
+ *
+ * Copyright (C) 2014, Cavium Inc.
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This library is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This library is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ *     You should have received a copy of the GNU General Public
+ *     License along with this library; if not, write to the Free
+ *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
+ *     MA 02110-1301 USA
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+
+/include/ "thunder-88xx-2n.dtsi"
+
+/ {
+	model = "Cavium ThunderX CN88XX board";
+	compatible = "cavium,thunder-88xx";
+
+	aliases {
+		serial0 = &uaa0;
+		serial1 = &uaa1;
+	};
+
+	memory@00c00000 {
+		device_type = "memory";
+		reg = <0x0 0x00000000 0x0 0x80000000>;
+	};
+
+	memory@10000000000 {
+		device_type = "memory";
+		reg = <0x100 0x00000000 0x0 0x80000000>;
+	};
+
+	numa-map {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		#node-count = <2>;
+		mem-map = <0x0 0x00000000 0>,
+		           <0x100 0x00000000 1>;
+
+               cpu-map = <0 47 0>,
+			<48 95 1>;
+
+		node-matrix=    <0 0 10>,
+				<0 1 20>,
+				<1 0 20>,
+				<1 1 10>;
+	};
+};
diff --git a/arch/arm64/boot/dts/thunder-88xx-2n.dtsi b/arch/arm64/boot/dts/thunder-88xx-2n.dtsi
new file mode 100644
index 0000000..3f217b4
--- /dev/null
+++ b/arch/arm64/boot/dts/thunder-88xx-2n.dtsi
@@ -0,0 +1,694 @@
+/*
+ * Cavium Thunder DTS file - Thunder SoC description
+ *
+ * Copyright (C) 2014, Cavium Inc.
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This library is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This library is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ *     You should have received a copy of the GNU General Public
+ *     License along with this library; if not, write to the Free
+ *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
+ *     MA 02110-1301 USA
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/ {
+	compatible = "cavium,thunder-88xx";
+	interrupt-parent = <&gic0>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		CPU0: cpu@000 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x000>;
+			enable-method = "psci";
+		};
+		CPU1: cpu@001 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x001>;
+			enable-method = "psci";
+		};
+		CPU2: cpu@002 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x002>;
+			enable-method = "psci";
+		};
+		CPU3: cpu@003 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x003>;
+			enable-method = "psci";
+		};
+		CPU4: cpu@004 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x004>;
+			enable-method = "psci";
+		};
+		CPU5: cpu@005 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x005>;
+			enable-method = "psci";
+		};
+		CPU6: cpu@006 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x006>;
+			enable-method = "psci";
+		};
+		CPU7: cpu@007 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x007>;
+			enable-method = "psci";
+		};
+		CPU8: cpu@008 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x008>;
+			enable-method = "psci";
+		};
+		CPU9: cpu@009 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x009>;
+			enable-method = "psci";
+		};
+		CPU10: cpu@00a {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x00a>;
+			enable-method = "psci";
+		};
+		CPU11: cpu@00b {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x00b>;
+			enable-method = "psci";
+		};
+		CPU12: cpu@00c {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x00c>;
+			enable-method = "psci";
+		};
+		CPU13: cpu@00d {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x00d>;
+			enable-method = "psci";
+		};
+		CPU14: cpu@00e {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x00e>;
+			enable-method = "psci";
+		};
+		CPU15: cpu@00f {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x00f>;
+			enable-method = "psci";
+		};
+		CPU16: cpu@100 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+		};
+		CPU17: cpu@101 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x101>;
+			enable-method = "psci";
+		};
+		CPU18: cpu@102 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x102>;
+			enable-method = "psci";
+		};
+		CPU19: cpu@103 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x103>;
+			enable-method = "psci";
+		};
+		CPU20: cpu@104 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x104>;
+			enable-method = "psci";
+		};
+		CPU21: cpu@105 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x105>;
+			enable-method = "psci";
+		};
+		CPU22: cpu@106 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x106>;
+			enable-method = "psci";
+		};
+		CPU23: cpu@107 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x107>;
+			enable-method = "psci";
+		};
+		CPU24: cpu@108 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x108>;
+			enable-method = "psci";
+		};
+		CPU25: cpu@109 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x109>;
+			enable-method = "psci";
+		};
+		CPU26: cpu@10a {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10a>;
+			enable-method = "psci";
+		};
+		CPU27: cpu@10b {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10b>;
+			enable-method = "psci";
+		};
+		CPU28: cpu@10c {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10c>;
+			enable-method = "psci";
+		};
+		CPU29: cpu@10d {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10d>;
+			enable-method = "psci";
+		};
+		CPU30: cpu@10e {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10e>;
+			enable-method = "psci";
+		};
+		CPU31: cpu@10f {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10f>;
+			enable-method = "psci";
+		};
+		CPU32: cpu@200 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x200>;
+			enable-method = "psci";
+		};
+		CPU33: cpu@201 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x201>;
+			enable-method = "psci";
+		};
+		CPU34: cpu@202 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x202>;
+			enable-method = "psci";
+		};
+		CPU35: cpu@203 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x203>;
+			enable-method = "psci";
+		};
+		CPU36: cpu@204 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x204>;
+			enable-method = "psci";
+		};
+		CPU37: cpu@205 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x205>;
+			enable-method = "psci";
+		};
+		CPU38: cpu@206 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x206>;
+			enable-method = "psci";
+		};
+		CPU39: cpu@207 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x207>;
+			enable-method = "psci";
+		};
+		CPU40: cpu@208 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x208>;
+			enable-method = "psci";
+		};
+		CPU41: cpu@209 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x209>;
+			enable-method = "psci";
+		};
+		CPU42: cpu@20a {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x20a>;
+			enable-method = "psci";
+		};
+		CPU43: cpu@20b {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x20b>;
+			enable-method = "psci";
+		};
+		CPU44: cpu@20c {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x20c>;
+			enable-method = "psci";
+		};
+		CPU45: cpu@20d {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x20d>;
+			enable-method = "psci";
+		};
+		CPU46: cpu@20e {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x20e>;
+			enable-method = "psci";
+		};
+		CPU47: cpu@20f {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x20f>;
+			enable-method = "psci";
+		};
+		CPU48: cpu@10000 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10000>;
+			enable-method = "psci";
+		};
+		CPU49: cpu@10001 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10001>;
+			enable-method = "psci";
+		};
+		CPU50: cpu@10002 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10002>;
+			enable-method = "psci";
+		};
+		CPU51: cpu@10003 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10003>;
+			enable-method = "psci";
+		};
+		CPU52: cpu@10004 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10004>;
+			enable-method = "psci";
+		};
+		CPU53: cpu@10005 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10005>;
+			enable-method = "psci";
+		};
+		CPU54: cpu@10006 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10006>;
+			enable-method = "psci";
+		};
+		CPU55: cpu@10007 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10007>;
+			enable-method = "psci";
+		};
+		CPU56: cpu@10008 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10008>;
+			enable-method = "psci";
+		};
+		CPU57: cpu@10009 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10009>;
+			enable-method = "psci";
+		};
+		CPU58: cpu@1000a {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x1000a>;
+			enable-method = "psci";
+		};
+		CPU59: cpu@1000b {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x1000b>;
+			enable-method = "psci";
+		};
+		CPU60: cpu@1000c {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x1000c>;
+			enable-method = "psci";
+		};
+		CPU61: cpu@1000d {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x1000d>;
+			enable-method = "psci";
+		};
+		CPU62: cpu@1000e {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x1000e>;
+			enable-method = "psci";
+		};
+		CPU63: cpu@1000f {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x1000f>;
+			enable-method = "psci";
+		};
+		CPU64: cpu@10100 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10100>;
+			enable-method = "psci";
+		};
+		CPU65: cpu@10101 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10101>;
+			enable-method = "psci";
+		};
+		CPU66: cpu@10102 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10102>;
+			enable-method = "psci";
+		};
+		CPU67: cpu@10103 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10103>;
+			enable-method = "psci";
+		};
+		CPU68: cpu@10104 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10104>;
+			enable-method = "psci";
+		};
+		CPU69: cpu@10105 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10105>;
+			enable-method = "psci";
+		};
+		CPU70: cpu@10106 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10106>;
+			enable-method = "psci";
+		};
+		CPU71: cpu@10107 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10107>;
+			enable-method = "psci";
+		};
+		CPU72: cpu@10108 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10108>;
+			enable-method = "psci";
+		};
+		CPU73: cpu@10109 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10109>;
+			enable-method = "psci";
+		};
+		CPU74: cpu@1010a {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x1010a>;
+			enable-method = "psci";
+		};
+		CPU75: cpu@1010b {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x1010b>;
+			enable-method = "psci";
+		};
+		CPU76: cpu@1010c {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x1010c>;
+			enable-method = "psci";
+		};
+		CPU77: cpu@1010d {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x1010d>;
+			enable-method = "psci";
+		};
+		CPU78: cpu@1010e {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x1010e>;
+			enable-method = "psci";
+		};
+		CPU79: cpu@1010f {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x1010f>;
+			enable-method = "psci";
+		};
+		CPU80: cpu@10200 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10200>;
+			enable-method = "psci";
+		};
+		CPU81: cpu@10201 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10201>;
+			enable-method = "psci";
+		};
+		CPU82: cpu@10202 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10202>;
+			enable-method = "psci";
+		};
+		CPU83: cpu@10203 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10203>;
+			enable-method = "psci";
+		};
+		CPU84: cpu@10204 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10204>;
+			enable-method = "psci";
+		};
+		CPU85: cpu@10205 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10205>;
+			enable-method = "psci";
+		};
+		CPU86: cpu@10206 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10206>;
+			enable-method = "psci";
+		};
+		CPU87: cpu@10207 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10207>;
+			enable-method = "psci";
+		};
+		CPU88: cpu@10208 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10208>;
+			enable-method = "psci";
+		};
+		CPU89: cpu@10209 {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x10209>;
+			enable-method = "psci";
+		};
+		CPU90: cpu@1020a {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x1020a>;
+			enable-method = "psci";
+		};
+		CPU91: cpu@1020b {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x1020b>;
+			enable-method = "psci";
+		};
+		CPU92: cpu@1020c {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x1020c>;
+			enable-method = "psci";
+		};
+		CPU93: cpu@1020d {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x1020d>;
+			enable-method = "psci";
+		};
+		CPU94: cpu@1020e {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x1020e>;
+			enable-method = "psci";
+		};
+		CPU95: cpu@1020f {
+			device_type = "cpu";
+			compatible = "cavium,thunder", "arm,armv8";
+			reg = <0x0 0x1020f>;
+			enable-method = "psci";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <1 13 0xff01>,
+		             <1 14 0xff01>,
+		             <1 11 0xff01>,
+		             <1 10 0xff01>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		refclk50mhz: refclk50mhz {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <50000000>;
+			clock-output-names = "refclk50mhz";
+		};
+
+		gic0: interrupt-controller@8010,00000000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			#redistributor-regions = <2>;
+			ranges;
+			interrupt-controller;
+			reg = <0x8010 0x00000000 0x0 0x010000>, /* GICD */
+			      <0x8010 0x80000000 0x0 0x600000>, /* GICR Node 0 */
+			      <0x9010 0x80000000 0x0 0x600000>; /* GICR Node 1 */
+			interrupts = <1 9 0xf04>;
+		      };
+
+		uaa0: serial@87e0,24000000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x87e0 0x24000000 0x0 0x1000>;
+			interrupts = <1 21 4>;
+			clocks = <&refclk50mhz>;
+			clock-names = "apb_pclk";
+		};
+
+		uaa1: serial@87e0,25000000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x87e0 0x25000000 0x0 0x1000>;
+			interrupts = <1 22 4>;
+			clocks = <&refclk50mhz>;
+			clock-names = "apb_pclk";
+		};
+	};
+};
-- 
1.8.1.4
