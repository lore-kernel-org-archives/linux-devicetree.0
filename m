From: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 0/3] ARM: dts: stm32: Remove rdinit from bootargs
Date: Mon, 17 Jul 2017 10:36:02 +0200
Message-ID: <1500280565-26049-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series remove rdinit from bootargs on stm32f4 boards (429-eval,
429-disco, 469-disco). Indeed, rootfs is independent from boards.
Furthermore it will align stm32 F4 devicetree on stm32 F7/H7 one.

Regards
Alex

Alexandre TORGUE (3):
  ARM: dts: stm32: Remove rdinit from bootargs on stm32f469-disco
  ARM: dts: stm32: Remove rdinit from bootargs on stm32f429i-eval
  ARM: dts: stm32: Remove rdinit from bootargs on stm32f429-disco

 arch/arm/boot/dts/stm32429i-eval.dts  | 2 +-
 arch/arm/boot/dts/stm32f429-disco.dts | 2 +-
 arch/arm/boot/dts/stm32f469-disco.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
