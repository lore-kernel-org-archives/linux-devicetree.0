From: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 0/3] Support of the kmcoge4 board
Date: Tue, 25 Mar 2014 14:41:52 +0100
Message-ID: <1395754915-14534-1-git-send-email-valentin.longchamp@keymile.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds support for Keymile's COGE4 board, called kmcoge4. This
board is the reference design for further designs at Keymile around the
P2040/P2041 SoCs from Freescale. This reference design is internally
called kmp204x.

Changes in v3:
- add a patch with the bindings for the KEYMILE FPGAs
- add the compatible strings for the localbus nodes
- remove the IRQ part of the board-control node as it is currently being
  reworked

Changes in v2:
- add a patch so that the Zarlink vendor prefix is defined
- add some nodes on the localbus CS when possible
- only use the corenet_generic machine and add kmcoge4 to the supported
  boards instead of defining a new kmp204x machine
- set better and more precise device nodes for the spi devices
- remove the partion layout for the spi_flash@0

Valentin Longchamp (3):
  devicetree: bindings: add Zarlink to the vendor prefixes
  devcietree: bindings: add some MFD Keymile FPGAs
  powerpc/mpc85xx: add support for Keymile's kmcoge4 board

 Documentation/devicetree/bindings/mfd/bfticu.txt   |  26 +++
 Documentation/devicetree/bindings/mfd/qriox.txt    |  17 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   2 +
 arch/powerpc/boot/dts/kmcoge4.dts                  | 157 ++++++++++++++
 arch/powerpc/configs/85xx/kmp204x_defconfig        | 227 +++++++++++++++++++++
 arch/powerpc/platforms/85xx/Kconfig                |   2 +-
 arch/powerpc/platforms/85xx/corenet_generic.c      |   3 +-
 7 files changed, 432 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/bfticu.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/qriox.txt
 create mode 100644 arch/powerpc/boot/dts/kmcoge4.dts
 create mode 100644 arch/powerpc/configs/85xx/kmp204x_defconfig

-- 
1.8.0.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
