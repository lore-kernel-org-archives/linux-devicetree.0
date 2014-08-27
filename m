From: David Riley <davidriley@chromium.org>
Subject: [PATCH v2 0/1] gpio-restart restart handler
Date: Wed, 27 Aug 2014 12:23:50 -0700
Message-ID: <1409167431-21155-1-git-send-email-davidriley@chromium.org>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, David Riley <davidriley@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Anton Vorontsov <anton@enomsg.org>, Marc Carino <marc.ceeeee@gmail.com>, Anders Berg <anders.berg@lsi.com>, Laxman Dewangan <ldewangan@nvidia.com>, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Jamie Lentin <jm@lentin.co.uk>, Doug Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This driver builds upon Guenter Roeck's kernel restart handler patchset
to add a driver which registers a GPIO-based restart handler which restarts
the system by toggling a GPIO.

Changes are based off 3.17-rc2 with the following patches from v7 of 
Guenter's patchset:
https://patchwork.kernel.org/patch/4746721/
https://patchwork.kernel.org/patch/4746731/
https://patchwork.kernel.org/patch/4747011/
https://patchwork.kernel.org/patch/4746741/
https://patchwork.kernel.org/patch/4746861/

Changes since v1:
v2:
	- Updated devicetree binding to make it less kernel specific
	- Changed priority property from u8 type to standard u32
	- Rename input property to open-source
	- Made delays configurable from binding
	- Removed unneeded BUG_ON
	- Used devm_gpiod_get flags parameter to configure initial direction

David Riley (1):
  power: Add simple gpio-restart driver

 .../devicetree/bindings/gpio/gpio-restart.txt      |  54 ++++++++
 drivers/power/reset/Kconfig                        |   8 ++
 drivers/power/reset/Makefile                       |   1 +
 drivers/power/reset/gpio-restart.c                 | 149 +++++++++++++++++++++
 4 files changed, 212 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-restart.txt
 create mode 100644 drivers/power/reset/gpio-restart.c

-- 
2.0.0

