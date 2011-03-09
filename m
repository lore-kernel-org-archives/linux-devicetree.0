From: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH V3 0/5] Add MX51 basic DT support
Date: Wed,  9 Mar 2011 13:19:28 +0800
Message-ID: <1299647973-21845-1-git-send-email-jason.hui@linaro.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

This patchset adds Freescale i.mx51 device tree support.
This is based on

git://git.secretlab.ca/git/linux-2.6 devicetree/test

This patch has been tested on MX51 babbage board and can
boot up succesfully to linux console with DT enabled.

Grant, I think it's almost ready for you to merge it.

V3:
- prefix the property name with the vendor name as like:
   "fsl,has-rts-cts" and "fsl,irda-mode"
- use the ttymxc0 as the console
- add FEC support, nfs can be used now

Jason Liu (5):
  arm/dt: add basic mx51 device tree support
  arm/dt: add very basic dts file for babbage board
  serial/imx: parse from device tree support
  net/fec: check id_entry pointer before using it
  net/fec: add device tree matching support

 arch/arm/boot/dts/babbage.dts           |  110 +++++++++++++++++++++++++++++++
 arch/arm/mach-mx5/Kconfig               |    8 ++
 arch/arm/mach-mx5/Makefile              |    1 +
 arch/arm/mach-mx5/board-dt.c            |   64 ++++++++++++++++++
 arch/arm/mach-mx5/clock-mx51-mx53.c     |   43 ++++++++++++-
 arch/arm/plat-mxc/include/mach/common.h |    1 +
 drivers/net/fec.c                       |   25 +++++--
 drivers/tty/serial/imx.c                |   79 +++++++++++++++++++---
 8 files changed, 314 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm/boot/dts/babbage.dts
 create mode 100644 arch/arm/mach-mx5/board-dt.c
