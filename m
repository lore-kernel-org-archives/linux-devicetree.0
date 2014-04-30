From: Toby Smith <toby@tismith.id.au>
Subject: [PATCH 0/2] gpio: pca953x: allow shared interrupts
Date: Wed, 30 Apr 2014 18:01:39 +1000
Message-ID: <cover.1398844809.git.toby@tismith.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, grant.likely@linaro.org, robh+dt@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Toby Smith <toby@tismith.id.au>
List-Id: devicetree@vger.kernel.org

These patches allow the pca953x family of chips to use a 
shared interrupt.

Toby Smith (2):
  gpio: pca953x: return IRQ_NONE when appropriate
  gpio: pca953x: request a shared interrupt

 drivers/gpio/gpio-pca953x.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
1.8.3.2
