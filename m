From: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: [PATCH 0/3] getting more output from orion_wdt
Date: Wed, 11 Oct 2017 15:29:55 +1300
Message-ID: <20171011022958.31268-1-chris.packham@alliedtelesis.co.nz>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On the Armada-38x platforms (and probably 37x/XP) the current behaviour of on
exipry of the watchdog is a silent reboot of the CPU. The Armada-38x does have
an interrupt which if we don't enable the Global WD bit in the RSTOUTn register
gives us a chance to generate some panic messages that may help track down the
cause of the watchdog timeout.

I've been a bit bold and enabled this in the generic armada-38x.dtsi file. I'd
be happy to leave that part out and have the interrupt enabled on a
board-by-board basis if there are objections.

Chris Packham (3):
  watchdog: orion: fix typo
  watchdog: orion: don't enable rstout if an interrupt is configured
  ARM: mvebu: dts: connect interrupt for WD on armada-38x

 arch/arm/boot/dts/armada-38x.dtsi |  1 +
 drivers/watchdog/orion_wdt.c      | 27 ++++++++++++++++++---------
 2 files changed, 19 insertions(+), 9 deletions(-)

-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
