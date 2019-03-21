From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [RESEND PATCH 00/11] add debugfs consumers,
 tracepoints and supports USB Gen2 ISOC
Date: Thu, 21 Mar 2019 10:53:38 +0800
Message-ID: <1553136829-14712-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
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
