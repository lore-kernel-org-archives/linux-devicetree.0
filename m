From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH v2 0/4] media: radio-si470x-i2c: Add device tree and reset gpio support
Date: Fri,  7 Dec 2018 14:58:08 +0100
Message-ID: <20181207135812.12842-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: hverkuil@xs4all.nl, fischerdouglasc@gmail.com, keescook@chromium.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: devicetree@vger.kernel.org

This patchset adds support for device tree and reset-gpios
to si470x i2c radio driver.

First two patches adds and documents device tree support.
Third patch simplifies code by using managed resource helpers.
Last two patches adds and documents new optional reset gpios support.

It was tested on Samsung Galaxy S (i9000) phone.

Changes from v1:
  - squashed patches adding/modifying dt-bindings into one patch

Paweł Chmiel (4):
  si470x-i2c: Add device tree support
  si470x-i2c: Use managed resource helpers
  si470x-i2c: Add optional reset-gpio support
  media: dt-bindings: Add binding for si470x radio

 .../devicetree/bindings/media/si470x.txt      | 26 ++++++++++
 drivers/media/radio/si470x/radio-si470x-i2c.c | 52 ++++++++++++-------
 drivers/media/radio/si470x/radio-si470x.h     |  1 +
 3 files changed, 61 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/si470x.txt

-- 
2.17.1
