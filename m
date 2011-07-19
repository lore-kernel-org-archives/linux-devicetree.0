From: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/7] support DT on ARCH-MMP
Date: Tue, 19 Jul 2011 10:24:43 +0800
Message-ID: <1311042290-20253-1-git-send-email-haojian.zhuang@marvell.com>
References: <2011071901>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <2011071901>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, eric.y.miao@gma
List-Id: devicetree@vger.kernel.org


It's used to support DT on ARCH-MMP.

Haojian Zhuang (7):
      ARM: mmp: parse irq from DT
      ARM: mmp: append MMP_USE_OF config
      ARM: mmp: support DT on both dkb and brownstone
      tty: serial: support device tree in pxa
      tty: serial: check ops before registering console
      i2c: pxa: support i2c controller from DT
      i2c: pxa: support to parse property

 .../devicetree/bindings/arm/marvell/boards.txt     |    7 +
 .../devicetree/bindings/arm/marvell/intc.txt       |  120 ++++++++++
 .../devicetree/bindings/i2c/pxa255-i2c.txt         |   36 +++
 arch/arm/Kconfig                                   |    1 +
 arch/arm/boot/dts/mmp2-brownstone.dts              |  242 ++++++++++++++++++++
 arch/arm/boot/dts/ttc-dkb.dts                      |   80 +++++++
 arch/arm/mach-mmp/Kconfig                          |    7 +
 arch/arm/mach-mmp/Makefile                         |    6 +
 arch/arm/mach-mmp/boards.c                         |  159 +++++++++++++
 arch/arm/mach-mmp/common.h                         |    1 +
 arch/arm/mach-mmp/include/mach/irqs.h              |    4 +
 arch/arm/mach-mmp/intc.c                           |  223 ++++++++++++++++++
 drivers/i2c/busses/i2c-pxa.c                       |   78 +++++--
 drivers/tty/serial/Kconfig                         |    4 +-
 drivers/tty/serial/of_serial.c                     |   12 +
 drivers/tty/serial/pxa.c                           |   95 ++++++++-
 include/linux/serial_pxa.h                         |   17 ++
 17 files changed, 1065 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/boards.txt
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/intc.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/pxa255-i2c.txt
 create mode 100644 arch/arm/boot/dts/mmp2-brownstone.dts
 create mode 100644 arch/arm/boot/dts/ttc-dkb.dts
 create mode 100644 arch/arm/mach-mmp/boards.c
 create mode 100644 arch/arm/mach-mmp/intc.c
 create mode 100644 include/linux/serial_pxa.h
