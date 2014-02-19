From: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 0/4] Add audio card DT node support for Vybird-TWR board
Date: Wed, 19 Feb 2014 15:42:27 +0800
Message-ID: <1392795751-13351-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add audio card DT node support for Vybird-TWR board.


Xiubo Li (4):
  ARM: dts: vf610: Add edma mux Tx and Rx support for SAI node.
  ARM: dts: vf610-twr: Enable SAI ALSA SoC DAI device
  ARM: dts: vf610-twr: Enable SGTL5000 codec.
  ARM: dts: vf610-twr: Add simple-card support.

 arch/arm/boot/dts/vf610-twr.dts | 71 +++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/vf610.dtsi    |  3 ++
 2 files changed, 74 insertions(+)

-- 
1.8.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
