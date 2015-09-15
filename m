From: Scott Wood <scottwood@freescale.com>
Subject: [PATCH] Docs/kernel-parameters: Add earlycon devicetree usage
Date: Mon, 14 Sep 2015 19:54:07 -0500
Message-ID: <20150915005407.GA19995@home.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This form of the earlycon parameter was added by commit fb11ffe74c794a5
("of/fdt: add FDT serial scanning for earlycon") without documentation.

Signed-off-by: Scott Wood <scottwood@freescale.com>
---
 Documentation/kernel-parameters.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-parameters.txt
index 22a4b68..d461320 100644
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@ -971,6 +971,10 @@ bytes respectively. Such letter suffixes can also be entirely omitted.
 
 	earlycon=	[KNL] Output early console device and options.
 
+			When used with no options, the early console is
+			determined by the stdout-path property in device
+			tree's chosen node.
+
 		cdns,<addr>
 			Start an early, polled-mode console on a cadence serial
 			port at the specified address. The cadence serial port
-- 
2.1.4
