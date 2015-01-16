From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/3] pinctrl: at91: allow disabled gpio controllers
Date: Fri, 16 Jan 2015 16:31:04 +0100
Message-ID: <1421422267-2934-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Changes from v2:
- I have taken Jean-Christophe patch and squash some parts of my previous
patch since probe fails

Jean-Christophe PLAGNIOL-VILLARD (1):
  pinctrl: at91: allow to have disabled gpio bank

Ludovic Desroches (2):
  ARM: at91/dt: sama5d4: add pioD controller
  MAINTAINERS: add maintainer for pinctrl-at91

 MAINTAINERS                    |   1 +
 arch/arm/boot/dts/sama5d4.dtsi |  13 +++++
 drivers/pinctrl/pinctrl-at91.c | 108 +++++++++++++++++++++--------------------
 3 files changed, 69 insertions(+), 53 deletions(-)

-- 
2.2.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
