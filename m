From: Louis Yu <louis.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/2] Add Mediatek MT2701 SMP support
Date: Thu, 7 Jan 2016 20:09:42 +0800
Message-ID: <1452168584-25394-1-git-send-email-louis.yu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, louis.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset is based on 4.4-rc8 and [1], and contains smp support
for Mediatek MT2701. MT2701 contains 4 CA7 cores.

This patchset adds related SMP support for Mediatek MT2701.

[1] https://patchwork.kernel.org/patch/7248471/

Louis Yu (2):
  ARM: mediatek: add mt2701 smp bringup code
  ARM: dts: mt2701: enable basic SMP bringup for mt2701

 arch/arm/boot/dts/mt2701.dtsi    |   12 ++++++++++++
 arch/arm/mach-mediatek/platsmp.c |    1 +
 2 files changed, 13 insertions(+)

--
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
