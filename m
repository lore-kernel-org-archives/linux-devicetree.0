From: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] ARM: at91: dt: at91sam9n12ek: enable udp device
Date: Tue, 10 Feb 2015 09:55:33 +0800
Message-ID: <1423533335-25135-1-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
Cc: alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series enable usb device support on at91sam9n12ek board.

Changes in v2:
  - Base on next-20150209 (so, remove the modification of udc driver).
  - Add pinctrl for usb1 vbus sense.

Bo Shen (2):
  ARM: at91: dt: at91sam9n12: add udp device node
  ARM: at91: dt: at91sam9n12ek: enable udp

 arch/arm/boot/dts/at91sam9n12.dtsi  |  9 +++++++++
 arch/arm/boot/dts/at91sam9n12ek.dts | 14 ++++++++++++++
 2 files changed, 23 insertions(+)

-- 
2.3.0.rc0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
