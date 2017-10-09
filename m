From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 0/5] using uio_pdrv_genirq without module param
Date: Tue, 10 Oct 2017 11:46:50 +1300
Message-ID: <20171009224655.6173-1-chris.packham@alliedtelesis.co.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

I found myself about to add a driver that was a sub-optimal clone of
uio_pdrv_genirq the only difference was that I didn't want to modify the args
passed to the kernel by my bootloader. If uio_pdrv_genirq had a default
of_match entry I could simply use that. This series attempts to implement this.

I wonder if it is worth having a catch-all compat string for this driver
"generic-dev" or something. People seem to be ok with spidev not having any
such fallback so perhaps there is no-need (other than the 2 devices I want to
support with userspace drivers).

Changes in v2:
- added a better commit message to 1/2
- remove bogus checkpatch fix in 2/2

Changes in v3:
- As suggested by Rob document the bindings for the hardware and treat
  uio_pdrv_genirq.c as one potential implementer of a compatible driver.
  Following the model used by spidev.c
- Patches 1-3 replace patch 1 from v2 of this series
- Patches 4-5 replace patch 2 from v2

Chris Packham (5):
  uio: dt-bindings: document existing binding for uio-pdrv-genirq
  uio: dt-bindings: Add binding for "st,stm32f100"
  uio: dt-bindings: Add binding for "marvell,88e2040"
  uio: uio_pdrv_genirq: Add st,stm32f100 to dt compatible list
  uio: uio_pdrv_genirq: Add "marvell,88e2040" to dt compatible list

 .../devicetree/bindings/uio/uio-pdrv-genirq.txt    | 28 ++++++++++++++++++++++
 drivers/uio/uio_pdrv_genirq.c                      |  4 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt

-- 
2.14.2
