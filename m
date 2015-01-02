From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] ARM: mediatek: Enable uart for mt6589
Date: Fri,  2 Jan 2015 19:48:03 +0100
Message-ID: <1420224485-11043-1-git-send-email-matthias.bgg@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series adds uart ports for the mt6589 SoC from Mediatek.
It also enables the uart port for the mt6589 based Aquaris5 mobile phone.

This series is based on 3.19-rc1 and assumes that sysirq patch from Yingjoe Chen is added to the SoC [0].

[0] https://lkml.org/lkml/2014/11/25/132

Matthias Brugger (2):
  ARM: mediatek: dts: Add uart to mt6589
  ARM: mediatek: dts: Add uart to Aquaris5

 arch/arm/boot/dts/mt6589-aquaris5.dts |  8 +++++++-
 arch/arm/boot/dts/mt6589.dtsi         | 38 +++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
