From: Tali Perry <tali.perry1@gmail.com>
Subject: [PATCH v2 0/1] clk: npcm: move fixed clocks to DT
Date: Thu, 15 Feb 2018 15:41:54 +0200
Message-ID: <1518702115-22990-1-git-send-email-tali.perry1@gmail.com>
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
To: brendanhiggins@google.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tali Perry <tali.perry1@gmail.com>
List-Id: devicetree@vger.kernel.org

Fixed clocks defined at driver/clk/clk-npcm7xx.c moved to DT. 

1 ==> 2
This patch includes fix request described here:
https://patchwork.kernel.org/patch/10200033/
(move fixed clocks to DT)

Signed-off-by: Tali Perry <tali.perry1@gmail.com>

Tali Perry (1):
  npcm750: add fixed clocks (moved from drivers/clk/clk-npcm7xx.c)

 arch/arm/boot/dts/nuvoton-npcm750.dtsi | 1223 ++++++++++++++++++++++++++++++++
 1 file changed, 1223 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750.dtsi

-- 
2.14.1
