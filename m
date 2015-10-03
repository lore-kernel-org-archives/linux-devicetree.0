From: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
Subject: [PATCH V2 0/3] ARM: dts/keystone: Introduce SoC specific compatible matches
Date: Sat, 3 Oct 2015 18:38:47 -0500
Message-ID: <1443915530-15035-1-git-send-email-nm@ti.com>
References: <1442938118-4718-1-git-send-email-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442938118-4718-1-git-send-email-nm-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Round 2 of the series with updated patch #1. This series introduces
SoC specific dt compatible property to allow for future SoCs to be
handled and for userspace applications that can introduce features
based on SoC they are functioning on.

V1 of the series: http://marc.info/?l=devicetree&m=144309031109988&w=2
V2 of the series has the following changes:
	- updated commit message in patch #1
	- picked up acked-by for patch #1

Series based on v4.3-rc1

Tested on v4.3-rc3: http://pastebin.ubuntu.com/12659000/

Nishanth Menon (3):
  Documentation: dt: keystone: provide SoC specific compatible flags
  ARM: keystone: Update compatible to have SoC specific matches
  ARM: dts: keystone: Update SoC specific compatible flags

 .../devicetree/bindings/arm/keystone/keystone.txt    | 20 +++++++++++++++++---
 arch/arm/boot/dts/k2e-evm.dts                        |  2 +-
 arch/arm/boot/dts/k2e.dtsi                           |  3 +++
 arch/arm/boot/dts/k2hk-evm.dts                       |  2 +-
 arch/arm/boot/dts/k2hk.dtsi                          |  3 +++
 arch/arm/boot/dts/k2l-evm.dts                        |  2 +-
 arch/arm/boot/dts/k2l.dtsi                           |  3 +++
 arch/arm/boot/dts/keystone.dtsi                      |  1 +
 arch/arm/mach-keystone/keystone.c                    |  3 +++
 9 files changed, 33 insertions(+), 6 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
