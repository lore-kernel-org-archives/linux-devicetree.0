From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH 0/2] Xilinx Slave Serial FPGA Manager
Date: Thu, 16 Feb 2017 16:10:58 +0100
Message-ID: <1487257860-31115-1-git-send-email-agust@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds an FPGA manager driver for Xilinx Spartan6 FPGAs
that can configure them using an SPI port and two GPIOs.

Anatolij Gustschin (2):
  dt: bindings: fpga: add xilinx slave-serial binding description
  fpga manager: Add Xilinx slave serial SPI driver

 .../bindings/fpga/xilinx-slave-serial.txt          |  24 +++
 drivers/fpga/Kconfig                               |   7 +
 drivers/fpga/Makefile                              |   1 +
 drivers/fpga/xilinx-spi.c                          | 181 +++++++++++++++++++++
 4 files changed, 213 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt
 create mode 100644 drivers/fpga/xilinx-spi.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
