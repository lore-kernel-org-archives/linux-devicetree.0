Return-Path: <SRS0=1b4G=JP=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 0/7] mmc: pxamci: cleanups and minor DT tweaks
Date: Fri, 29 Jun 2018 16:47:31 +0200
Message-Id: <20180629144738.446-1-daniel@zonque.org>
To: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: robert.jarzmik@free.fr, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Here is a series of small patches for pxamci that do some cleanups.

The pxa tree has a patch for 4.19 [1] that this series builds upon,
so if possible, we'd like to let this series go through Robert's tree
after it has been reviewed. If that's not okay for the mmc folks,
teh series has to wait until 4.20-rc1.

[1] https://github.com/rjarzmik/linux/commit/6b3348f9e6e


Thanks,
Daniel

Daniel Mack (7):
  mmc: pxamci: remove irq from private context
  mmc: pxamci: remove dma resources from private context
  mmc: pxamci: remove dead code from pxamci_remove()
  mmc: pxamci: fix indenting
  mmc: pxamci: call mmc_of_parse()
  mmc: pxamci: remove pxa-mmc,gpio-power from devicetree bindings
  mmc: pxamci: let mmc core handle regulators

 .../devicetree/bindings/mmc/pxa-mmc.txt       |   1 -
 drivers/mmc/host/pxamci.c                     | 111 ++++++++----------
 2 files changed, 47 insertions(+), 65 deletions(-)

-- 
2.17.1
