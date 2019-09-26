From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [RFC PATCHv2 3/3] Documentation: short descriptions for Flexnoc Performance Monitor driver
Date: Thu, 26 Sep 2019 10:46:26 +0530
Message-ID: <81f9de9559d248be498cac1ee0e3ab15c7a2696c.1569474867.git.shubhrajyoti.datta@xilinx.com>
References: <2de75a74ef4086090c532d3b80b7d6dcd115e45e.1569474867.git.shubhrajyoti.datta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2de75a74ef4086090c532d3b80b7d6dcd115e45e.1569474867.git.shubhrajyoti.datta@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, michal.simek@xilinx.com, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add short documentation for FlexNoc Performance Monitor driver.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v2:
patch added

 Documentation/misc-devices/xilinx_flex.txt | 66 ++++++++++++++++++++++++++=
++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/misc-devices/xilinx_flex.txt

diff --git a/Documentation/misc-devices/xilinx_flex.txt b/Documentation/mis=
c-devices/xilinx_flex.txt
new file mode 100644
index 0000000..c075934
--- /dev/null
+++ b/Documentation/misc-devices/xilinx_flex.txt
@@ -0,0 +1,66 @@
+Kernel driver xilinx_flex
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+
+Supported chips:
+Versal SOC
+
+Author:
+       Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
+
+Description
+-----------
+
+Versal uses the Arteris FlexNoC interconnect instead of the ARM NIC. FlexN=
oC
+provides the capability to integrate performance counters in the interconn=
ect.
+It has configurable probe points to monitor the packet and forwards it to
+observer for logging. It supports read and write transaction counts for
+request and response.
+
+Features:
+---> Run-time programmable selection of packet probe points.
+---> Recording of traffic and link statistics.
+---> Separate read and write response and request count.
+
+SYSFS:
+
+counteridfpd
+       RW - shows the counter number selected for the FPD Flexnoc.
+
+counterfpd_rdreq
+       RO - shows the read request count for the FPD counters.
+
+counterfpdsrc
+       WO - sets the source of the FPD counter.
+
+counterfpd_wrrsp
+       RO - shows the write response count for the FPD counters.
+
+counterfpd_rdrsp
+       RO - shows the read response count for the FPD counters.
+
+counterfpd_wrreq
+       RO - shows the write request count for the FPD counters.
+
+counterfpdport
+       WO - sets the port number selected for the FPD Flexnoc.
+
+counteridlpd
+       RW - shows the counter number selected for the LPD Flexnoc.
+
+counterlpdport
+       WO - sets the port number selected for the LPD Flexnoc.
+
+counterlpd_rdreq
+       RO - shows the read request count for the LPD counters.
+
+counterlpd_wrreq
+       RO - shows the write request count for the LPD counters.
+
+counterlpd_wrrsp
+       RO - shows the write response count for the LPD counters.
+
+counterlpdsrc
+       WO - sets the source of the LPD counter.
+
+counterlpd_rdrsp
+       RO - shows the read response count for the LPD counters.
--
2.1.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
