From: "Wei.Xu" <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH 0/5] arm64: dts: hisi: add NIC, RoCE and SAS support for hip07
Date: Fri, 7 Apr 2017 10:07:51 +0800
Message-ID: <1491530876-109791-1-git-send-email-xuwei5@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liudongdong3-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, yisen.zhuang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, salil.mehta-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, majun258-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yimin-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, chenxiang66-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, tanxiaofei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, lipeng321-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, yankejian-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, huangdaode-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, charles.chenxin-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, shameerali.kolothum.thodi-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series adds Mbigen, NIC, RoCE and SAS nodes for the hip07
SoC and enables the NIC, RoCE and SAS on the hip07 d05 board.

Wei Xu (5):
  arm64: dts: hisi: add mbigen nodes for the hip07 SoC
  arm64: dts: hisi: add network related nodes for the hip07 SoC
  arm64: dts: hisi: add RoCE nodes for the hip07 SoC
  arm64: dts: hisi: add SAS nodes for the hip07 SoC
  arm64: dts: hisi: enalbe the NIC and SAS for the hip07-d05 board

 arch/arm64/boot/dts/hisilicon/hip07-d05.dts |  24 ++
 arch/arm64/boot/dts/hisilicon/hip07.dtsi    | 479 ++++++++++++++++++++++++++++
 2 files changed, 503 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
