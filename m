Return-Path: <SRS0=uLt8=JN=linutronix.de=b.spranger@kernel.org>
From: Benedikt Spranger <b.spranger@linutronix.de>
Subject: [PATCH 18/20] spi: xilinx: Add support for xlnx,axi-quad-spi-1.00.a
Date: Wed, 27 Jun 2018 19:09:36 +0200
Message-Id: <20180627170938.30683-19-b.spranger@linutronix.de>
In-Reply-To: <20180627170938.30683-1-b.spranger@linutronix.de>
References: <20180627170938.30683-1-b.spranger@linutronix.de>
To: kurt@linutronix.de
Cc: Ricardo Ribalda <ricardo.ribalda@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Benedikt Spranger <b.spranger@linutronix.de>
List-ID: <devicetree@vger.kernel.org>

From: Ricardo Ribalda <ricardo.ribalda@gmail.com>

The driver has been successfully tested with Xilinx's core
axi-quad-spi-1.0.0a. Documented on DS843:

https://www.xilinx.com/support/documentation/ip_documentation/axi_quad_spi/v1_00_a/ds843_axi_quad_spi.pdf

Cc: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
(cherry picked from commit a094c2fa093cf7fd0fe23d15cc2abca4083c6a45)
Signed-off-by: Benedikt Spranger <b.spranger@linutronix.de>
---
 Documentation/devicetree/bindings/spi/spi-xilinx.txt | 2 +-
 drivers/spi/spi-xilinx.c                             | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-xilinx.txt b/Documentation/devicetree/bindings/spi/spi-xilinx.txt
index c7b7856bd528..7bf61efc66c8 100644
--- a/Documentation/devicetree/bindings/spi/spi-xilinx.txt
+++ b/Documentation/devicetree/bindings/spi/spi-xilinx.txt
@@ -2,7 +2,7 @@ Xilinx SPI controller Device Tree Bindings
 -------------------------------------------------
 
 Required properties:
-- compatible		: Should be "xlnx,xps-spi-2.00.a" or "xlnx,xps-spi-2.00.b"
+- compatible		: Should be "xlnx,xps-spi-2.00.a", "xlnx,xps-spi-2.00.b" or "xlnx,axi-quad-spi-1.00.a"
 - reg			: Physical base address and size of SPI registers map.
 - interrupts		: Property with a value describing the interrupt
 			  number.
diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
index e0b9fe1d0e37..63fedc49ae9c 100644
--- a/drivers/spi/spi-xilinx.c
+++ b/drivers/spi/spi-xilinx.c
@@ -381,6 +381,7 @@ static int xilinx_spi_find_buffer_size(struct xilinx_spi *xspi)
 }
 
 static const struct of_device_id xilinx_spi_of_match[] = {
+	{ .compatible = "xlnx,axi-quad-spi-1.00.a", },
 	{ .compatible = "xlnx,xps-spi-2.00.a", },
 	{ .compatible = "xlnx,xps-spi-2.00.b", },
 	{}
-- 
2.18.0
