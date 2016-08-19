From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: DeviceTree fixes for 4.8
Date: Thu, 18 Aug 2016 20:12:28 -0500
Message-ID: <CAL_JsqLGTxEqS6Ki+UVpOJq9MDPnLVtfSy7fYQRdYuZJkoYxtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull for 4.8. Details below.

Rob


The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.8

for you to fetch changes up to 34276bb062b8449b3b0a208c9b848a1a27920075:

  of: fix reference counting in of_graph_get_endpoint_by_regs
(2016-08-15 11:15:05 -0500)

----------------------------------------------------------------
DeviceTree fixes for 4.8:

- Couple of DT node ref counting fixes

- Fix __unflatten_device_tree for PPC PCI hotplug case

- Rework marking irq controllers as OF_POPULATED in cases where real
driver is used.

- Disable of_platform_default_populate_init on PPC. The change in
initcall order causes problems which need to be sorted out later.

----------------------------------------------------------------
Gavin Shan (1):
      drivers/of: Validate device node in __unflatten_device_tree()

Kevin Hao (1):
      of/platform: disable the of_platform_default_populate_init() for
all the ppc boards

Lucas Stach (1):
      of: fix reference counting in of_graph_get_endpoint_by_regs

Markus Elfring (1):
      of: Delete an unnecessary check before the function call "of_node_put"

Philipp Zabel (2):
      of/irq: Mark interrupt controllers as populated before initialisation
      ARM: imx6: mark GPC node as not populated after irq init to
probe pm domain driver

 arch/arm/mach-imx/gpc.c |  6 ++++++
 drivers/of/base.c       | 14 +++-----------
 drivers/of/fdt.c        |  2 +-
 drivers/of/irq.c        |  5 +++--
 drivers/of/platform.c   |  2 ++
 5 files changed, 15 insertions(+), 14 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
