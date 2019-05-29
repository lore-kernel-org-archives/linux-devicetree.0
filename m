From: Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH V4 net-next 4/6] dt-bindings: ptp: Introduce MII time stamping devices.
Date: Tue, 28 May 2019 22:58:05 -0700
Message-ID: <1dfbeb30abee8e28d066f90f2a98f8d364355df1.1559109077.git.richardcochran@gmail.com>
References: <cover.1559109076.git.richardcochran@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <cover.1559109076.git.richardcochran@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: David Miller <davem@davemloft.net>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

This patch add a new binding that allows non-PHY MII time stamping
devices to find their buses.  The new documentation covers both the
generic binding and one upcoming user.

Signed-off-by: Richard Cochran <richardcochran@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 Documentation/devicetree/bindings/ptp/ptp-ines.txt | 35 ++++++++++++++++++
 .../devicetree/bindings/ptp/timestamper.txt        | 41 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ptp/ptp-ines.txt
 create mode 100644 Documentation/devicetree/bindings/ptp/timestamper.txt

diff --git a/Documentation/devicetree/bindings/ptp/ptp-ines.txt b/Documentation/devicetree/bindings/ptp/ptp-ines.txt
new file mode 100644
index 000000000000..4dee9eb89455
--- /dev/null
+++ b/Documentation/devicetree/bindings/ptp/ptp-ines.txt
@@ -0,0 +1,35 @@
+ZHAW InES PTP time stamping IP core
+
+The IP core needs two different kinds of nodes.  The control node
+lives somewhere in the memory map and specifies the address of the
+control registers.  There can be up to three port handles placed as
+attributes of PHY nodes.  These associate a particular MII bus with a
+port index within the IP core.
+
+Required properties of the control node:
+
+- compatible:		"ines,ptp-ctrl"
+- reg:			physical address and size of the register bank
+
+Required format of the port handle within the PHY node:
+
+- timestamper:		provides control node reference and
+			the port channel within the IP core
+
+Example:
+
+	tstamper: timestamper@60000000 {
+		compatible = "ines,ptp-ctrl";
+		reg = <0x60000000 0x80>;
+	};
+
+	ethernet@80000000 {
+		...
+		mdio {
+			...
+			phy@3 {
+				...
+				timestamper = <&tstamper 0>;
+			};
+		};
+	};
diff --git a/Documentation/devicetree/bindings/ptp/timestamper.txt b/Documentation/devicetree/bindings/ptp/timestamper.txt
new file mode 100644
index 000000000000..88ea0bc7d662
--- /dev/null
+++ b/Documentation/devicetree/bindings/ptp/timestamper.txt
@@ -0,0 +1,41 @@
+Time stamps from MII bus snooping devices
+
+This binding supports non-PHY devices that snoop the MII bus and
+provide time stamps.  In contrast to PHY time stamping drivers (which
+can simply attach their interface directly to the PHY instance), stand
+alone MII time stamping drivers use this binding to specify the
+connection between the snooping device and a given network interface.
+
+Non-PHY MII time stamping drivers typically talk to the control
+interface over another bus like I2C, SPI, UART, or via a memory mapped
+peripheral.  This controller device is associated with one or more
+time stamping channels, each of which snoops on a MII bus.
+
+The "timestamper" property lives in a phy node and links a time
+stamping channel from the controller device to that phy's MII bus.
+
+Example:
+
+	tstamper: timestamper@10000000 {
+		compatible = "bigcorp,ts-ctrl";
+	};
+
+	ethernet@20000000 {
+		mdio {
+			phy@1 {
+				timestamper = <&tstamper 0>;
+			};
+		};
+	};
+
+	ethernet@30000000 {
+		mdio {
+			phy@2 {
+				timestamper = <&tstamper 1>;
+			};
+		};
+	};
+
+In this example, time stamps from the MII bus attached to phy@1 will
+appear on time stamp channel 0 (zero), and those from phy@2 appear on
+channel 1.
-- 
2.11.0
