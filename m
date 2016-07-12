From: Alan Tull <atull@opensource.altera.com>
Subject: [PATCH 0/2] FPGA Manager support for Arria10
Date: Tue, 12 Jul 2016 14:07:07 -0500
Message-ID: <20160712190709.5964-1-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Moritz Fischer <moritz.fischer@ettus.com>, devicetree@vger.kernel.org, Alan Tull <atull@opensource.altera.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@opensource.altera.com>, delicious.quinoa@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

New patch submission for FPGA Manager support for the Altera
SoCFPGA Arria10 plus device tree bindings.

Alan Tull (2):
  ARM: socfpga: add bindings doc for arria10 fpga manager
  fpga-manager: Add Socfpga Arria10 support

 .../bindings/fpga/altera-socfpga-a10-fpga-mgr.txt  |  19 +
 drivers/fpga/Kconfig                               |   6 +
 drivers/fpga/Makefile                              |   1 +
 drivers/fpga/socfpga-a10.c                         | 573 +++++++++++++++++++++
 4 files changed, 599 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-socfpga-a10-fpga-mgr.txt
 create mode 100644 drivers/fpga/socfpga-a10.c

-- 
2.9.1
