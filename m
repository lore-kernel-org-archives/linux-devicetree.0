From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/9] irq domain for gen irq chip and pl061 DT irq support
Date: Wed, 14 Dec 2011 09:28:49 -0600
Message-ID: <1323876538-20406-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

This series adds irq_domain support to generic irq chip, converts the
pl061 gpio driver to use generic irq chip, and finally adds DT irq binding
support for pl061. The pl061 driver is also fixed to use 0 for no irq
instead of -1 or NO_IRQ.

The irq_domain support should be transparent to users of generic irq
chip. Shawn Guo has tested previous version with i.MX AVIC and his fixes
have been incorporated. Any testing by other users of generic irq chip
is appreciated.

This series is also dependent on:

irqdomain: export irq_domain_simple_ops for !CONFIG_OF
http://www.spinics.net/lists/arm-kernel/msg150290.html

gpio: pl061: drop extra check for NULL platform_data
http://www.spinics.net/lists/arm-kernel/msg151701.html

Tested on highbank and built all defconfigs.

Rob

Rob Herring (9):
  dt: add empty of_get_node/of_put_node functions
  irq: ensure domain hwirq is within range for DT translate
  irq: convert generic-chip to use irq_domain
  gpio: pl061: use chained_irq_* functions in irq handler
  gpio: pl061: convert to use 0 for no irq
  ARM: realview: convert pl061 no irq to be 0 instead of -1
  gpio: pl061: convert to use generic irq chip
  gpio: pl061: enable interrupts with DT style binding
  ARM: highbank: add interrupt properties to gpio nodes

 .../devicetree/bindings/gpio/pl061-gpio.txt        |   15 +++
 arch/arm/boot/dts/highbank.dts                     |    9 ++-
 arch/arm/mach-realview/realview_eb.c               |    3 -
 arch/arm/mach-realview/realview_pb1176.c           |    3 -
 arch/arm/mach-realview/realview_pb11mp.c           |    3 -
 arch/arm/mach-realview/realview_pba8.c             |    3 -
 arch/arm/mach-realview/realview_pbx.c              |    3 -
 drivers/gpio/Kconfig                               |    1 +
 drivers/gpio/gpio-pl061.c                          |  107 +++++++++-----------
 include/linux/amba/pl061.h                         |    2 +-
 include/linux/irq.h                                |    2 +-
 include/linux/of.h                                 |   29 +++---
 kernel/irq/Kconfig                                 |    1 +
 kernel/irq/generic-chip.c                          |   57 +++++++----
 kernel/irq/irqdomain.c                             |    3 +
 15 files changed, 126 insertions(+), 115 deletions(-)

-- 
1.7.5.4
