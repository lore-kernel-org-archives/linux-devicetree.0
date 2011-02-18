From: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 0/3] Add MX51 basic DT support
Date: Fri, 18 Feb 2011 16:12:07 +0800
Message-ID: <1298016730-22761-1-git-send-email-r64343@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset adds FSL mx51 device tree support. This
is based on

git://git.secretlab.ca/git/linux-2.6 devicetree/test

This patch has been tested on MX51 babbage board and can
boot up succesfully to linux console with DT enabled.

Jason Liu (3):
  arm/dt: add basic mx51 device tree support
  arm/dt: add very basic dts file for babbage board
  serial/imx: parse from device tree support

 arch/arm/boot/dts/babbage.dts           |  117 +++++++++++++++++++++++++++++++
 arch/arm/mach-mx5/Kconfig               |    6 ++
 arch/arm/mach-mx5/Makefile              |    1 +
 arch/arm/mach-mx5/board-dt.c            |   64 +++++++++++++++++
 arch/arm/mach-mx5/clock-mx51-mx53.c     |   45 ++++++++++++-
 arch/arm/plat-mxc/include/mach/common.h |    1 +
 drivers/tty/serial/imx.c                |   81 +++++++++++++++++++---
 7 files changed, 304 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/boot/dts/babbage.dts
 create mode 100644 arch/arm/mach-mx5/board-dt.c
 mode change 100644 => 100755 drivers/tty/serial/imx.c
