From: bd-phuc-HEF513clHfp3+QwDJ9on6Q@public.gmane.org
Subject: [PATCH 0/8] clocksource: sh_cmt: Add R-car Gen3 CMT0/1 support
Date: Fri,  9 Sep 2016 20:43:06 +0900
Message-ID: <1473421394-9745-1-git-send-email-bd-phuc@jinso.co.jp>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, ryusuke.sakato.bx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, h-inayoshi-HEF513clHfp3+QwDJ9on6Q@public.gmane.org, cm-hiep-HEF513clHfp3+QwDJ9on6Q@public.gmane.org, nv-dung-HEF513clHfp3+QwDJ9on6Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Bui Duc Phuc <bd-phuc-HEF513clHfp3+QwDJ9on6Q@public.gmane.org>

Hi,

These are my first patches which will be added CMT driver for support 
R-car Gen3 series (r8a7795 and r8a7796).
Please consider these patches.

Best regards.

Bui Duc Phuc (8):
  devicetree: binding: R-car Gen3 CMT0 and CMT1 bindings
  ARM64: dts: r8a7795: Add CMT device to DT
  ARM64: dts: r8a7796: Add CMT device to DT
  clk: renesas: r8a7795: Add CMT clocks
  clk: renesas: r8a7796: Add CMT clocks
  clocksource: sh_cmt: Support separate R-car Gen3 CMT0/1
  clocksource: Kconfig: Modify CMT config support 64bit
  ARM64: defconfig: Enable SH_TIMER_CMT config option

 .../devicetree/bindings/timer/renesas,cmt.txt      |  2 ++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 30 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 30 ++++++++++++++++++++++
 arch/arm64/configs/defconfig                       |  1 +
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |  4 +++
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |  4 +++
 drivers/clocksource/Kconfig                        |  2 +-
 drivers/clocksource/sh_cmt.c                       | 21 +++++++++++++--
 8 files changed, 91 insertions(+), 3 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
