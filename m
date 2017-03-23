From: Jeffy Chen <jeffy.chen@rock-chips.com>
Subject: [PATCH v2 0/2] Fix memory leak in of_pci_get_host_bridge_resources
Date: Thu, 23 Mar 2017 16:12:33 +0800
Message-ID: <1490256755-889-1-git-send-email-jeffy.chen@rock-chips.com>
Return-path: <linux-pci-owner@vger.kernel.org>
Sender: linux-pci-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: robh@kernel.org, toshi.kani@hpe.com, shawn.lin@rock-chips.com, briannorris@chromium.org, dianders@chromium.org, bhelgaas@google.com, dtor@chromium.org, Jeffy Chen <jeffy.chen@rock-chips.com>, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

In of_pci_get_host_bridge_resources, we alloced some struct resource
variables, and they would cause memory leak since no where to free them.

Changes in v2:
Don't change the resource_list_create_entry's behavior.

Jeffy Chen (2):
  PCI: return resource_entry in pci_add_resource helpers
  of/pci: Fix memory leak in of_pci_get_host_bridge_resources

 drivers/of/of_pci.c | 57 +++++++++++++++++++++++------------------------------
 drivers/pci/bus.c   | 13 +++++++-----
 include/linux/pci.h |  8 +++++---
 3 files changed, 38 insertions(+), 40 deletions(-)

-- 
2.1.4
