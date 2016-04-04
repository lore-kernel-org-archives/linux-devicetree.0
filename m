From: Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 0/2] ARM: keystone: Enable CPU hotplug
Date: Mon, 4 Apr 2016 23:59:01 +0530
Message-ID: <1459794543-4822-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, vitalya-l0cyMroinI0@public.gmane.org, nm-l0cyMroinI0@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org, j-keerthy-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Series enables CPU hotplug for K2HK. CPU Hotplug tested on
K2HK-EVM.

It is on top of 4.6-rc2.

Keerthy (2):
  keystone: dts: add psci command definition
  ARM: configs: keystone: Add CPU Hotplug related options

 arch/arm/boot/dts/keystone.dtsi     | 8 ++++++++
 arch/arm/configs/keystone_defconfig | 2 ++
 2 files changed, 10 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
