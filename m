From: =?UTF-8?q?Antoine=20T=C3=A9nart?=
	<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/5] ARM: Berlin: SMP support
Date: Mon,  2 Jun 2014 11:21:01 +0200
Message-ID: <1401700866-24804-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds the SMP support for Marvell Berlin BG2 and BG2Q.

This implementation takes advantage of the reset exception register and
the software reset address register to make the CPUs execute the Berlin
secondary startup when being being reseted. This has the advantage of
not using the pen lock mechanism.

Antoine T=C3=A9nart (5):
  ARM: berlin: add SMP support
  Documentation: bindings: document the Marvell Berlin enable-method
  Documentation: bindings: add the Berlin CPU control doc
  ARM: dts: berlin: add SMP related nodes and properties for BG2
  ARM: dts: berlin: add SMP related nodes and properties for BG2Q

 Documentation/devicetree/bindings/arm/cpus.txt     |  1 +
 .../devicetree/bindings/arm/marvell,berlin.txt     | 16 ++++
 arch/arm/boot/dts/berlin2.dtsi                     | 11 +++
 arch/arm/boot/dts/berlin2q.dtsi                    | 11 +++
 arch/arm/mach-berlin/Kconfig                       |  3 +
 arch/arm/mach-berlin/Makefile                      |  3 +-
 arch/arm/mach-berlin/headsmp.S                     | 30 +++++++
 arch/arm/mach-berlin/platsmp.c                     | 99 ++++++++++++++=
++++++++
 8 files changed, 173 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/mach-berlin/headsmp.S
 create mode 100644 arch/arm/mach-berlin/platsmp.c

--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
