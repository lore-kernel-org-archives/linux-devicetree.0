From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 0/2] Fixes for STi SOCs
Date: Tue, 17 Sep 2013 10:26:43 +0100
Message-ID: <1379410003-9911-1-git-send-email-srinivas.kandagatla@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>

Hi Arnd/Olof, 

These two are very minor fixes for STi SOCs.
One of the fix is a typo and other is to add two new options to
multi_v7_defconfig to get STi SOC based boards boot with nfs root with serial
console.

These patches are based on v3.12-rc1.

Thanks,
srini

Srinivas Kandagatla (2):
  ARM: STi: OF: Fix a typo in pincfg header
  ARM: multi_v7_defconfig: Fix STi support

 arch/arm/boot/dts/st-pincfg.h       |    2 +-
 arch/arm/configs/multi_v7_defconfig |    3 +++
 2 files changed, 4 insertions(+), 1 deletions(-)

-- 
1.7.6.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
