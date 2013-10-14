From: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/5] ARM:at91:enable sound on at91sam9n12ek board
Date: Mon, 14 Oct 2013 13:38:28 +0800
Message-ID: <1381729113-29714-1-git-send-email-voice.shen@atmel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series enable sound on at91sam9n12ek board with wm8904 codec


Bo Shen (5):
  ARM: at91: add at91sam9n12 ssc clock in look up table
  ARM: at91: add ssc dma parameter for at91sam9n12
  ARM: at91: enable wm8904 on at91sam9n12ek board
  ARM: at91: enable ssc on at91sam9n12ek board
  ARM: at91: add sound support on at91sam9n12ek board

 arch/arm/boot/dts/at91sam9n12.dtsi  |    3 +++
 arch/arm/boot/dts/at91sam9n12ek.dts |   34 ++++++++++++++++++++++++++++++++++
 arch/arm/mach-at91/at91sam9n12.c    |    1 +
 3 files changed, 38 insertions(+)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
