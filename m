From: Tony Prisk <linux@prisktech.co.nz>
Subject: [PATCH 0/3] dts: v8500: Cleanups for 3.10
Date: Wed, 24 Apr 2013 17:38:19 +1200
Message-ID: <1366781902-13025-1-git-send-email-linux@prisktech.co.nz>
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
To: devicetree-discuss@lists.ozlabs.org
Cc: vt8500-wm8505-linux-kernel@googlegroups.com, olof@lixom.net, Tony Prisk <linux@prisktech.co.nz>, arnd@arndb.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Arnd, Olof,

This is probably a bit late for 3.10 now but its just a bunch of cleanups for
the arch-vt8500 devicetree SoC and board files, and the addition of a new
dts for the VIA APC8750.

Regards
Tony P

Tony Prisk (3):
  dts: vt8500: Fix invalid/missing cpu nodes for soc files.
  dts: vt8500: Add devicetree support for WM8750 SoC and APC8750 board
  dts: vt8500: Update serial nodes and disable by default in SoC files

 arch/arm/boot/dts/Makefile           |    1 +
 arch/arm/boot/dts/vt8500-bv07.dts    |    4 +
 arch/arm/boot/dts/vt8500.dtsi        |   29 ++-
 arch/arm/boot/dts/wm8505-ref.dts     |    4 +
 arch/arm/boot/dts/wm8505.dtsi        |   35 +++-
 arch/arm/boot/dts/wm8650-mid.dts     |    4 +
 arch/arm/boot/dts/wm8650.dtsi        |   21 +-
 arch/arm/boot/dts/wm8750-apc8750.dts |   30 +++
 arch/arm/boot/dts/wm8750.dtsi        |  355 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/wm8850-w70v2.dts   |    4 +
 arch/arm/boot/dts/wm8850.dtsi        |   23 ++-
 11 files changed, 492 insertions(+), 18 deletions(-)
 create mode 100644 arch/arm/boot/dts/wm8750-apc8750.dts
 create mode 100644 arch/arm/boot/dts/wm8750.dtsi

-- 
1.7.9.5
