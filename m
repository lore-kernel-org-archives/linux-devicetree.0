From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/5] Add device tree support for mc13892 regulator driver
Date: Mon, 28 Nov 2011 21:37:14 +0800
Message-ID: <1322487439-27254-1-git-send-email-shawn.guo@linaro.org>
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

The first patch adds device tree probe support for mc13xxx mfd driver.

The patches #2 and #3 make small changes to regulator OF function for
supporting the case like mc13892 regulator driver, where device_node
does not have a struct device behind it.  I'm sorry for that I did not
notice them until I start porting mc13892 to the support

The patch #4 adds the actual device tree support for mc13892 regulator
driver, and the last patch add mc13892 support into imx51-babbage
device tree source.

Shawn Guo (5):
      mfd: mc13xxx: add device tree probe support
      regulator: fix label names used in device tree bindings
      regulator: pass device_node to of_get_regulator_init_data()
      regulator: mc13892: add device tree probe support
      arm/imx: add mc13892 support into imx51-babbage.dts

 .../devicetree/bindings/regulator/regulator.txt    |   10 +-
 arch/arm/boot/dts/imx51-babbage.dts                |  100 ++++++++++++++++-
 drivers/mfd/mc13xxx-core.c                         |  121 ++++++++++++++-----
 drivers/regulator/mc13892-regulator.c              |   43 +++++--
 drivers/regulator/mc13xxx-regulator-core.c         |   57 +++++++++
 drivers/regulator/mc13xxx.h                        |   20 ++++
 drivers/regulator/of_regulator.c                   |    7 +-
 include/linux/mfd/mc13xxx.h                        |    1 +
 include/linux/regulator/of_regulator.h             |    6 +-
 9 files changed, 311 insertions(+), 54 deletions(-)
