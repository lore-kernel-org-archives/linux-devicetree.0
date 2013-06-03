From: Tony Prisk <linux@prisktech.co.nz>
Subject: [GIT PULL] vt8500 devicetree updates for 3.11
Date: Tue, 04 Jun 2013 07:39:14 +1200
Message-ID: <51ACF0E2.2000206@prisktech.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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
To: arm@kernel.org
Cc: "Johansson, Olof" <olof@lixom.net>, VT8500/WM8505 Linux Kernel <vt8500-wm8505-linux-kernel@googlegroups.com>, "List, Devicetree" <devicetree-discuss@lists.ozlabs.org>, "Bergmann,
 Arnd" <arnd@arndb.de>, "Mailing List,
 Arm" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

The following changes since commit f722406faae2d073cc1d01063d1123c35425939e:

   Linux 3.10-rc1 (2013-05-11 17:14:08 -0700)

are available in the git repository at:

   git://github.com/linux-wmt/linux-vtwm.git tags/vt8500/dts-3.11

for you to fetch changes up to e36572b64df358f0bc3a508e8761c81d7f3b8215:

   dts: vt8500: Correct reference clock on WM8850 SoCs (2013-06-04 
07:31:22 +1200)

----------------------------------------------------------------
Devicetree updates for 3.11

----------------------------------------------------------------
Tony Prisk (7):
       dts: vt8500: Fix invalid/missing cpu nodes for soc files.
       dts: vt8500: Add devicetree support for WM8750 SoC and APC8750 board
       dts: vt8500: Update serial nodes and disable by default in SoC files
       dts: clk: vt8500: Update SoC dtsi to use WM8850 PLL clocks
       dts: vt8500: Populate missing PLL nodes
       dts: vt8500: Add ARM, AHB, APB and DDR clock nodes to SoC files
       dts: vt8500: Correct reference clock on WM8850 SoCs

  arch/arm/boot/dts/Makefile           |    1 +
  arch/arm/boot/dts/vt8500-bv07.dts    |    4 +
  arch/arm/boot/dts/vt8500.dtsi        |   29 ++-
  arch/arm/boot/dts/wm8505-ref.dts     |    4 +
  arch/arm/boot/dts/wm8505.dtsi        |   84 +++++++-
  arch/arm/boot/dts/wm8650-mid.dts     |    3 +
  arch/arm/boot/dts/wm8650.dtsi        |   79 +++++++-
  arch/arm/boot/dts/wm8750-apc8750.dts |   30 +++
  arch/arm/boot/dts/wm8750.dtsi        |  347 
++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/wm8850-w70v2.dts   |    4 +
  arch/arm/boot/dts/wm8850.dtsi        |   94 ++++++++-
  11 files changed, 649 insertions(+), 30 deletions(-)
  create mode 100644 arch/arm/boot/dts/wm8750-apc8750.dts
  create mode 100644 arch/arm/boot/dts/wm8750.dtsi
