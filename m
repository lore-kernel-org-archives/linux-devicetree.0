From: Tali Perry <tali.perry1@gmail.com>
Subject: [PATCH v2 0/1] clk: npcm: add NPCM7xx clock driver
Date: Thu, 15 Feb 2018 15:30:53 +0200
Message-ID: <1518701454-22697-1-git-send-email-tali.perry1@gmail.com>
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
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tali Perry <tali.perry1@gmail.com>
List-Id: devicetree@vger.kernel.org

Add Nuvoton BMC NPCM7xx clock driver.

Nuvoton BMC NPCM7xx contain integrated clock controller which
generates and supplies clock to all modules within the NPCM7xx BMC

1 ==> 2
This patch includes fix request described here:
https://patchwork.kernel.org/patch/10200033/
(move fixed clocks to DT)

Signed-off-by: Tali Perry <tali.perry1@gmail.com>

Tali Perry (1):
  clk: npcm7xx: add clock controller. fixed clock at DT

 drivers/clk/Makefile      |   1 +
 drivers/clk/clk-npcm7xx.c | 759 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 760 insertions(+)
 create mode 100644 drivers/clk/clk-npcm7xx.c

-- 
2.14.1
