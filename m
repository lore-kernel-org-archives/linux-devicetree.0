From: Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 0/3] Add device tree support for i.mx51/53 boards
Date: Tue, 2 Aug 2011 03:17:30 +0800
Message-ID: <1312226252-8566-1-git-send-email-shawn.guo@linaro.org>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

Since we have not reached the agreement on iomuxc binding, I'm dropping
that patch and reusing the iomuxc setup that is currently used by non-dt
board files.  Hopefully, doing that could get the series merged for
v3.1, so that people can start playing device tree on i.mx51 babbage and
i.mx53 quick start board.

Will revisit the iomuxc device tree support, when we agree on the right
approach to do it.

Changes since v2:
 * Drop iomuxc device tree support patch

Changes since v1:
 * Address comments on v1 given by Grant and Sascha
 * Add i.mx51 Babbage support

Shawn Guo (2):
      arm/mx5: add device tree support for imx53 boards
      arm/mx5: add device tree support for imx51 babbage

 .../devicetree/bindings/arm/fsl/boards.txt         |   19 ++
 arch/arm/boot/dts/imx51-babbage.dts                |  141 +++++++++++
 arch/arm/boot/dts/imx51.dtsi                       |  203 ++++++++++++++++
 arch/arm/boot/dts/imx53-ard.dts                    |  158 +++++++++++++
 arch/arm/boot/dts/imx53-evk.dts                    |  144 ++++++++++++
 arch/arm/boot/dts/imx53-qsb.dts                    |  148 ++++++++++++
 arch/arm/boot/dts/imx53-smd.dts                    |  169 ++++++++++++++
 arch/arm/boot/dts/imx53.dtsi                       |  244 ++++++++++++++++++++
 arch/arm/mach-mx5/Kconfig                          |   21 ++
 arch/arm/mach-mx5/Makefile                         |    3 +
 arch/arm/mach-mx5/board-mx51_babbage.c             |    5 +
 arch/arm/mach-mx5/board-mx53_ard.c                 |    9 +-
 arch/arm/mach-mx5/board-mx53_evk.c                 |    5 +
 arch/arm/mach-mx5/board-mx53_loco.c                |    5 +
 arch/arm/mach-mx5/board-mx53_smd.c                 |    5 +
 arch/arm/mach-mx5/imx51-dt.c                       |  112 +++++++++
 arch/arm/mach-mx5/imx53-dt.c                       |  143 ++++++++++++
 arch/arm/plat-mxc/include/mach/common.h            |    2 +
 arch/arm/plat-mxc/include/mach/iomux-mx51.h        |    2 +
 arch/arm/plat-mxc/include/mach/iomux-mx53.h        |    5 +
 arch/arm/plat-mxc/include/mach/iomux-v3.h          |    5 +
 21 files changed, 1546 insertions(+), 2 deletions(-)
