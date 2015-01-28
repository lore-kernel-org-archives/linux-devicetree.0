From: Paul Walmsley <paul@pwsan.com>
Subject: [PATCH 08/24] Documentation: DT bindings: add more chip compatible
 strings for Tegra UART
Date: Wed, 28 Jan 2015 16:49:37 -0700
Message-ID: <20150128234937.20644.53335.stgit@dusk.lan>
References: <20150128234935.20644.89300.stgit@dusk.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150128234935.20644.89300.stgit@dusk.lan>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Peter Hurley <peter@hurleysoftware.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jingchang Lu <jingchang.lu@freescale.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Murali Karicheri <m-karicheri2@ti.com>, Paul Walmsley <pwalmsley@nvidia.com>, Kumar Gala <galak@codeaurora.org>, John Crispin <blogic@openwrt.org>
List-Id: devicetree@vger.kernel.org


Add compatible strings for the UART IP blocks present on several Tegra
chips.  The primary objective here is to avoid checkpatch warnings,
per:

http://marc.info/?l=linux-tegra&m=142201349727836&w=2

Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jingchang Lu <jingchang.lu@freescale.com>
Cc: Peter Hurley <peter@hurleysoftware.com>
Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: John Crispin <blogic@openwrt.org>
Cc: Paul Walmsley <pwalmsley@nvidia.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 .../devicetree/bindings/serial/of-serial.txt       |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/of-serial.txt b/Documentation/devicetree/bindings/serial/of-serial.txt
index b52b98234b9b..06ebae54cbcc 100644
--- a/Documentation/devicetree/bindings/serial/of-serial.txt
+++ b/Documentation/devicetree/bindings/serial/of-serial.txt
@@ -9,6 +9,11 @@ Required properties:
 	- "ns16750"
 	- "ns16850"
 	- "nvidia,tegra20-uart"
+	- "nvidia,tegra30-uart" (not yet matched by the driver)
+	- "nvidia,tegra114-uart" (not yet matched by the driver)
+	- "nvidia,tegra124-uart" (not yet matched by the driver)
+	- "nvidia,tegra132-uart" (not yet matched by the driver)
+	- "nvidia,tegra210-uart" (not yet matched by the driver)
 	- "nxp,lpc3220-uart"
 	- "ralink,rt2880-uart"
 	- "ibm,qpace-nwp-serial"
