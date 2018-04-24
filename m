From: thor.thayer@linux.intel.com
Subject: [PATCH 0/3] Add SDRAM ECC support for Stratix10
Date: Tue, 24 Apr 2018 13:35:56 -0500
Message-ID: <1524594959-5259-1-git-send-email-thor.thayer@linux.intel.com>
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
To: bp@alien8.de, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, thor.thayer@linux.intel.com, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

The Intel Stratix10 platform is an ARM64 but still has many register
definitions that are similar to the Arria10. One significant difference
is the Stratix10 hypervisor which requires handling registers that may
be shared by guest OSes at a different exception level. Register access
is through an ARM SMC call. Currently, SMC handling is implemented
in U-Boot.

Thor Thayer (3):
  Documentation: dt: socfpga: Add Stratix10 ECC Manager binding
  edac: altera: Add support for Stratix10 SDRAM EDAC
  arm64: dts: stratix10: add sdram ecc

 .../bindings/arm/altera/socfpga-eccmgr.txt         |  47 +++
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |  17 +
 drivers/edac/Kconfig                               |   2 +-
 drivers/edac/altera_edac.c                         | 459 +++++++++++++++++++++
 drivers/edac/altera_edac.h                         | 114 +++++
 5 files changed, 638 insertions(+), 1 deletion(-)

-- 
2.7.4
