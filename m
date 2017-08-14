From: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/5] Updates to arc clock tree managment
Date: Mon, 14 Aug 2017 19:12:08 +0300
Message-ID: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Set and print cpu frequency at boot time generic way.
* Get rid of platform specific cpu clock configuration for AXS103 in
arch/arc/plat-axs10x/axs10x.c
* Add core pll node to AXS103 device tree to manage cpu frequency
* Refactor clock managment in arch/arc/plat-axs10x/axs10x.c

Eugeniy Paltsev (5):
  ARC: set and print cpu frequency at boot time
  ARC: AXS103: Get rid of platform specific cpu clock configuration
  ARC: AXS103: DTS: Add core pll node to manage cpu frequency
  ARC: AXS103: DTS: Set cpu frequency explicitly via dts
  ARC: AXS103: use cpu-freq param instead of /cpu_card/core_clk

 arch/arc/boot/dts/axc003.dtsi     | 24 +++++++++-
 arch/arc/boot/dts/axc003_idu.dtsi | 42 +++++++++++++++++-
 arch/arc/kernel/setup.c           | 49 +++++++++++++++++++++
 arch/arc/plat-axs10x/axs10x.c     | 92 ++-------------------------------------
 4 files changed, 115 insertions(+), 92 deletions(-)

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
