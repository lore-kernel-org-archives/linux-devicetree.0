From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/9] soc: brcmstb: biuctrl updates for 64-bit chips
Date: Tue, 19 Dec 2017 11:22:38 -0800
Message-ID: <20171219192247.29799-1-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This patch series updates the Broadcom STB Bus Interface Unit controller to
support newer chips such as 7260, 7268, 7271 and 7278. These chips require
additional tuning in order to provide the expected bus throughput.

In the process, we need to re-organize the common.c file a little bit in order
to extract the family and product identifiers a little earlier.

Finally, by moving the biuctrl initialization an early_initcall level, we can
remove some code from the ARM-32bit machine descriptor file.

Provided that we are happy with these changes, I would route them through my
drivers/next branch and a subsequent Broadcom ARM SoC pull request.

Thank you

Changes in v2:

- collect Rob's acked-by on the first patch
- fixed the binding as suggested by Rob

Florian Fainelli (9):
  dt-bindings: arm: Add entry for Broadcom Brahma-B53
  dt-bindings: arm: brcmstb: Correct BIUCTRL node documentation
  soc: brcmstb: Make CPU credit offset more parameterized
  soc: brcmstb: Correct CPU_CREDIT_REG offset for Brahma-B53 CPUs
  soc: brcmstb: biuctrl: Prepare for saving/restoring other registers
  soc: brcmstb: biuctrl: Wire-up new registers
  soc: brcmstb: biuctrl: Fine tune B53 MCP interface settings
  soc: brcmstb: Split initialization
  soc: brcmstb: biuctrl: Move to early_initcall

 .../devicetree/bindings/arm/bcm/brcm,brcmstb.txt   |  22 +--
 Documentation/devicetree/bindings/arm/cpus.txt     |   1 +
 arch/arm/mach-bcm/brcmstb.c                        |   2 -
 drivers/soc/bcm/brcmstb/biuctrl.c                  | 176 +++++++++++++++++++--
 drivers/soc/bcm/brcmstb/common.c                   |  27 ++--
 include/linux/soc/brcmstb/brcmstb.h                |   6 -
 6 files changed, 186 insertions(+), 48 deletions(-)

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
