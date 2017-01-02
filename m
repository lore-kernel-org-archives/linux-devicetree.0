From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH] pca953x: Add optional reset gpio control
Date: Mon,  2 Jan 2017 13:07:50 -0800
Message-ID: <1483391271-17304-1-git-send-email-steve_longerbeam@mentor.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Steve Longerbeam <steve_longerbeam@mentor.com>
List-Id: devicetree@vger.kernel.org

Add optional reset-gpios pin control. If present, de-assert the
specified reset gpio pin to bring the chip out of reset.


Steve Longerbeam (1):
  gpio: pca953x: Add optional reset gpio control

 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt |  4 ++++
 drivers/gpio/gpio-pca953x.c                             | 11 +++++++++++
 2 files changed, 15 insertions(+)

-- 
2.7.4
