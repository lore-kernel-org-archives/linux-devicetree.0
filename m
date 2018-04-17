From: Moritz Fischer <mdf@kernel.org>
Subject: [PATCH 0/3] FPGA Manager Patches for 4.18
Date: Mon, 16 Apr 2018 20:43:34 -0700
Message-ID: <20180417034337.8855-1-mdf@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linux-foundation.org
Cc: linux-fpga.vger@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, atull@kernel.org, robh+dt@kernel.org, Moritz Fischer <mdf@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Greg,

Please queue the following patches for v4.18.

Alan's Patch clarifies the locking in the fpga-region code.

Paolo's patches add a new driver with corresponding bindings for a
Lattice FPGA part.

Thanks,

Moritz

Alan Tull (1):
  fpga: fpga-region: comment on fpga_region_program_fpga locking

Paolo Pisati (2):
  dt: bindings: fpga: add lattice machxo2 slave spi binding description
  fpga: lattice machxo2: Add Lattice MachXO2 support

 .../bindings/fpga/lattice-machxo2-spi.txt     |  29 ++
 drivers/fpga/Kconfig                          |   7 +
 drivers/fpga/Makefile                         |   1 +
 drivers/fpga/fpga-region.c                    |   5 +
 drivers/fpga/machxo2-spi.c                    | 403 ++++++++++++++++++
 5 files changed, 445 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/lattice-machxo2-spi.txt
 create mode 100644 drivers/fpga/machxo2-spi.c

-- 
2.17.0
