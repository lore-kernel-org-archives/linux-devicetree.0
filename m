From: Loc Ho <lho@apm.com>
Subject: [PATCH v5 0/3] clk: Add APM X-Gene SoC clock driver
Date: Wed, 26 Jun 2013 11:56:08 -0600
Message-ID: <1372269371-22992-1-git-send-email-lho@apm.com>
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
To: mark.rutland@arm.com
Cc: fkan@apm.com, mturquette@linaro.org, Catalin.Marinas@arm.com, devicetree-discuss@lists.ozlabs.org, Loc Ho <lho@apm.com>, ksankaran@apm.com, vkale@apm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds APM X-Gene SoC clock driver support. Reference,
PCP PLL, SoC PCP, and Ethernet clocks are defined via the DTS.

-v5:
 * Remove duplicate code for soc/pcp clk init function
 * Remove un-used flags field from structure
 * Merge error handler code for device clock init function
 * Update binding documentation

-v4:
 * Remove flags from DTS and check status instead
 * Change DTS reg entry to be identified by reg-names property

-v3:
 * Make DTS compatible type for SoC PLL and PCP PLL
 * Make use of of_iomap instead direct ioremap call
 * Make kzalloc with variable instead structure
 * Remove DTS binding for fixed-clock and fixed_factor_clock
 * Remove unnecessary arch_initcall

-v2:
 * Make depends on ARM64
 * Fix duplicate registration

-v1 - Initial post 

Loc Ho (3):
  clk: Add APM X-Gene SoC clock driver for reference, PLL, and device
    clocks.
  clk: arm64: Add DTS clock entry for APM X-Gene Storm SoC with
    reference to
  Documentation: Add documentation for APM X-Gene clock binding with
    PLL and

 Documentation/devicetree/bindings/clock/xgene.txt |  111 +++++
 arch/arm64/boot/dts/apm-storm.dtsi                |   75 +++
 drivers/clk/Kconfig                               |    7 +
 drivers/clk/Makefile                              |    1 +
 drivers/clk/clk-xgene.c                           |  521 +++++++++++++++++++++
 5 files changed, 715 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xgene.txt
 create mode 100644 drivers/clk/clk-xgene.c
