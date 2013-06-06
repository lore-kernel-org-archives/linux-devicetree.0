From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: [PATCH 0/3] dma: add support for DMA multiplexer DT nodes
Date: Thu,  6 Jun 2013 17:47:22 +0200
Message-ID: <1370533645-23690-1-git-send-email-g.liakhovetski@gmx.de>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org
Cc: Vinod Koul <vinod.koul@intel.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

Next re-send of an earlier work. This series adds support for multiple 
compatible DMAC instances, capable of serving the same DMA slaves. 
Currently to specify such a configuration in DT, slaves would have to add 
DMA tuples for each requested channel for each suitable DMAC. This 
needlessly clutters the Device Tree. Instead we group such DMAC DT nodes 
together under a common parent. Then slaves can just reference that parent 
in their DMA bindings.

Cc: Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>

Guennadi Liakhovetski (3):
  OF: add a new phandle parsing function for grouped nodes
  dmaengine: add support for DMA multiplexer DT nodes
  DMA: shdma: add DT support

 Documentation/devicetree/bindings/dma/dma.txt |   44 +++++++++++++++++++++
 drivers/dma/of-dma.c                          |   31 +++++++++++----
 drivers/dma/sh/shdma-base.c                   |   51 ++++++++++++++++++++++---
 drivers/dma/sh/shdma.c                        |   44 ++++++++++++++++++---
 drivers/of/base.c                             |   28 ++++++++++++-
 include/linux/of.h                            |   16 ++++++++
 include/linux/shdma-base.h                    |    5 ++
 7 files changed, 196 insertions(+), 23 deletions(-)

-- 
1.7.2.5

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
