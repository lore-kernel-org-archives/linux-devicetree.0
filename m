From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Updates Renesas OF-DMA code
Date: Mon, 14 Apr 2014 22:35:03 +0100
Message-ID: <1397511312-4845-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: linux-kernel@lists.codethink.co.uk, dmaengine@vger.kernel.org
Cc: vinod.koul@intel.com, dan.j.williams@intel.com, linux-sh@vger.kernel.org, magnus.damm@opensource.se, horms@verge.net.au, g.liakhovetski@gmx.d, kuninori.morimoto.gx@renesas.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an update of the previous series to remove the "renesas,slaves"
property and move the CHCR register defintions into the references to
the dma node.

This requires a change to the shdma-of code as the slave-ids array is
now dynamically built, which means that we need to keep updating it
with each lookup we have not seen before. I /think/ the DMA locking
in the OF code should keep the list from getting damaged.

This is slighly more code than the original version, but it is much
easier to add devices that are DMA slaves as the dma nodes no longer
need to be updated.

