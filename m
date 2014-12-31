From: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: [RFC PATCH v3 2/4] Documentation: arm64/arm: dt bindings for numa.
Date: Wed, 31 Dec 2014 13:03:26 +0530
Message-ID: <1420011208-7051-3-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
References: <1420011208-7051-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420011208-7051-1-git-send-email-ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: inux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will.Deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

DT bindings for numa map for memory, cores and IOs using arm,associativ=
ity
device node property.

Signed-off-by: Ganapatrao Kulkarni <ganapatrao.kulkarni@caviumnetworks.=
com>
---
 Documentation/devicetree/bindings/arm/numa.txt | 198 +++++++++++++++++=
++++++++
 1 file changed, 198 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/numa.txt

diff --git a/Documentation/devicetree/bindings/arm/numa.txt b/Documenta=
tion/devicetree/bindings/arm/numa.txt
new file mode 100644
index 0000000..4f51e25
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/numa.txt
@@ -0,0 +1,198 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+NUMA binding description.
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+1 - Introduction
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+
+Systems employing a Non Uniform Memory Access (NUMA) architecture cont=
ain
+collections of hardware resources including processors, memory, and I/=
O buses,
+that comprise what is commonly known as a =E2=80=9CNUMA node=E2=80=9D.
+Processor accesses to memory within the local NUMA node is generally f=
aster
+than processor accesses to memory outside of the local NUMA node.
+DT defines interfaces that allow the platform to convey NUMA node
+topology information to OS.
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+2 - arm,associativity
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+
+The mapping is done using arm,associativity device property.
+this property needs to be present in every device node which needs to =
to be
+mapped to numa nodes.
+
+arm,associativity property is set of 32-bit integers. representing the
+board id, socket id and core id.
+
+ex:
+	/* board 0, socket 0, core 0 */
+	arm,associativity =3D <0 0 0x000>;
+
+	/* board 1, socket 0, core 8 */
+	arm,associativity =3D <1 0 0x08>;
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+3 - arm,associativity-reference-points
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+This property is a set of 32-bit integers, each representing an index =
into
+the arm,associativity nodes. The first integer is the most significant
+NUMA boundary and the following are progressively less significant bou=
ndaries.
+There can be more than one level of NUMA.
+
+Ex:
+	arm,associativity-reference-points =3D <0 1>;
+	The board Id(index 0) used first to calculate the associativity (node
+	distance), then follows the  socket id(index 1).
+
+	arm,associativity-reference-points =3D <1 0>;
+	The socket Id(index 1) used first to calculate the associativity,
+	then follows the board id(index 0).
+
+	arm,associativity-reference-points =3D <0>;
+	Only the board Id(index 0) used to calculate the associativity.
+
+	arm,associativity-reference-points =3D <1>;
+	Only socket Id(index 1) used to calculate the associativity.
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+4 - Example dts
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+
+Example: 2 Node system consists of 2 boards and each board having one =
socket
+and 8 core in each socket.
+
+	arm,associativity-reference-points =3D <0 1>;
+
+	memory@00c00000 {
+		device_type =3D "memory";
+		reg =3D <0x0 0x00c00000 0x0 0x80000000>;
+		/* board 0, socket 0, no specific core */
+		arm,associativity =3D <0 0 0xffff>;
+	};
+
+	memory@10000000000 {
+		device_type =3D "memory";
+		reg =3D <0x100 0x00000000 0x0 0x80000000>;
+		/* board 1, socket 0, no specific core */
+		arm,associativity =3D <1 0 0xffff>;
+	};
+
+	cpus {
+		#address-cells =3D <2>;
+		#size-cells =3D <0>;
+
+		cpu@000 {
+			device_type =3D "cpu";
+			compatible =3D  "arm,armv8";
+			reg =3D <0x0 0x000>;
+			enable-method =3D "psci";
+			/* board 0, socket 0, core 0*/
+			arm,associativity =3D <0 0 0x000>;
+		};
+		cpu@001 {
+			device_type =3D "cpu";
+			compatible =3D  "arm,armv8";
+			reg =3D <0x0 0x001>;
+			enable-method =3D "psci";
+			arm,associativity =3D <0 0 0x001>;
+		};
+		cpu@002 {
+			device_type =3D "cpu";
+			compatible =3D  "arm,armv8";
+			reg =3D <0x0 0x002>;
+			enable-method =3D "psci";
+			arm,associativity =3D <0 0 0x002>;
+		};
+		cpu@003 {
+			device_type =3D "cpu";
+			compatible =3D  "arm,armv8";
+			reg =3D <0x0 0x003>;
+			enable-method =3D "psci";
+			arm,associativity =3D <0 0 0x003>;
+		};
+		cpu@004 {
+			device_type =3D "cpu";
+			compatible =3D  "arm,armv8";
+			reg =3D <0x0 0x004>;
+			enable-method =3D "psci";
+			arm,associativity =3D <0 0 0x004>;
+		};
+		cpu@005 {
+			device_type =3D "cpu";
+			compatible =3D  "arm,armv8";
+			reg =3D <0x0 0x005>;
+			enable-method =3D "psci";
+			arm,associativity =3D <0 0 0x005>;
+		};
+		cpu@006 {
+			device_type =3D "cpu";
+			compatible =3D  "arm,armv8";
+			reg =3D <0x0 0x006>;
+			enable-method =3D "psci";
+			arm,associativity =3D <0 0 0x006>;
+		};
+		cpu@007 {
+			device_type =3D "cpu";
+			compatible =3D  "arm,armv8";
+			reg =3D <0x0 0x007>;
+			enable-method =3D "psci";
+			arm,associativity =3D <0 0 0x007>;
+		};
+		cpu@008 {
+			device_type =3D "cpu";
+			compatible =3D  "arm,armv8";
+			reg =3D <0x0 0x008>;
+			enable-method =3D "psci";
+			/* board 1, socket 0, core 0*/
+			arm,associativity =3D <1 0 0x008>;
+		};
+		cpu@009 {
+			device_type =3D "cpu";
+			compatible =3D  "arm,armv8";
+			reg =3D <0x0 0x009>;
+			enable-method =3D "psci";
+			arm,associativity =3D <1 0 0x009>;
+		};
+		cpu@00a {
+			device_type =3D "cpu";
+			compatible =3D  "arm,armv8";
+			reg =3D <0x0 0x00a>;
+			enable-method =3D "psci";
+			arm,associativity =3D <0 0 0x00a>;
+		};
+		cpu@00b {
+			device_type =3D "cpu";
+			compatible =3D  "arm,armv8";
+			reg =3D <0x0 0x00b>;
+			enable-method =3D "psci";
+			arm,associativity =3D <1 0 0x00b>;
+		};
+		cpu@00c {
+			device_type =3D "cpu";
+			compatible =3D  "arm,armv8";
+			reg =3D <0x0 0x00c>;
+			enable-method =3D "psci";
+			arm,associativity =3D <1 0 0x00c>;
+		};
+		cpu@00d {
+			device_type =3D "cpu";
+			compatible =3D  "arm,armv8";
+			reg =3D <0x0 0x00d>;
+			enable-method =3D "psci";
+			arm,associativity =3D <1 0 0x00d>;
+		};
+		cpu@00e {
+			device_type =3D "cpu";
+			compatible =3D  "arm,armv8";
+			reg =3D <0x0 0x00e>;
+			enable-method =3D "psci";
+			arm,associativity =3D <1 0 0x00e>;
+		};
+		cpu@00f {
+			device_type =3D "cpu";
+			compatible =3D  "arm,armv8";
+			reg =3D <0x0 0x00f>;
+			enable-method =3D "psci";
+			arm,associativity =3D <1 0 0x00f>;
+		};
--=20
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
