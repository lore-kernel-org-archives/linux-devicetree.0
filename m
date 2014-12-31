From: Ganapatrao Kulkarni <ganapatrao.kulkarni@caviumnetworks.com>
Subject: [RFC PATCH v3 2/4] Documentation: arm64/arm: dt bindings for numa.
Date: Wed, 31 Dec 2014 13:06:17 +0530
Message-ID: <1420011379-7116-3-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
References: <1420011379-7116-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6269099637006406173=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1420011379-7116-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, Will.Deacon@arm.com, catalin.marinas@arm.com, grant.likely@linaro.org, devicetree@vger.kernel.org, leif.lindholm@linaro.org, roy.franz@linaro.org, ard.biesheuvel@linaro.org, msalter@redhat.com, robh+dt@kernel.org, steve.capper@linaro.org, hanjun.guo@linaro.org, jchandra@broadcom.com, al.stone@linaro.org, arnd@arndb.de
Cc: gpkulkarni@gmail.com
List-Id: devicetree@vger.kernel.org

--===============6269099637006406173==
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

DT bindings for numa map for memory, cores and IOs using arm,associativity
device node property.

Signed-off-by: Ganapatrao Kulkarni <ganapatrao.kulkarni@caviumnetworks.com>
---
 Documentation/devicetree/bindings/arm/numa.txt | 198 +++++++++++++++++++++++++
 1 file changed, 198 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/numa.txt

diff --git a/Documentation/devicetree/bindings/arm/numa.txt b/Documentation/devicetree/bindings/arm/numa.txt
new file mode 100644
index 0000000..4f51e25
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/numa.txt
@@ -0,0 +1,198 @@
+==============================================================================
+NUMA binding description.
+==============================================================================
+
+==============================================================================
+1 - Introduction
+==============================================================================
+
+Systems employing a Non Uniform Memory Access (NUMA) architecture contain
+collections of hardware resources including processors, memory, and I/O buses,
+that comprise what is commonly known as a “NUMA node”.
+Processor accesses to memory within the local NUMA node is generally faster
+than processor accesses to memory outside of the local NUMA node.
+DT defines interfaces that allow the platform to convey NUMA node
+topology information to OS.
+
+==============================================================================
+2 - arm,associativity
+==============================================================================
+
+The mapping is done using arm,associativity device property.
+this property needs to be present in every device node which needs to to be
+mapped to numa nodes.
+
+arm,associativity property is set of 32-bit integers. representing the
+board id, socket id and core id.
+
+ex:
+	/* board 0, socket 0, core 0 */
+	arm,associativity = <0 0 0x000>;
+
+	/* board 1, socket 0, core 8 */
+	arm,associativity = <1 0 0x08>;
+
+==============================================================================
+3 - arm,associativity-reference-points
+==============================================================================
+This property is a set of 32-bit integers, each representing an index into
+the arm,associativity nodes. The first integer is the most significant
+NUMA boundary and the following are progressively less significant boundaries.
+There can be more than one level of NUMA.
+
+Ex:
+	arm,associativity-reference-points = <0 1>;
+	The board Id(index 0) used first to calculate the associativity (node
+	distance), then follows the  socket id(index 1).
+
+	arm,associativity-reference-points = <1 0>;
+	The socket Id(index 1) used first to calculate the associativity,
+	then follows the board id(index 0).
+
+	arm,associativity-reference-points = <0>;
+	Only the board Id(index 0) used to calculate the associativity.
+
+	arm,associativity-reference-points = <1>;
+	Only socket Id(index 1) used to calculate the associativity.
+
+==============================================================================
+4 - Example dts
+==============================================================================
+
+Example: 2 Node system consists of 2 boards and each board having one socket
+and 8 core in each socket.
+
+	arm,associativity-reference-points = <0 1>;
+
+	memory@00c00000 {
+		device_type = "memory";
+		reg = <0x0 0x00c00000 0x0 0x80000000>;
+		/* board 0, socket 0, no specific core */
+		arm,associativity = <0 0 0xffff>;
+	};
+
+	memory@10000000000 {
+		device_type = "memory";
+		reg = <0x100 0x00000000 0x0 0x80000000>;
+		/* board 1, socket 0, no specific core */
+		arm,associativity = <1 0 0xffff>;
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu@000 {
+			device_type = "cpu";
+			compatible =  "arm,armv8";
+			reg = <0x0 0x000>;
+			enable-method = "psci";
+			/* board 0, socket 0, core 0*/
+			arm,associativity = <0 0 0x000>;
+		};
+		cpu@001 {
+			device_type = "cpu";
+			compatible =  "arm,armv8";
+			reg = <0x0 0x001>;
+			enable-method = "psci";
+			arm,associativity = <0 0 0x001>;
+		};
+		cpu@002 {
+			device_type = "cpu";
+			compatible =  "arm,armv8";
+			reg = <0x0 0x002>;
+			enable-method = "psci";
+			arm,associativity = <0 0 0x002>;
+		};
+		cpu@003 {
+			device_type = "cpu";
+			compatible =  "arm,armv8";
+			reg = <0x0 0x003>;
+			enable-method = "psci";
+			arm,associativity = <0 0 0x003>;
+		};
+		cpu@004 {
+			device_type = "cpu";
+			compatible =  "arm,armv8";
+			reg = <0x0 0x004>;
+			enable-method = "psci";
+			arm,associativity = <0 0 0x004>;
+		};
+		cpu@005 {
+			device_type = "cpu";
+			compatible =  "arm,armv8";
+			reg = <0x0 0x005>;
+			enable-method = "psci";
+			arm,associativity = <0 0 0x005>;
+		};
+		cpu@006 {
+			device_type = "cpu";
+			compatible =  "arm,armv8";
+			reg = <0x0 0x006>;
+			enable-method = "psci";
+			arm,associativity = <0 0 0x006>;
+		};
+		cpu@007 {
+			device_type = "cpu";
+			compatible =  "arm,armv8";
+			reg = <0x0 0x007>;
+			enable-method = "psci";
+			arm,associativity = <0 0 0x007>;
+		};
+		cpu@008 {
+			device_type = "cpu";
+			compatible =  "arm,armv8";
+			reg = <0x0 0x008>;
+			enable-method = "psci";
+			/* board 1, socket 0, core 0*/
+			arm,associativity = <1 0 0x008>;
+		};
+		cpu@009 {
+			device_type = "cpu";
+			compatible =  "arm,armv8";
+			reg = <0x0 0x009>;
+			enable-method = "psci";
+			arm,associativity = <1 0 0x009>;
+		};
+		cpu@00a {
+			device_type = "cpu";
+			compatible =  "arm,armv8";
+			reg = <0x0 0x00a>;
+			enable-method = "psci";
+			arm,associativity = <0 0 0x00a>;
+		};
+		cpu@00b {
+			device_type = "cpu";
+			compatible =  "arm,armv8";
+			reg = <0x0 0x00b>;
+			enable-method = "psci";
+			arm,associativity = <1 0 0x00b>;
+		};
+		cpu@00c {
+			device_type = "cpu";
+			compatible =  "arm,armv8";
+			reg = <0x0 0x00c>;
+			enable-method = "psci";
+			arm,associativity = <1 0 0x00c>;
+		};
+		cpu@00d {
+			device_type = "cpu";
+			compatible =  "arm,armv8";
+			reg = <0x0 0x00d>;
+			enable-method = "psci";
+			arm,associativity = <1 0 0x00d>;
+		};
+		cpu@00e {
+			device_type = "cpu";
+			compatible =  "arm,armv8";
+			reg = <0x0 0x00e>;
+			enable-method = "psci";
+			arm,associativity = <1 0 0x00e>;
+		};
+		cpu@00f {
+			device_type = "cpu";
+			compatible =  "arm,armv8";
+			reg = <0x0 0x00f>;
+			enable-method = "psci";
+			arm,associativity = <1 0 0x00f>;
+		};
-- 
1.8.1.4



--===============6269099637006406173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6269099637006406173==--
