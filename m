From: Tali Perry <tali.perry1@gmail.com>
Subject: [PATCH v10 0/3] NPCM750: clk controller, DT and binding
Date: Sun, 25 Feb 2018 12:12:16 +0200
Message-ID: <1519553539-15899-1-git-send-email-tali.perry1@gmail.com>
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
To: brendanhiggins@google.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add Nuvoton BMC NPCM7xx clock driver.

Nuvoton BMC NPCM7xx contain integrated clock controller which
generates and supplies clock to all modules within the NPCM7xx BMC

2 ==> 10
update documentation. add external clocks as inputs to clk driver.
fix SPDX comment.

1 ==> 2
This patch includes fix request described here:
https://patchwork.kernel.org/patch/10200033/
(move fixed clocks to DT)

Signed-off-by: Tali Perry <tali.perry1@gmail.com>

Tali Perry (3):
  NPCM750: add clock controller to DT
  NPCM750: add clock tree doc and binding
  NPCM750: add clock controller driver

 .../bindings/clock/nuvoton,npcm750-clk.txt         |  100 ++
 arch/arm/boot/dts/nuvoton-npcm750.dtsi             | 1221 ++++++++++++++++++++
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-npcm7xx.c                          |  757 ++++++++++++
 include/dt-bindings/clock/nuvoton,npcm7xx-clock.h  |   44 +
 5 files changed, 2123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750.dtsi
 create mode 100644 drivers/clk/clk-npcm7xx.c
 create mode 100644 include/dt-bindings/clock/nuvoton,npcm7xx-clock.h

-- 
2.14.1
