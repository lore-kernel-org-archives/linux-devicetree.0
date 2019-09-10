From: Robert Beckett <bob.beckett@collabora.com>
Subject: [PATCH 5/7] dt-bindings: mv88e6xxx: add ability to set queue scheduling
Date: Tue, 10 Sep 2019 16:41:51 +0100
Message-ID: <20190910154238.9155-6-bob.beckett@collabora.com>
References: <20190910154238.9155-1-bob.beckett@collabora.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190910154238.9155-1-bob.beckett@collabora.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: Robert Beckett <bob.beckett@collabora.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document port queue scheduling settings.
Add definitions for specific valid values.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 .../devicetree/bindings/net/dsa/marvell.txt     | 12 ++++++++++++
 include/dt-bindings/net/dsa-mv88e6xxx.h         | 17 +++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 include/dt-bindings/net/dsa-mv88e6xxx.h

diff --git a/Documentation/devicetree/bindings/net/dsa/marvell.txt b/Documentation/devicetree/bindings/net/dsa/marvell.txt
index e097c3c52eac..7de90929c3c9 100644
--- a/Documentation/devicetree/bindings/net/dsa/marvell.txt
+++ b/Documentation/devicetree/bindings/net/dsa/marvell.txt
@@ -50,6 +50,18 @@ Optional properties:
 Optional properties for ports:
 - defqpri=<n>		: Enforced default queue priority for the given port.
 			  Valid range is 0..3
+- schedule=<n>		: Set ports scheduling mode. Valid values are:
+			  MV88E6XXX_PORT_SCHED_ROUND_ROBIN - All output queues
+			  use a weighter round robin scheme.
+			  MV88E6XXX_PORT_SCHED_STRICT_3 - Output queue 3 uses
+			  a strict scheme, where any packets in queue 3 will be
+			  egressed first, followed by weighted round robin for
+			  the other ports.
+			  MV88E6XXX_PORT_SCHED_STRICT_3_2 - Output queue's 2
+			  and 3 use strict, other use weighted round robin.
+			  MV88E6XXX_PORT_SCHED_STRICT_ALL - All queues use
+			  strict priority, where queues drain in descending
+			  queue number order.
 
 Example:
 
diff --git a/include/dt-bindings/net/dsa-mv88e6xxx.h b/include/dt-bindings/net/dsa-mv88e6xxx.h
new file mode 100644
index 000000000000..3f62003841ce
--- /dev/null
+++ b/include/dt-bindings/net/dsa-mv88e6xxx.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Device Tree constants for Marvell 88E6xxx Switch Port Registers
+ *
+ * Copyright (c) 2019, Collabora Ltd.
+ * Copyright (c) 2019, General Electric Company
+ */
+
+#ifndef _DT_BINDINGS_MV88E6XXX_H
+#define _DT_BINDINGS_MV88E6XXX_H
+
+#define MV88E6XXX_PORT_SCHED_ROUND_ROBIN	0
+#define MV88E6XXX_PORT_SCHED_STRICT_3		1
+#define MV88E6XXX_PORT_SCHED_STRICT_3_2		2
+#define MV88E6XXX_PORT_SCHED_STRICT_ALL		3
+
+#endif /* _DT_BINDINGS_MV88E6XXX_H */
-- 
2.18.0
