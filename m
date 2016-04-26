From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/7] ARM: dts: lpc32xx: nonfunctional updates to ea3250 and phy3250 dts
Date: Wed, 27 Apr 2016 00:10:27 +0300
Message-ID: <1461705034-355-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The change updates DTS files of PHY3250 and EA3250 boards powered by
NXP LPC3250 SoC:
* flatten board DTS files by exploiting device node labels,
* add 'partitions' device node for MTD OF,
* correct Atmel vendor prefix,
* rename board DTS files by adding SoC name prefix.

The change is wanted to have to prevent similar issues on copy-paste
in case if more DTS files for LPC32xx boards are submitted.

No functional changes are intended.

Changes from v1 to v2:
* on move of NAND partitions to a 'partitions' subnode added missing
  'compatible = "fixed-partitions";' properties,
* since file renaming closes two subseries of changes, rebased the
  rest on top the changes above,
* added Acked-by tag to the changes acknowledged by Sylvain.

Thanks to Sylvain for review and finding an issue which is
by the way seems to be a checkpatch's false negative.

v1 of the changeset can be found here:

  http://www.spinics.net/lists/devicetree/msg124209.html

Vladimir Zapolskiy (7):
  ARM: dts: lpc32xx: ea3250: avoid extension of device nodes by absolute path
  ARM: dts: lpc32xx: ea3250: add NAND partitions device node
  ARM: dts: lpc32xx: ea3250: fix Atmel at24 eeprom vendor
  ARM: dts: lpc32xx: ea3250: add SoC name prefix to board dts file
  ARM: dts: lpc32xx: phy3250: avoid extension of device nodes by absolute path
  ARM: dts: lpc32xx: phy3250: add NAND partitions device node
  ARM: dts: lpc32xx: phy3250: add SoC name prefix to board dts file

 arch/arm/boot/dts/Makefile                         |   3 +-
 .../boot/dts/{ea3250.dts => lpc3250-ea3250.dts}    | 230 ++++++++---------
 .../boot/dts/{phy3250.dts => lpc3250-phy3250.dts}  | 286 ++++++++++-----------
 3 files changed, 258 insertions(+), 261 deletions(-)
 rename arch/arm/boot/dts/{ea3250.dts => lpc3250-ea3250.dts} (61%)
 rename arch/arm/boot/dts/{phy3250.dts => lpc3250-phy3250.dts} (43%)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
