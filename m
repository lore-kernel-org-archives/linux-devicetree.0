From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/4] ARM: at91: move sam9n12 SoC and boards to the CCF
Date: Mon, 12 May 2014 18:26:26 +0200
Message-ID: <1399911990-5086-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This series moves the at91sam9n12 SoC and the at91sam9n12-ek board to
the Common Clock Framework.

It depends on these series: [1], [2].

Best Regards,

Boris

[1] http://lkml.iu.edu/hypermail/linux/kernel/1403.3/00074.html
[2] http://comments.gmane.org/gmane.linux.kernel.samsung-soc/27632

Boris BREZILLON (4):
  ARM: at91: prepare common clk transition for sam9n12 SoC
  ARM: at91/dt: define sam9n12 clocks
  ARM: at91/dt: define sam9n12ek crystal frequencies
  ARM: at91: move sam9n12 SoC to the CCF

 arch/arm/boot/dts/at91sam9n12.dtsi  | 348 +++++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/at91sam9n12ek.dts |   8 +
 arch/arm/mach-at91/Kconfig          |   1 -
 arch/arm/mach-at91/at91sam9n12.c    |   6 +-
 4 files changed, 359 insertions(+), 4 deletions(-)

-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
