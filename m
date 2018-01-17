From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/6] Hi,
Date: Wed, 17 Jan 2018 16:29:44 +0100
Message-ID: <cover.1516202975.git.michal.simek@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TaqPxH82wqD4g@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, VNSL Durga <vnsl.durga.challa-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, P L Sai Krishna <lakshmi.sai.krishna.potthuri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Kedareswara rao Appana <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stefan Krsmanovic <stefan.krsmanovic-XdEHnvbJQ9jQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Naga Sureshkumar Relli <naga.sureshkumar.relli-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Anurag Kumar Vulisha <anurag.kumar.vulisha-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alistair Francis <alistair.francis-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Edgar E.
List-Id: devicetree@vger.kernel.org


this patchset is adding minor dt pieces for ep108.
Also adding SPDX headers, fixing minor coding style issue and extending
gem compatible string for all boards.
The next patchset will add much more zynqmp based board.

Thanks,
Michal



Anurag Kumar Vulisha (1):
  arm64: zynqmp: Added OOB timing settings in zynqmp-ep108.dts

Michal Simek (4):
  arm64: zynqmp: Use zynqmp specific compatible string for macb
  arm64: zynqmp: Fix alignment in dts files
  arm64: zynqmp: Add SPDX license identifier
  arm64: zynqmp: Add missing aliases for ep108

P L Sai Krishna (1):
  arm64: zynqmp: Add 8-bit bus width property for ep108

 arch/arm64/boot/dts/xilinx/Makefile              |  1 +
 arch/arm64/boot/dts/xilinx/zynqmp-ep108-clk.dtsi |  1 +
 arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts      | 18 +++++++++++++++++-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi           | 17 +++++++++--------
 4 files changed, 28 insertions(+), 9 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
