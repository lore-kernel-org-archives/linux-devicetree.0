From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: [PATCH v2 0/7] ARM: dma: Support dma-ranges and dma-coherent
Date: Thu, 27 Feb 2014 16:17:45 -0500
Message-ID: <1393535872-20915-1-git-send-email-santosh.shilimkar@ti.com>
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
To: arnd@arndb.de
Cc: devicetree@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, Russell King <linux@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>, linus.walleij@linaro.org, magnus.damm@gmail.com, Olof Johansson <olof@lixom.net>, robh+dt@kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>, Greg Ungerer <gerg@uclinux.org>, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Following the RFC [1], [2] comments, suggestions and some IRC discussion
with Arnd Bergmann, here is the refreshed series. Attempt is to use dma-ranges
and dma-coherent properties to setup the dma for ARM platforms.

Platforms needing more funky stuff than the generic ones can use per
platform device callbacks. Differnt buses like PCIE dma parsing still needs
to be addressed though.

Cc: Russell King <linux@arm.linux.org.uk>
Cc: Greg Ungerer <gerg@uclinux.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>
CC: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

Grygorii Strashko (5):
  ARM: mm: Introduce archdata.dma_pfn_offset
  ARM: mm: Remove unsed dma_to_virt()
  dma: of: introduce of_dma_get_range() helper
  ARM: of: introduce common routine for DMA configuration
  ARM: dts: keystone: Use dma-ranges property

Santosh Shilimkar (2):
  dma: of: introduce of_dma_is_coherent() helper
  ARM: dts: keystone: Udate USB node for dma properties

 arch/arm/boot/dts/keystone.dtsi             |    3 +
 arch/arm/include/asm/device.h               |    1 +
 arch/arm/include/asm/dma-mapping.h          |   25 +++----
 arch/arm/include/asm/prom.h                 |    3 +
 arch/arm/kernel/devtree.c                   |   61 +++++++++++++++
 arch/arm/mach-iop13xx/include/mach/memory.h |   11 ---
 arch/arm/mach-ks8695/include/mach/memory.h  |    2 -
 arch/arm/mach-omap1/include/mach/memory.h   |    4 -
 drivers/dma/of-dma.c                        |  108 +++++++++++++++++++++++++++
 drivers/of/platform.c                       |    5 +-
 include/linux/of.h                          |    2 +-
 include/linux/of_dma.h                      |   13 ++++
 12 files changed, 205 insertions(+), 33 deletions(-)

Regards,
Santosh
[1] http://www.spinics.net/lists/arm-kernel/msg304555.html
[2] http://www.spinics.net/lists/arm-kernel/msg310562.html 
-- 
1.7.9.5
