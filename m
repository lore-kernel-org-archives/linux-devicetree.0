From: Y Vo <yvo@apm.com>
Subject: [PATCH 0/2] gpio: xgene: add support to configure GPIO line as input, output or external IRQ pin
Date: Fri, 11 Sep 2015 16:22:10 +0700
Message-ID: <1441963332-13329-1-git-send-email-yvo@apm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Y Vo <yvo@apm.com>, Phong Vo <pvo@apm.com>, Toan Le <toanle@apm.com>, Loc Ho <lho@apm.com>, Feng Kan <fkan@apm.com>, Quan Nguyen <qnguyen@apm.com>, Duc Dang <dhdang@apm.com>, patches@apm.com
List-Id: devicetree@vger.kernel.org

This patch supports to configure GPIO line as input, output or external IRQ pin.

Y Vo (2):
  gpio: xgene: add support to configure GPIO line as input, output or  
      external IRQ pin
  Documentation: gpio: Update description for X-Gene standby GPIO
    controller DTS binding

 .../devicetree/bindings/gpio/gpio-xgene-sb.txt     |   26 +++++++++++----
 drivers/gpio/gpio-xgene-sb.c                       |   33 +++++++++++++++----
 2 files changed, 45 insertions(+), 14 deletions(-)

