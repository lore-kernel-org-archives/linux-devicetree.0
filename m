From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] nvmem: add lpc18xx OTP memory driver
Date: Tue, 13 Sep 2016 18:12:38 +0200
Message-ID: <20160913161241.22492-1-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set adds a simple read-only nvmem driver for the
internal OTP (One Time Programmable) memory found on all
LPC18xx/43xx devices. Write support is coming later when
the required firmware driver for the boot ROM goes upstream.

Note that dtsi patch is only included for reference. I intend
to take it myself through the lpc18xx tree once the bindings
are accepted and the driver goes upstream.


Joachim Eastwood (3):
  nvmem: add NXP LPC18xx OTP driver
  nvmem: dt: document lpc1850 OTP binding
  ARM: dts: lpc18xx: add otp node

 .../devicetree/bindings/nvmem/lpc1850-otp.txt      |  20 ++++
 arch/arm/boot/dts/lpc18xx.dtsi                     |  12 ++
 drivers/nvmem/Kconfig                              |  10 ++
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/lpc18xx_otp.c                        | 123 +++++++++++++++++++++
 5 files changed, 167 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/lpc1850-otp.txt
 create mode 100644 drivers/nvmem/lpc18xx_otp.c

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
