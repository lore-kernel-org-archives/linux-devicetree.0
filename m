From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Subject: [RFC v2 PATCH 0/2]Move AEMIF driver out of DaVinci machine to memory
 subsystem
Date: Tue, 6 Nov 2012 16:47:05 -0500
Message-ID: <1352238427-26085-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, hs-ynQEQJNshbs@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, mikedunn-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, santosh.shilimkar-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some of the comments addressed in this patch vs initial version are
 1. moved the bindings documentation to bindings/memory/davinci-aemif.txt
 2. moved the bindings documentation for nand to mtd/ folder
 3. renamed cs subnode fields with a ti,davinci-cs prefix.
 4. davinci-aemif.txt now has full picture of aemif async bus bindings
    and that of all of the sub device nodes and sub nodes
 5. Made cs node optional so that on platforms that sets the cs
    parameters in bootloader can ignore the cs binding nodes so that
    hardware values set by boot loader is used.

The DaVinci AEMIF (asynchronous external memory interface) is used on other
TI SoCs that are not DaVinci based. So the AEMIF driver is to be moved
outside mach-davinci to the drivers folder so that it can be re-used on other
TI SoCs. Also migrate the DaVinci NAND driver to use the new aemif API.

Some of these code has been borrowed from intial patch from Heiko Schocher
 <hs-ynQEQJNshbs@public.gmane.org>. So I have added his name in the Copyright for davinci-aemif.c
This is an RFC to get the intial response so that all the platforms can
be migrated to use this driver.

Murali Karicheri (2):
  memory: davinci - add aemif controller platform driver
  mtd: davinci - remove DaVinci architecture depedency

 .../devicetree/bindings/arm/davinci/nand.txt       |   59 ---
 .../devicetree/bindings/memory/davinci-aemif.txt   |  103 +++++
 .../devicetree/bindings/mtd/davinci-nand.txt       |   59 +++
 drivers/memory/Kconfig                             |   10 +
 drivers/memory/Makefile                            |    1 +
 drivers/memory/davinci-aemif.c                     |  479 ++++++++++++++++++++
 drivers/mtd/nand/Kconfig                           |    6 +-
 drivers/mtd/nand/davinci_nand.c                    |   40 +-
 include/linux/platform_data/davinci-aemif.h        |   47 ++
 include/linux/platform_data/davinci-nand.h         |   87 ++++
 10 files changed, 806 insertions(+), 85 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/davinci/nand.txt
 create mode 100644 Documentation/devicetree/bindings/memory/davinci-aemif.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/davinci-nand.txt
 create mode 100644 drivers/memory/davinci-aemif.c
 create mode 100644 include/linux/platform_data/davinci-aemif.h
 create mode 100644 include/linux/platform_data/davinci-nand.h

-- 
1.7.9.5
