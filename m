From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 0/3] arm64: dts: renesas: salvator-x(s)/ulcb: Add PMIC DDR
 Backup Power config
Date: Thu,  3 May 2018 14:30:48 +0200
Message-ID: <1525350651-12471-1-git-send-email-geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus,

The ROHM BD9571MWV PMIC on the Renesas Salvator-X(S) and ULCB
development boards supports DDR Backup Power, which means that the DDR
power rails can be kept powered while the main SoC is powered down.

For this to function correctly, the DDR Backup Power configuration
must be described in DT, which is the topic of this series:
  - The first patch adds the missing device node for the BD9571 PMIC on
    the ULCB boards,
  - The last two patches add DDR Backup Mode configuration for
    Salvator-X(S) and ULCB.

Changes compared to v3:
  - Use a hex value for the bit mask.

Changes compared to v2:
  - Add support for ULCB,
  - Add "rohm,rstbmode-level" for Salvator-X(S).

The relevant DT binding updates have been accepted in
regulator/for-next, as well as driver support for DDR Backup Mode on
systems with momentary power switches ("rohm,rstbmode-pulse"), like
ULCB.  Combined with this series, the PMIC on ULCB will be configured
automatically during system suspend.

Note that driver support for systems with toggle power swiches
("rohm,rstbmode-level"), like Salvator-X(S), is still under review
(https://lkml.org/lkml/2018/3/14/324).  But as DT describes hardware,
not software limitations, this series is safe to apply.

This has been tested on M3ULCB (thanks Jacopo!), and on Salvator-X(S).
All support has been part of renesas-drivers since a few releases.

Thanks for applying!

Geert Uytterhoeven (3):
  arm64: dts: renesas: ulcb: Add BD9571 PMIC
  arm64: dts: renesas: salvator-common: Add PMIC DDR Backup Power config
  arm64: dts: renesas: ulcb: Add PMIC DDR Backup Power config

 arch/arm64/boot/dts/renesas/salvator-common.dtsi |  2 ++
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 31 ++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
