From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/4] Add device tree support for mc13892 regulator driver
Date: Thu,  1 Dec 2011 17:21:04 +0800
Message-ID: <1322731268-12158-1-git-send-email-shawn.guo@linaro.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Changes since v1:
 * Drop '[PATCH 2/5] regulator: fix label names used in device tree
   bindings' which has been picked up
 * Add binding document for mfd/mc13xxx-core device tree support
 * Fix regulator/fixed.c breakage caused by interface change on
   of_get_regulator_init_data()
 * Reword the commit message of patch #2 a little bit to make the
   reason for changing clear
 * Retrieve the irq from gpio irq domain

Shawn Guo (4):
      mfd: mc13xxx: add device tree probe support
      regulator: pass device_node to of_get_regulator_init_data()
      regulator: mc13892: add device tree probe support
      arm/imx: add mc13892 support into imx51-babbage.dts

 Documentation/devicetree/bindings/mfd/mc13xxx.txt |   50 ++++++++++
 arch/arm/boot/dts/imx51-babbage.dts               |  103 ++++++++++++++++++++-
 drivers/mfd/mc13xxx-core.c                        |  106 +++++++++++++++------
 drivers/regulator/fixed.c                         |    2 +-
 drivers/regulator/mc13892-regulator.c             |   43 ++++++--
 drivers/regulator/mc13xxx-regulator-core.c        |   57 +++++++++++
 drivers/regulator/mc13xxx.h                       |   20 ++++
 drivers/regulator/of_regulator.c                  |    7 +-
 include/linux/mfd/mc13xxx.h                       |    1 +
 include/linux/regulator/of_regulator.h            |    6 +-
 10 files changed, 345 insertions(+), 50 deletions(-)
