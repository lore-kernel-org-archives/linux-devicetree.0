From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v4 0/2] DW DMAC: update device tree
Date: Wed, 23 Nov 2016 21:37:46 +0300
Message-ID: <1479926268-29050-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, linux-snps-arc@lists.infradead.org, arnd@arndb.de, vinod.koul@intel.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, dmaengine@vger.kernel.org, andriy.shevchenko@linux.intel.com, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

It wasn't possible to enable some features like
memory-to-memory transfers or multi block transfers via DT.
It is fixed by these patches.

Changes for v4:
 * Fix setting inverted value to "dwc->nollp". My fault - I 
   tested with wrong DTS, so DMAC was configured from autoconfig
   instead of device tree. Pointed by Andy Shevchenko.
 * Update "multi-block" diescription in documentation to be more 
   clear. Pointed by Arnd Bergmann.

Changes for v3:
 * Update existing platform data.
   We don't need to update existing DTS because default logic 
   wasn't change: we don't set "is_nollp" if we read 
   configuration from DT before. And we don't set it now if
   "multi-block" property doesn't exist in DTS.

Changes for v2:
 * I thought about is_memcpy DT property: all known devices, which 
   use DT for configuration, support memory-to-memory transfers. 
   So we don't need to read it from DT. So enable it by default, 
   if we read configuration from DT.

 * Use "multi-block" instead of "hw-llp" name to be more clear.

 * Move adding DT property and adding documentation for this
   property to one patch.

Eugeniy Paltsev (2):
  DW DMAC: enable memory-to-memory transfers support
  DW DMAC: add multi-block property to device tree

 Documentation/devicetree/bindings/dma/snps-dma.txt |  3 +++
 drivers/dma/dw/core.c                              |  2 +-
 drivers/dma/dw/platform.c                          | 11 +++++++++++
 drivers/tty/serial/8250/8250_lpss.c                |  2 +-
 include/linux/platform_data/dma-dw.h               |  4 ++--
 5 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.5.5
