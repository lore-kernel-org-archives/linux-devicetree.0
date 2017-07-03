From: <vitaly_kuzmichev@mentor.com>
Subject: [PATCH 0/2] Implement default DMA coherent pool
Date: Mon, 3 Jul 2017 17:51:13 +0300
Message-ID: <1499093475-29859-1-git-send-email-vitaly_kuzmichev@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: mark.rutland@arm.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, george_davis@mentor.com, vitaly_kuzmichev@mentor.com, Vitaly Kuzmichev <Vitaly_Kuzmichev@mentor.com>
List-Id: devicetree@vger.kernel.org

From: Vitaly Kuzmichev <Vitaly_Kuzmichev@mentor.com>

Here is alternate version to implement default DMA coherent pool, that
we use in our custom kernel since 2015.

Unlike to Vladimir Murzin's patch [1] "drivers: dma-coherent: Introduce
default DMA pool" this variant stores pointer to "rmem->priv" pointer
and thus it does not need additional function (dma_init_reserved_memory)
to explicitly call device_init (=rmem_dma_device_init) to get valid
address in "rmem->priv".

Default DMA pool attribute for memory region is being provided from
a device tree file.

Patch 2/2 adds 'dmainfo' to ProcFS to show available DMA regions.

The patchset is based on driver-core-next branch.

[1] https://patchwork.kernel.org/patch/9615465/

George G. Davis (2):
  drivers: dma-coherent: Add support for default DMA coherent pool
  drivers: dma-coherent: show per-device DMA region utilization via
    procfs

 .../bindings/reserved-memory/reserved-memory.txt   |   2 +
 drivers/base/dma-coherent.c                        | 250 +++++++++++++++++++--
 2 files changed, 237 insertions(+), 15 deletions(-)

-- 
1.9.1
