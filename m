From: <tthayer@opensource.altera.com>
Subject: [PATCHv4 0/7] Add Ethernet EDAC & peripheral init functions
Date: Mon, 20 Jun 2016 09:50:45 -0500
Message-ID: <1466434252-26107-1-git-send-email-tthayer@opensource.altera.com>
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

This patch set adds the Ethernet EDAC and memory initialization functions
for Altera's Arria10 peripherals. The ECC memory init functions are common
to all the peripheral memory buffers (to follow in later patches).

Thor Thayer (7):
  EDAC, altera: Add panic flag check to A10 IRQ
  EDAC, altera: Make all private data structures static const.
  EDAC, altera: Share Arria10 check_deps & IRQ functions
  Documentation: dt: socfpga: Add Arria10 Ethernet binding
  EDAC, altera: Add Arria10 ECC memory init functions
  EDAC, altera: Add Arria10 Ethernet EDAC support
  ARM: dts: Add Arria10 Ethernet EDAC devicetree entry

 .../bindings/arm/altera/socfpga-eccmgr.txt         |   24 ++
 arch/arm/boot/dts/socfpga_arria10.dtsi             |   16 +
 drivers/edac/Kconfig                               |    7 +
 drivers/edac/altera_edac.c                         |  312 +++++++++++++++++---
 drivers/edac/altera_edac.h                         |   12 +
 5 files changed, 333 insertions(+), 38 deletions(-)

-- 
1.7.9.5
