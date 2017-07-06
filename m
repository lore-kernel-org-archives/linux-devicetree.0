From: Paolo Pisati <p.pisati@gmail.com>
Subject: [PATCH v5 0/2] Lattice MachXO2 Slave SPI FPGA Manager support
Date: Thu,  6 Jul 2017 12:01:08 +0200
Message-ID: <1499335270-6512-1-git-send-email-p.pisati@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@kernel.org>, Moritz Fischer <moritz.fischer@ettus.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-fpga@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
                                                                                                                                                        
Changes from v3;                                                                                                                                          
* loop unroll machxo2_write() and collate writes in a single spi_sync()

Changes from v4:

* rebased on 3.12

Paolo Pisati (2):
  dt: bindings: fpga: add lattice machxo2 slave spi binding description
  fpga: lattice machxo2: Add Lattice MachXO2 support

 .../bindings/fpga/lattice-machxo2-spi.txt          |  29 ++
 drivers/fpga/Kconfig                               |   7 +
 drivers/fpga/Makefile                              |   1 +
 drivers/fpga/machxo2-spi.c                         | 298 +++++++++++++++++++++
 4 files changed, 335 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/lattice-machxo2-spi.txt
 create mode 100644 drivers/fpga/machxo2-spi.c

-- 
2.7.4
