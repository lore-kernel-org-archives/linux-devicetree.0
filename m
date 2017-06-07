From: <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 0/3] Add stm32h743i-disco board
Date: Wed, 7 Jun 2017 09:16:20 +0200
Message-ID: <1496819783-5113-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>

This series adds basic support for the stm32h743i discovery board 
based on stm32h7 MCU.

v2:	_ update commit messages header with format "ARM: dts: stm32: ...."

Patrice Chotard (3):
  ARM: dts: stm32: Add usart2_pins on stm32h743.
  ARM: dts: stm32: Add usart2 support on stm32h743.
  ARM: dts: stm32: Add stm32h743i-disco board

 arch/arm/boot/dts/Makefile               |  3 +-
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi | 13 ++++++
 arch/arm/boot/dts/stm32h743.dtsi         |  8 ++++
 arch/arm/boot/dts/stm32h743i-disco.dts   | 73 ++++++++++++++++++++++++++++++++
 4 files changed, 96 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/stm32h743i-disco.dts

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
