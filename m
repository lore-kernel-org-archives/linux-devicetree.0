From: <tthayer@opensource.altera.com>
Subject: [PATCH 00/10] Add NAND, DMA, USB, and QSPI EDAC
Date: Thu, 14 Jul 2016 11:06:38 -0500
Message-ID: <1468512408-5156-1-git-send-email-tthayer@opensource.altera.com>
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
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, tthayer@opensource.altera.com, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

This patch series adds the NAND, DMA, USB and QSPI FIFO EDAC modules.

Thor Thayer (10):
  Documentation: dt: socfpga: Add Arria10 NAND EDAC binding
  Documentation: dt: socfpga: Add Arria10 DMA EDAC binding
  Documentation: dt: socfpga: Add Arria10 USB EDAC binding
  Documentation: dt: socfpga: Add Arria10 QSPI EDAC binding
  EDAC, altera: Add Arria10 NAND EDAC support
  EDAC, altera: Add Arria10 DMA EDAC support
  EDAC, altera: Add Arria10 USB EDAC support
  EDAC, altera: Add Arria10 QSPI EDAC support
  ARM: dts: Add Arria10 DMA EDAC devicetree entry
  ARM: dts: Add Arria10 USB EDAC devicetree entry

 .../bindings/arm/altera/socfpga-eccmgr.txt         |   79 ++++++++++++
 arch/arm/boot/dts/socfpga_arria10.dtsi             |   16 +++
 drivers/edac/Kconfig                               |   28 +++++
 drivers/edac/altera_edac.c                         |  130 +++++++++++++++++++-
 4 files changed, 252 insertions(+), 1 deletion(-)

-- 
1.7.9.5
