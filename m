From: <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: [Resend PATCH v2 0/3] STM32F4 Clock binding fix & update
Date: Wed, 1 Feb 2017 14:09:53 +0100
Message-ID: <1485954596-11014-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, radoslaw.pietrzyk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gabriel.fernandez-qxv4g6HH51o@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, olivier.bideau-qxv4g6HH51o@public.gmane.org, amelie.delaunay-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>

v2:
- Only rename commit subject of first patch to avoid the error:
 Remote Server returned '<vger.kernel.org #5.7.1 SMTP;
 550 5.7.1 Content-Policy reject msg: The capital Triple-X in subject
 is way too often associated with junk email,

This patch-set includes:
 - a fix to STM32F4_X_CLOCK() macro
 - an update of missing binding definition
 - a patch to use STM32F4_X_CLOCK() macro

Gabriel Fernandez (3):
  dt-bindings: mfd: stm32f4: Fix STM32F4_X_CLOCK() macro
  dt-bindings: mfd: stm32f4: Add missing binding definition
  ARM: dts: stm32: Use clock DT binding definition on stm32f429 family

 arch/arm/boot/dts/stm32429i-eval.dts  |  2 +-
 arch/arm/boot/dts/stm32f429.dtsi      | 66 +++++++++++++++++++----------------
 include/dt-bindings/mfd/stm32f4-rcc.h | 24 +++++++++----
 3 files changed, 53 insertions(+), 39 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
