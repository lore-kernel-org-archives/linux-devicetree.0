From: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] ARM: at91: at91sam9x5: enable ISI and ov2640 support
Date: Thu, 12 Feb 2015 16:06:22 +0800
Message-ID: <1423728386-24544-1-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series will enable ISI and ov2640 sensor support for
at91sam9g25ek board.


Josh Wu (4):
  ARM: at91: at91sam9x5/dts: add ISI dt support, include isi node,
    pinctrls
  ARM: at91: at91sam9x5ek/dts: add ov2640 support
  ARM: at91: at91sam9g25ek/dts: enable ISI and ov2640
  ARM: at91: at91_dt_defconfig: enable ISI and ov2640 support

 arch/arm/boot/dts/at91sam9g25.dtsi    |  1 +
 arch/arm/boot/dts/at91sam9g25ek.dts   | 18 +++++++++++++
 arch/arm/boot/dts/at91sam9x5_isi.dtsi | 46 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/at91sam9x5ek.dtsi   | 48 +++++++++++++++++++++++++++++++++++
 arch/arm/configs/at91_dt_defconfig    |  6 +++++
 5 files changed, 119 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
