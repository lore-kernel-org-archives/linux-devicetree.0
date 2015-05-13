From: <tthayer@opensource.altera.com>
Subject: [PATCH 0/4] Add Altera Arria10 EDAC Support
Date: Wed, 13 May 2015 16:49:43 -0500
Message-ID: <1431553787-27741-1-git-send-email-tthayer@opensource.altera.com>
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

This series of patches adds support for the Arria10 EDAC. The
SDRAM controller and ECC registers are significantly different
from the CycloneV/ArriaV but common areas could be abstracted.

Thor Thayer (4):
  edac, altera: Generalize driver to use DT Memory size
  edac, altera: Refactor EDAC for Altera CycloneV SoC.
  edac, altera: Addition of Arria10 EDAC
  dts, altera: Arria10 SDRAM EDAC DTS additions.

 .../bindings/arm/altera/socfpga-sdram-edac.txt     |    2 +-
 arch/arm/boot/dts/socfpga_arria10.dtsi             |   11 +
 drivers/edac/altera_edac.c                         |  357 ++++++++++++--------
 drivers/edac/altera_edac.h                         |  201 +++++++++++
 4 files changed, 434 insertions(+), 137 deletions(-)
 create mode 100644 drivers/edac/altera_edac.h

-- 
1.7.9.5
