From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [RFC PATCHv2 1/3] dt-bindings: misc: Add dt bindings for flex noc Performance Monitor
Date: Thu, 26 Sep 2019 10:46:24 +0530
Message-ID: <2de75a74ef4086090c532d3b80b7d6dcd115e45e.1569474867.git.shubhrajyoti.datta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, michal.simek@xilinx.com, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add dt bindings for flexnoc Performance Monitor.
The flexnoc counters for read and write response and requests are
supported.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 .../devicetree/bindings/misc/xlnx,flexnoc.txt      | 24 ++++++++++++++++++=
++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,flexnoc.txt

diff --git a/Documentation/devicetree/bindings/misc/xlnx,flexnoc.txt b/Docu=
mentation/devicetree/bindings/misc/xlnx,flexnoc.txt
new file mode 100644
index 0000000..6b533bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/xlnx,flexnoc.txt
@@ -0,0 +1,24 @@
+* Xilinx Flexnoc Performance Monitor driver
+
+The FlexNoc Performance Monitor has counters for monitoring
+the read and the write transaction counter.
+
+Required properties:
+- compatible: "xlnx,flexnoc-pm-2.7"
+- reg : Address and length of register sets for each device in
+       "reg-names"
+- reg-names : The names of the register addresses corresponding to the
+               registers filled in "reg"
+               - funnel: base address of the funnel registers
+               - baselpd: base address of the LPD PM registers
+               - basefpd: base address FPD PM registers
+
+Example:
+++++++++
+performance-monitor@f0920000 {
+               compatible =3D "xlnx,flexnoc-pm-2.7";
+               reg-names =3D "funnel", "baselpd", "basefpd";
+               reg =3D <0x0 0xf0920000 0x0 0x1000>,
+                       <0x0 0xf0980000 0x0 0x9000>,
+                       <0x0 0xf0b80000 0x0 0x9000>;
+};
--
2.1.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
