From: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 0/2] ARCH_VULCAN to ARCH_THUNDER2 transition
Date: Sun, 12 Mar 2017 10:03:33 +0000
Message-ID: <1489313015-4783-1-git-send-email-jnair@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Here are the updated versions of two patches of the series that did
not get into 4.11.  The patches are move the device trees to their
new location and to document the new cpu and core names.

JC.

Jayachandran C (2):
  dt-bindings: arm64 ARCH_THUNDER2 platform documentation
  arm64: dts: move from ARCH_VULCAN to ARCH_THUNDER2

 .../devicetree/bindings/arm/cavium-thunder2.txt    |   8 ++
 Documentation/devicetree/bindings/arm/cpus.txt     |   1 +
 arch/arm64/boot/dts/broadcom/Makefile              |   1 -
 arch/arm64/boot/dts/broadcom/vulcan-eval.dts       |  33 -----
 arch/arm64/boot/dts/broadcom/vulcan.dtsi           | 147 ---------------------
 arch/arm64/boot/dts/cavium/Makefile                |   1 +
 arch/arm64/boot/dts/cavium/thunder2-99xx.dts       |  33 +++++
 arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi      | 147 +++++++++++++++++++++
 8 files changed, 190 insertions(+), 181 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/cavium-thunder2.txt
 delete mode 100644 arch/arm64/boot/dts/broadcom/vulcan-eval.dts
 delete mode 100644 arch/arm64/boot/dts/broadcom/vulcan.dtsi
 create mode 100644 arch/arm64/boot/dts/cavium/thunder2-99xx.dts
 create mode 100644 arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
