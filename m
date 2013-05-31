From: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v6 0/7] USB: add devicetree helpers for determining dr_mode
 and phy_type
Date: Fri, 31 May 2013 20:38:42 +0200
Message-ID: <1370025529-7414-1-git-send-email-mgr@pengutronix.de>
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
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

changes since v5:
- fixed compiling issues with non dt kernels in helper functions
- moved ci13xxx_imx glue calls into dr_mode and phy_type helpers to core.c
- added missing PTS option into PTW, PTS patch
- added kernel parameter patch to force core into fullspeed mode
- fixed kmalloc pdata patch in ci13xxx_imx.c

Michael Grzeschik (4):
  USB: add devicetree helpers for determining dr_mode and phy_type
  USB: chipidea: ci13xxx-imx: move static pdata into probe function
  USB: chipidea: add PTW, PTS and STS handling
  usb: chipidea: udc: add force-full-speed option

Philipp Zabel (1):
  usb: chipidea: usbmisc: use module_platform_driver

Sascha Hauer (2):
  USB chipidea: introduce dual role mode pdata flags
  USB chipidea i.MX: use devm_usb_get_phy_by_phandle to get phy

 .../devicetree/bindings/usb/ci13xxx-imx.txt        |  6 ++
 drivers/usb/chipidea/bits.h                        | 17 ++++-
 drivers/usb/chipidea/ci13xxx_imx.c                 | 60 ++++++++--------
 drivers/usb/chipidea/core.c                        | 84 ++++++++++++++++++++--
 drivers/usb/chipidea/usbmisc_imx.c                 | 12 +---
 drivers/usb/phy/Makefile                           |  1 +
 drivers/usb/phy/of.c                               | 47 ++++++++++++
 drivers/usb/usb-common.c                           | 35 +++++++++
 include/linux/usb/chipidea.h                       |  3 +-
 include/linux/usb/of.h                             | 28 ++++++++
 include/linux/usb/otg.h                            |  7 ++
 include/linux/usb/phy.h                            |  9 +++
 12 files changed, 258 insertions(+), 51 deletions(-)
 create mode 100644 drivers/usb/phy/of.c
 create mode 100644 include/linux/usb/of.h

-- 
1.8.2.rc2
