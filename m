Return-Path: <SRS0=2X+C=OH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36501 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728052AbeK1Uzl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 28 Nov 2018 15:55:41 -0500
From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 08/12] dt-bindings: serial: Add bindings for nvidia,tegra194-tcu
Date: Wed, 28 Nov 2018 10:54:17 +0100
Message-Id: <20181128095421.20573-9-thierry.reding@gmail.com>
In-Reply-To: <20181128095421.20573-1-thierry.reding@gmail.com>
References: <20181128095421.20573-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>, Pekka Pessi <ppessi@nvidia.com>, Mika Liljeberg <mliljeberg@nvidia.com>, linux-tegra@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Add bindings for the Tegra Combined UART device used to talk to the
UART console on Tegra194 systems.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/serial/nvidia,tegra194-tcu.txt   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.txt

diff --git a/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.txt b/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.txt
new file mode 100644
index 000000000000..085a8591accd
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.txt
@@ -0,0 +1,35 @@
+NVIDIA Tegra Combined UART (TCU)
+
+The TCU is a system for sharing a hardware UART instance among multiple
+systems within the Tegra SoC. It is implemented through a mailbox-
+based protocol where each "virtual UART" has a pair of mailboxes, one
+for transmitting and one for receiving, that is used to communicate
+with the hardware implementing the TCU.
+
+Required properties:
+- name : Should be tcu
+- compatible
+    Array of strings
+    One of:
+    - "nvidia,tegra194-tcu"
+- mbox-names:
+    "rx" - Mailbox for receiving data from hardware UART
+    "tx" - Mailbox for transmitting data to hardware UART
+- mboxes: Mailboxes corresponding to the mbox-names.
+
+This node is a mailbox consumer. See the following files for details of
+the mailbox subsystem, and the specifiers implemented by the relevant
+provider(s):
+
+- .../mailbox/mailbox.txt
+- .../mailbox/nvidia,tegra186-hsp.txt
+
+Example bindings:
+-----------------
+
+tcu: tcu {
+	compatible = "nvidia,tegra194-tcu";
+	mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_SM 0>,
+	         <&hsp_aon TEGRA_HSP_MBOX_TYPE_SM 1>;
+	mbox-names = "rx", "tx";
+};
-- 
2.19.1
