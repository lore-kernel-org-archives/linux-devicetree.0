From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: [PATCH 0/7] of: setup dma parameters using dma-ranges and dma-coherent
Date: Thu, 6 Mar 2014 17:19:51 +0800
Message-ID: <1394097598-17622-1-git-send-email-santosh.shilimkar@ti.com>
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
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Based on comments from [1] discussion, it seems there is a need to
have a generic support to configure dma device parameters.
Series introduces support for setting up dma parameters based on
device tree properties like 'dma-ranges' and 'dma-coherent'.

The 'dma-ranges' helps to take care of few DMAable system memory restrictions
by use of dma_pfn_offset which we maintain now per device. Arch code then
uses it for dma address translations for such cases. We also setup
dma_mask accordingly during the device creation process.

The 'dma-coherent' property is used to setup coherent dma_ops. Arches
which are always coherent can make use of ARCH_IS_DMA_COHERENT to setup
coherent dma_ops always irrespective of 'dma-coherent' property.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>
Cc: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>

Grygorii Strashko (3):
  of: introduce of_dma_get_range() helper
  of: configure the platform device dma_mask and dma_pfn_offset
  ARM: dma: Use dma_pfn_offset for dma address translation

Santosh Shilimkar (4):
  device: introduce per device dma_pfn_offset
  of: introduce of_dma_is_coherent() helper
  of: Add set_arch_dma_coherent_ops() and setup coherent dma_ops
  ARM: dma: implement set_arch_dma_coherent_ops()

 arch/arm/include/asm/dma-mapping.h |   24 ++++-
 drivers/of/platform.c              |  196 +++++++++++++++++++++++++++++++++++-
 include/linux/device.h             |    2 +
 include/linux/dma-mapping.h        |    7 ++
 include/linux/of_platform.h        |   14 +++
 5 files changed, 236 insertions(+), 7 deletions(-)

Regards,
Santosh
[1] http://www.spinics.net/lists/arm-kernel/msg311678.html
-- 
1.7.9.5
