From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/2] using uio_pdrv_genirq without module param
Date: Thu, 21 Sep 2017 12:53:24 +1200
Message-ID: <20170921005326.30490-1-chris.packham@alliedtelesis.co.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

I found myself about to add a driver that was a sub-optimal clone of
uio_pdrv_genirq the only difference was that I didn't want to modify the args
passed to the kernel by my bootloader. If uio_pdrv_genirq had a default
of_match entry I could simply use that. This series attempts to implement this.

Chris Packham (2):
  uio: dt-bindings: document binding for uio-pdrv-genirq
  uio: add default compatible string to uio_pdrv_genirq

 .../bindings/uio/linux,uio-pdrv-genirq.txt         | 28 ++++++++++++++++++++++
 drivers/uio/uio_pdrv_genirq.c                      |  3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/uio/linux,uio-pdrv-genirq.txt

-- 
2.14.1
