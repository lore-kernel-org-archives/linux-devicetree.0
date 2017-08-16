From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv2 0/3] arm64 xilinx zynqmp firmware interface
Date: Wed, 16 Aug 2017 14:24:55 +0200
Message-ID: <cover.1502886277.git.michal.simek@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: edgar.iglesias-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kevin Brodsky <kevin.brodsky-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

xilinx is using this interface for very long time and we can't merge our
driver changes to Linux because of missing communication layer with
firmware. This interface was developed before scpi and scmi was
available. In connection to power management scpi and scmi are missing
pieces which we already use. There is a separate discussion how to
extend scmi to support all our use cases.
This simply patch is not adding any power management features but only
adding minimum functionality which are needed for drivers.

Edgar's comment on having HVC:
"We have patches for Xen that implement a power-management mediator.
That implementation handles PM calls over both SMC and HVC insns.
Patches are on the Xen mailing list.

Other hypervisors may work differently.

I think we should support both but I don't have a strong opinion on
it."

Thanks,
Michal

Changes in v2:
- Move to bindings/firmware and also add it to firmware node
  Reported-by Rob
- Add zynqmp firmware node to firmware node
- Change commit message
- Make zynqmp_pm_ret_code, invoke_pm_fn static
  Reported by Arnd
- Remove pm_api_version function - no need for interface
- Move driver to drivers/firmware/
  Reported by Arnd and Rob

Michal Simek (1):
  soc: xilinx: zynqmp: Add firmware interface

Soren Brinkmann (2):
  dt: xilinx: zynqmp: Add bindings for PM firmware
  arm64: zynqmp: dt: Add PM firmware node

 .../bindings/firmware/xlnx,zynqmp-pm.txt           |  22 ++
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi             |   9 +
 drivers/firmware/Kconfig                           |   1 +
 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/xilinx/Kconfig                    |   6 +
 drivers/firmware/xilinx/Makefile                   |   1 +
 drivers/firmware/xilinx/zynqmp/firmware.c          | 382 +++++++++++++++++++++
 include/linux/firmware/xilinx/zynqmp/firmware.h    | 232 +++++++++++++
 8 files changed, 654 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/xlnx,zynqmp-pm.txt
 create mode 100644 drivers/firmware/xilinx/Kconfig
 create mode 100644 drivers/firmware/xilinx/Makefile
 create mode 100644 drivers/firmware/xilinx/zynqmp/firmware.c
 create mode 100644 include/linux/firmware/xilinx/zynqmp/firmware.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
