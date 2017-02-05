From: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/5] Add Cavium ARCH_THUNDER2 platform
Date: Sun, 5 Feb 2017 00:57:01 +0000
Message-ID: <1486256226-43889-1-git-send-email-jnair@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Here's the updated patchset, please let me know if thereare any
comments.  If a pull request is needed(with a public git tree), I
can set one up on github.

This patchset adds support for the new ThunderX2 CN99XX processor
family.

Changes are to add: the config option, the required device tree files,
the device tree bindings documentation and the defconfig entry.

Changes from v1 -> v2:
* split Kconfig.platforms changes and device tree changes
* Added MAINTAINERS entry

JC.

Jayachandran C (5):
  arm64: add THUNDER2 processor family
  MAINTAINERS: Add Cavium ThunderX2 entry
  arm64: dts: add device trees for ARCH_THUNDER2
  dt-bindings: arm64 ARCH_THUNDER2 platform documentation
  arm64: add ARCH_THUNDER2 to defconfig

 .../devicetree/bindings/arm/cavium-thunder2.txt    |   5 +
 Documentation/devicetree/bindings/arm/cpus.txt     |   1 +
 MAINTAINERS                                        |   7 +
 arch/arm64/Kconfig.platforms                       |   7 +
 arch/arm64/boot/dts/cavium/Makefile                |   1 +
 arch/arm64/boot/dts/cavium/thunder-99xx.dts        |  34 +++++
 arch/arm64/boot/dts/cavium/thunder-99xx.dtsi       | 147 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 8 files changed, 203 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cavium-thunder2.txt
 create mode 100644 arch/arm64/boot/dts/cavium/thunder-99xx.dts
 create mode 100644 arch/arm64/boot/dts/cavium/thunder-99xx.dtsi

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
