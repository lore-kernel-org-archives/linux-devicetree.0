From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH 0/2] gpio: dt: add gpio-export support
Date: Wed, 21 Nov 2012 11:12:59 +0100
Message-ID: <20121121101259.GQ4398@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

HI,

	This patch serie add the support of gpio-export to DT

	This also extend to gpio_export with the possibility to specify a name
	for the gpio.
	When you support different hardware you do not need to knwon which gpio
	is used at application level just you have it

	based on next-20121115 tested on AT91 Animeo IP

  gpiolib-of: ad gpio-export support (2012-11-19 20:36:03 +0800)

----------------------------------------------------------------
Jean-Christophe PLAGNIOL-VILLARD (2):
      gpiolib: add gpio_export_with_name
      gpiolib-of: ad gpio-export support

 Documentation/devicetree/bindings/gpio/gpio.txt |   60 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/mips/include/asm/mach-au1x00/gpio-au1000.h |    3 ++-
 arch/mips/include/asm/mach-au1x00/gpio-au1300.h |    3 ++-
 drivers/gpio/gpiolib-of.c                       |   61 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.c                          |   12 +++++++-----
 include/asm-generic/gpio.h                      |    6 ++++--
 include/linux/gpio.h                            |   23 ++++++++++++++++++++++-
 7 files changed, 158 insertions(+), 10 deletions(-)

Best Regards,
J.
