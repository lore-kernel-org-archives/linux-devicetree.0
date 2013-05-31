From: Hebbar Gururaja <gururaja.hebbar-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 00/11] drivers: Add Pinctrl PM support
Date: Fri, 31 May 2013 15:43:00 +0530
Message-ID: <1369995191-20855-1-git-send-email-gururaja.hebbar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

By optionally putting the pins into sleep state in the suspend [or in
runtime_suspend] callback we can accomplish two things.
- One is to minimize current leakage from pins and thus save power,
- second, we can prevent the IP from driving pins output in an
uncontrolled manner, which may happen if the power domain drops the
domain regulator.

These states can be specified in the DT blob and corresponding driver
can pick these states during probe & set the related values during
idle/suspend.

Not all drivers support/has idle state. Drivers like i2c, spi, mmc has
idle states and hence these drivers are updated to support all the
three states
- default  : during regular operation
- idle : when the module is in idle state
- sleep : when the module is in suspend state

For those drivers which doesn't support/have idle state (at least at
the moment), only default & sleep state is added.

The modification expects DT blob to provide the phandler & the pinctrl
states otherwise it gives a warning message. To remove this warning
message pass default state with null phandler to pinctrl in device node

Kernel Base for the series is
	> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/
	linux-2.6.git
	> tag: v3.10-rc3

Hebbar Gururaja (11):
  pinctrl: single: adopt pinctrl sleep mode management
  leds: leds-gpio: Enhance pinctrl support
  Input: gpio_keys: Adopt pinctrl support
  Input: matrix-keypad: Adopt pinctrl support
  spi: omap2-mcspi: enhance pinctrl support
  usb: musb: dsps: Adopt pinctrl support
  pwm: pwm-tiehrpwm: enhance pinctrl support
  pwm: pwm-tiecap: enhance pinctrl support
  mmc: omap_hsmmc: enhance pinctrl support
  video: da8xx-fb: adopt pinctrl support
  i2c: omap: enhance pinctrl support

 drivers/i2c/busses/i2c-omap.c          |  112 ++++++++++++++++++++++++++++++--
 drivers/input/keyboard/gpio_keys.c     |   47 ++++++++++++++
 drivers/input/keyboard/matrix_keypad.c |   48 ++++++++++++++
 drivers/leds/leds-gpio.c               |   81 +++++++++++++++++++++--
 drivers/mmc/host/omap_hsmmc.c          |   79 ++++++++++++++++++++--
 drivers/pinctrl/pinctrl-single.c       |   27 ++++++++
 drivers/pwm/pwm-tiecap.c               |   48 ++++++++++++--
 drivers/pwm/pwm-tiehrpwm.c             |   49 ++++++++++++--
 drivers/spi/spi-omap2-mcspi.c          |   89 +++++++++++++++++++++++--
 drivers/usb/musb/musb_dsps.c           |   46 +++++++++++++
 drivers/video/da8xx-fb.c               |   48 ++++++++++++++
 11 files changed, 641 insertions(+), 33 deletions(-)

-- 
1.7.9.5
