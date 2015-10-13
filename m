From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/4] arm64: Hi6220: enable CPU idle states
Date: Tue, 13 Oct 2015 08:58:12 +0800
Message-ID: <1444697896-4323-1-git-send-email-leo.yan@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Yiping Xu <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series is to enable CPU idle states for Hi6220.

Hi6220 uses PSCIv0.2 compliance interface, so directly use ARM's generic
CPUIdle driver. Patch 1 is to reserve memory regions so make sure MCU can
work well to handle power controlling; Patch 2/3 enable sp804 timer as
broadcast timer during idle states; Patch 4 registers CPU power down state
and cluster power down state.

Changes from v1:
* According to Sudeep's review, fix binding for idle-states
* According to Rob's review, due timers share same clock source with apb
  clock, so just only pass one clock phandle


Leo Yan (4):
  arm64: dts: Reserve memory regions for hi6220
  arm64: Kconfig: select sp804 timer for ARCH_HISI
  arm64: dts: add sp804 timer node for Hi6220
  arm64: dts: enable idle states for Hi6220

 arch/arm64/Kconfig.platforms                   |  1 +
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 16 ++++++++---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi      | 40 ++++++++++++++++++++++++++
 3 files changed, 53 insertions(+), 4 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
