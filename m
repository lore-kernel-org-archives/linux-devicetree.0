From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: r8a77965: salvator-x(s): Enable s2ram and PMIC
Date: Mon, 26 Feb 2018 16:42:21 +0100
Message-ID: <1519659743-27027-1-git-send-email-geert+renesas@glider.be>
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
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus,

This patch populates the placeholders in the R-Car M3-N DTS file for the
IIC Bus Interface for DVFS (IIC for DVFS) and Interrupt Controller for
External Devices (INTC-EX) device nodes.

After applying the first patch, you can start using s2ram (PSCI
suspend), like on other Salvator-X(S) boards
(https://elinux.org/R-Car/Boards/Salvator-XS#PSCI_System_Suspend).

The second patch enables dependencies for the BD9571MWV PMIC device,
which is described in salvator-common.dtsi. Note that operation still
depends on "[PATCH] pinctrl: sh-pfc: r8a77965: Add support for INTC-EX
IRQ pins".

Thanks!

Geert Uytterhoeven (2):
  arm64: dts: r8a77965: Add IIC-DVFS device node
  arm64: dts: r8a77965: Add INTC-EX device node

 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
