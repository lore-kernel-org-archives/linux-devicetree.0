From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2] pca953x: Add optional reset gpio control
Date: Tue, 10 Jan 2017 11:29:50 -0800
Message-ID: <1484076591-20834-1-git-send-email-steve_longerbeam@mentor.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Steve Longerbeam <steve_longerbeam@mentor.com>
List-Id: devicetree@vger.kernel.org

In version 2:

- Specify that reset signal to PCA953x chip is active low, in
  binding doc.
- reorder includes in gpio-pca953x.c.
- remove dev_err() on devm_gpiod_get_optional() error return.


Steve Longerbeam (1):
  gpio: pca953x: Add optional reset gpio control

 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 4 ++++
 drivers/gpio/gpio-pca953x.c                             | 9 +++++++++
 2 files changed, 13 insertions(+)

-- 
2.7.4
