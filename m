From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: [RFC] [PATCH 0/3] of: allow to support irq domain register as
 platform_device for platform_device
Date: Tue, 28 May 2013 16:52:19 +0200
Message-ID: <20130528145219.GA30411@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

	Today in the current of implementation we populate all the ressources
	at of_platform_populate time. But this leed to a chicken-egg dilemat
	some the irq present in DT are from platform_device too. And you can
	not resolve them as of_platform_populate. So delay the populate of irq
	at platform_drv_probe.

	And if the irq_domain is not yet present just defer the probe (GPIO as example)

	we still have one issue is that the gpio irq provide by DT need to have
	the gpio requested and configured which I'll fix later by handling this automatically
	by a gpio_irq_chip and dorp this from every drivers

The following changes since commit e4aa937ec75df0eea0bee03bffa3303ad36c986b:

  Linux 3.10-rc3 (2013-05-26 16:00:47 -0700)

are available in the git repository at:

  git://github.com/at91linux/linux-at91.git j/for-3.11-platform_irq_resolve

for you to fetch changes up to 898eab5ad414bfc48dd1160369965a677f135d26:

  IRQ: irq domain: defer of irq ressoure resolve at platform_drv_probe (2013-05-28 05:58:31 +0800)

----------------------------------------------------------------
Jean-Christophe PLAGNIOL-VILLARD (3):
      of: irq: rename of_irq_count to of_irq_valid_count
      of: add of_irq_count: Count the number of IRQs a node present
      IRQ: irq domain: defer of irq ressoure resolve at platform_drv_probe

 arch/mips/lantiq/irq.c           |    2 +-
 arch/powerpc/sysdev/ppc4xx_msi.c |    2 +-
 drivers/base/platform.c          |    5 +++++
 drivers/clocksource/exynos_mct.c |    2 +-
 drivers/gpio/gpio-mvebu.c        |    2 +-
 drivers/irqchip/irq-vt8500.c     |    4 ++--
 drivers/of/irq.c                 |   15 +++++++++++++++
 drivers/of/platform.c            |   27 ++++++++++++++++++++++++++-
 include/linux/of_irq.h           |    1 +
 include/linux/of_platform.h      |    7 +++++++
 10 files changed, 60 insertions(+), 7 deletions(-)

Best Regards,
J.
