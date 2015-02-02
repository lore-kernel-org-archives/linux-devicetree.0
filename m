From: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] ARM: at91: sama5d4ek: enable audio support
Date: Mon, 2 Feb 2015 14:51:43 +0800
Message-ID: <1422859907-14881-1-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set enable audio support on sama5d4ek.
It depends the patch [1] (ASoC: atmel-pcm-dma: won't check direction
when configure dma)
[1] https://patchwork.kernel.org/patch/5759441/


Bo Shen (4):
  ARM: at91: dt: sama5d4: add ssc nodes
  ARM: at91: dt: sama5d4ek: enable ssc0
  ARM: at91: dt: sama5d4ek: add and enable wm8904
  ARM: at91: dt: sama5d4ek: enable audio

 arch/arm/boot/dts/at91-sama5d4ek.dts | 31 ++++++++++++++++
 arch/arm/boot/dts/sama5d4.dtsi       | 70 ++++++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)

-- 
2.3.0.rc0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
