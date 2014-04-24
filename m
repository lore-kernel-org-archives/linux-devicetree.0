From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 0/4] ARM: keystone: Use coherent higher memory address space
Date: Thu, 24 Apr 2014 11:42:18 -0400
Message-ID: <1398354142-2767-1-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some of theses have been already posted in past as part of different series.
The late code patching is already merged which means no dependency for patch 1
to be merged and the ongoing dma-ranges series makes it complete for me to
enable coherency on Keystone SOCs.

Grygorii Strashko (1):
  ARM: dts: keystone: Use dma-ranges property

Santosh Shilimkar (3):
  ARM: keystone: Switch over to coherent memory address space
  ARM: keystone: Update the dma offset for non-dt platform devices
  ARM: dts: keystone: Update USB node for dma properties

 arch/arm/boot/dts/keystone.dtsi   |    3 ++
 arch/arm/mach-keystone/keystone.c |   74 +++++++++++++++++++++++++++++++++++++
 arch/arm/mach-keystone/memory.h   |   24 ++++++++++++
 arch/arm/mach-keystone/platsmp.c  |   18 ++++++++-
 4 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/mach-keystone/memory.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
