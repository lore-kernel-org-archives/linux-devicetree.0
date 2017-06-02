From: Paolo Pisati <p.pisati@gmail.com>
Subject: [PATCH v3 0/2] [PATCH v3 0/2] Lattice MachXO2 Slave SPI FPGA Manager support
Date: Fri,  2 Jun 2017 12:27:11 +0200
Message-ID: <1496399233-21451-1-git-send-email-p.pisati@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@opensource.altera.com>, Moritz Fischer <moritz.fischer@ettus.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-fpga@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi all,

this series adds support for the Lattice MachXO2 FPGA chip, programmed
over Slave SPI.

Tested on my raspberry pi3 + bugblat's pif2 fpga hat.

Changes from v1:
* fixed all the warnings pointed out by 'checkpatch --strict' and
  Alan Tull

Changes from v2:
* convert to BIT() macro and spi_message_init() / trans.delay_usecs

Paolo Pisati (2):
  dt: bindings: fpga: add lattice machxo2 slave spi binding description
  fpga: lattice machxo2: Add Lattice MachXO2 support

 .../bindings/fpga/lattice-machxo2-spi.txt          |  29 +++
 drivers/fpga/Kconfig                               |   7 +
 drivers/fpga/Makefile                              |   1 +
 drivers/fpga/machxo2-spi.c                         | 277 +++++++++++++++++++++
 4 files changed, 314 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/lattice-machxo2-spi.txt
 create mode 100644 drivers/fpga/machxo2-spi.c

-- 
2.7.4
