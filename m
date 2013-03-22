From: Ian Lartey <ian@slimlogic.co.uk>
Subject: [PATCH v10 0/12] Palmas updates
Date: Fri, 22 Mar 2013 14:55:10 +0000
Message-ID: <1363964122-19201-1-git-send-email-ian@slimlogic.co.uk>
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
Cc: linux-doc@vger.kernel.org, linus.walleij@linaro.org, grant.likely@secretlab.ca, wim@iguana.be, ldewangan@nvidia.com, gg@slimlogic.co.uk, linux-leds@vger.kernel.org, sfr@canb.auug.org.au, mturquette@linaro.org, sameo@linux.intel.com, linux-watchdog@vger.kernel.org, swarren@wwwdotorg.org, devicetree-discuss@lists.ozlabs.org, cooloney@gmail.com, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org, j-keerthy@ti.com, broonie@opensource.wolfsonmicro.com, lgirdwood@gmail.com, t-kristo@ti.com, rpurdie@rpsys.net, rob@landley.net, akpm@linux-foundation.org
List-Id: devicetree@vger.kernel.org

This patchset adds to the support for the Palmas series of PMIC chips.

Some of the patches have previously been submitted individually.
The DT bindings doc has been added first due to comments that it was missing.

Patches based on linux-next-20130319

Changes since v9
Added in missing [PATCH 01/12] mfd: DT bindings.
Now all patch sequence numbers with the v9 changes below are correct.
Please refer to the changes below as they have not been reviewed.

Changes since v8
The .compatible = "palmas-charger-xxx" has been removed from the DT 
for all palmas source files as the charger driver is not yet present.

[PATCH 01/12] mfd: DT bindings... - Added in missing descriptions for 
properties and added in properties that were missing

[PATCH 08/12] gpio: Palmas.... - Added
palmas_gpio_(read|write|update)  gpio parameter renamed to offset
palmas_gpio_write   renamed to palmas_gpio_clear_and_set  
as it no longer takes a data value instead it always sets the
offset bit and clears all other bits -
this is how it was being used by the callers

[PATCH 09/12] leds: Add support... -  Combined patches for 
drivers/leds/leds-palmas.c, drivers/leds/Kconfig and drivers/leds/Makefile.
palmas_dt_to_pdata - added bounds checking for DT values and
removed use of child node.
palmas_led.on_time and palmas_led.period both changed to enums.
palmas_get_crtl_and_period added which contains factored code 
from palmas_leds_work for maintainability.

[PATCH 10/12] clk: Add a clock... -  clock names taken from DT if provided

palmas-regulator not in patchset - patch Now applied by Mark Brown

[PATCH 12/12] regulator: palmas-charger-pmic removed from DT compatible list


 .../devicetree/bindings/clock/palmas-clk.txt       |   27 +
 .../devicetree/bindings/gpio/gpio-palmas.txt       |   35 ++
 .../devicetree/bindings/input/palmas-pwrbutton.txt |   26 +
 .../devicetree/bindings/leds/leds-palmas.txt       |   36 ++
 Documentation/devicetree/bindings/mfd/palmas.txt   |   81 +++
 .../devicetree/bindings/regulator/palmas-pmic.txt  |  168 ++++++
 .../devicetree/bindings/rtc/palmas-rtc.txt         |   21 +
 .../devicetree/bindings/watchdog/palmas-wdt.txt    |   21 +
 drivers/clk/Kconfig                                |    8 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-palmas.c                           |  275 ++++++++++
 drivers/gpio/gpio-palmas.c                         |   90 +++-
 drivers/leds/Kconfig                               |    9 +
 drivers/leds/Makefile                              |    1 +
 drivers/leds/leds-palmas.c                         |  561 ++++++++++++++++++++
 drivers/mfd/palmas.c                               |  102 +++-
 drivers/regulator/palmas-regulator.c               |    1 -
 drivers/watchdog/Kconfig                           |    8 +
 drivers/watchdog/Makefile                          |    1 +
 drivers/watchdog/palmas_wdt.c                      |  169 ++++++
 include/linux/mfd/palmas.h                         |  139 +++++-
 21 files changed, 1739 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/palmas-clk.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-palmas.txt
 create mode 100644 Documentation/devicetree/bindings/input/palmas-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-palmas.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/palmas.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/palmas-pmic.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/palmas-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/palmas-wdt.txt
 create mode 100644 drivers/clk/clk-palmas.c
 create mode 100644 drivers/leds/leds-palmas.c
 create mode 100644 drivers/watchdog/palmas_wdt.c
