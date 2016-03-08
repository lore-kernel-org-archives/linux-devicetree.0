From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 0/5] gpio: of: Add error handling and support for multiple gpio in gpio-hog
Date: Tue, 8 Mar 2016 17:32:03 +0530
Message-ID: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org
Cc: pawel.moll@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, treding@nvidia.com, swarren@wwwdotorg.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

This series enhance the error print by adding error number in print message,
handle the error if gpio_hogd() fails and returns error to caller, and
add the support of multiple GPIOs to be passed from property "gpios" under
gpio hogd node.

Laxman Dewangan (5):
  gpio: of: Scan available child node for gpio-hog
  gpio: gpiolib: Print error number if gpio hog failed
  gpio: of: Return error if gpio hog configuration failed
  gpio: of: Add support to have multiple gpios in gpio-hog
  gpio: DT: Rephrase property "gpios" of hog node to support multiple
    gpios

 Documentation/devicetree/bindings/gpio/gpio.txt |  6 +-
 drivers/gpio/gpiolib-of.c                       | 73 +++++++++++++++++++------
 drivers/gpio/gpiolib.c                          |  9 +--
 3 files changed, 63 insertions(+), 25 deletions(-)

-- 
2.1.4

