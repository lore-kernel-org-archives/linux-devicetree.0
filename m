From: Michel Pollet <michel.pollet@bp.renesas.com>
Subject: [RFC 0/3] Renesas RZ/N1D SMP enabler
Date: Mon, 16 Apr 2018 10:34:55 +0100
Message-ID: <1523871304-48517-1-git-send-email-michel.pollet@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>
Cc: phil.edworthy@renesas.com, buserror+upstream@gmail.com, Michel Pollet <michel.pollet@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Rajendra Nayak <rnayak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>, Juri Lelli <juri.lelli@arm.com>, Frank Rowand <frank.rowand@sony.com>, Carlo Caione <carlo@endlessm.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

*Warning -- this requires the base RZ/N1 support patches already posted *

This is a tentative patch series for enabling the second CA7 of the RZ/N1D.
It's based on a spin_table method, and it reuses the same binding property
as that driver.

One question is: Do i have to document it separately, or is it sufficiently
clear?

Michel Pollet (3):
  dt-bindings: cpu: Add Renesas RZ/N1D SMP enable method.
  ARM: dts: Renesas RZ/N1D SMP enable method
  arm: shmobile: Add the RZ/N1D SMP enabler driver.

 Documentation/devicetree/bindings/arm/cpus.txt |  1 +
 arch/arm/boot/dts/r9a06g032.dtsi               |  2 +
 arch/arm/mach-shmobile/Makefile                |  1 +
 arch/arm/mach-shmobile/smp-r9a06g032.c         | 87 ++++++++++++++++++++++++++
 4 files changed, 91 insertions(+)
 create mode 100644 arch/arm/mach-shmobile/smp-r9a06g032.c

-- 
2.7.4
