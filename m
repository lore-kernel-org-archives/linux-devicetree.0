From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 00/11] add debugfs consumers, tracepoints and rebuild QMU
Date: Wed, 6 Mar 2019 19:46:12 +0800
Message-ID: <1551872783-13707-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

In order to help debug, this series add more debugfs consumers,
introduce a few initial tracepoints;
And support new features introduced by USB3 Gen2 ISOC:
1. TXCSR/RXCSR registers are adjusted to support greater MULT
   and MAX_PKT
2. QMU format is also improved
last, some small problems are fixed.

Chunfeng Yun (11):
  usb: mtu3: check return value of devm_extcon_register_notifier()
  usb: mtu3: print useful information also for device and host modes
  usb: mtu3: remove unnecessary local variable @req
  usb: mtu3: rebuild the code of getting vbus regulator
  usb: mtu3: fix transfer error of USB3 Gen2 isoc
  usb: mtu3: rebuild qmu_gpd struct to prepare to support new QMU format
  usb: mtu3: supports new QMU format
  usb: mtu3: add debugfs interface files
  usb: mtu3: move vbus and mode debugfs interfaces into mtu3_debugfs.c
  usb: mtu3: add tracepoints to help debug
  usb: mtu3: add a function to switch mailbox state to string

 drivers/usb/mtu3/Makefile          |  11 +
 drivers/usb/mtu3/mtu3.h            |  57 ++-
 drivers/usb/mtu3/mtu3_core.c       |  27 +-
 drivers/usb/mtu3/mtu3_debug.h      |  50 +++
 drivers/usb/mtu3/mtu3_debugfs.c    | 539 +++++++++++++++++++++++++++++
 drivers/usb/mtu3/mtu3_dr.c         | 156 ++-------
 drivers/usb/mtu3/mtu3_dr.h         |   4 +
 drivers/usb/mtu3/mtu3_gadget.c     |  20 +-
 drivers/usb/mtu3/mtu3_gadget_ep0.c |   4 +
 drivers/usb/mtu3/mtu3_hw_regs.h    |  48 ++-
 drivers/usb/mtu3/mtu3_plat.c       |  28 +-
 drivers/usb/mtu3/mtu3_qmu.c        | 118 ++++---
 drivers/usb/mtu3/mtu3_qmu.h        |   1 +
 drivers/usb/mtu3/mtu3_trace.c      |  23 ++
 drivers/usb/mtu3/mtu3_trace.h      | 279 +++++++++++++++
 15 files changed, 1146 insertions(+), 219 deletions(-)
 create mode 100644 drivers/usb/mtu3/mtu3_debug.h
 create mode 100644 drivers/usb/mtu3/mtu3_debugfs.c
 create mode 100644 drivers/usb/mtu3/mtu3_trace.c
 create mode 100644 drivers/usb/mtu3/mtu3_trace.h

-- 
2.20.1
