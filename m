From: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Subject: [PATCH V2 0/3] Add support for DNS-320 and DNS-325 using devicetree
Date: Sat, 24 Mar 2012 13:14:33 +0000
Message-ID: <1332594876-8673-1-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thankyou to Arnd and Jason for taking the time to review, sorry it's taken a
while to get back to you both with an updated version.

Changes since v1:
* Rebase against kirkwood_dt_for_3.4, removing premature devicetree ports.
* Move additions into a separate board-dnskw.c. It could be separated further
  into a board-dns320.c and board-dns325.c but it probably isn't worth it.
* s/marvell,/mrvl,/g
* Include an example dtb partition in documentation
* Copy structure of serial nodes to allow common options for NAND to be set
  in kirkwood.dtsi
* Simplifications in orion-nand.c
    
I looked into adding a dtb partition into the d-link partition scheme. However
D-Link supplied userland references all partitions by number and there isn't
any obvious space that would be safe to use. Regardless, if you still have
D-Link userland around, you probably still have D-Link u-boot, which won't load
the dtb for you anyway.

Jamie Lentin (3):
  ARM: kirkwood: Basic support for DNS-320 and DNS-325
  ARM: kirkwood: Convert orion-nand to fdt
  ARM: kirkwood: Define NAND partitions in dts

 .../devicetree/bindings/mtd/orion-nand.txt         |   46 ++++
 arch/arm/boot/dts/kirkwood-dns320.dts              |   64 +++++
 arch/arm/boot/dts/kirkwood-dns325.dts              |   59 +++++
 arch/arm/boot/dts/kirkwood.dtsi                    |   15 +-
 arch/arm/mach-kirkwood/Kconfig                     |   23 ++
 arch/arm/mach-kirkwood/Makefile                    |    1 +
 arch/arm/mach-kirkwood/Makefile.boot               |    2 +
 arch/arm/mach-kirkwood/board-dnskw.c               |  275 ++++++++++++++++++++
 arch/arm/mach-kirkwood/board-dt.c                  |    5 +
 arch/arm/mach-kirkwood/common.c                    |   12 +
 arch/arm/mach-kirkwood/common.h                    |    6 +
 drivers/mtd/nand/orion_nand.c                      |   34 +++-
 12 files changed, 539 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/orion-nand.txt
 create mode 100644 arch/arm/boot/dts/kirkwood-dns320.dts
 create mode 100644 arch/arm/boot/dts/kirkwood-dns325.dts
 create mode 100644 arch/arm/mach-kirkwood/board-dnskw.c

-- 
1.7.9.1
