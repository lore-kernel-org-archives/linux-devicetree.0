From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 0/1] ARM: dts: zynq: Prepare Parallella
Date: Sun, 29 Jun 2014 22:50:20 +0200
Message-ID: <1404075022-28745-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patch adds an initial device tree for the Parallella board.
UART, SD card, Ethernet are enabled.
Not yet enabled are HDMI (FPGA, ADV7513), QSPI and 2x USB.

Where I'm a bit unsure is the PHY placement; placement as subnode of th=
e=20
GEM corresponds to what was in the downstream 3.12 based device tree. I=
t=20
is a separate chip on the board though, whereas GEM is on the SoC.

Regards,
Andreas

Andreas F=C3=A4rber (1):
  ARM: dts: zynq: Add Parallella device tree

 arch/arm/boot/dts/Makefile            |  4 ++-
 arch/arm/boot/dts/zynq-parallella.dts | 63 +++++++++++++++++++++++++++=
++++++++
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/zynq-parallella.dts

--=20
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
