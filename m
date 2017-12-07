From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH RESEND 0/2] eeprom: at24: rename binding docs
Date: Thu,  7 Dec 2017 11:38:27 +0100
Message-ID: <20171207103829.3342-1-wsa@the-dreams.de>
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Wolfram Sang <wsa@the-dreams.de>
List-Id: devicetree@vger.kernel.org

As discussed previously (and pre-acked by Bartosz), here is a small series to
rename the binding docs for at24 properly and add the new name to MAINTAINERS
file.

This is just a resend rebase on at24/for-next and with devicetree list properly
CCed.

Wolfram Sang (2):
  dt-bindings: eeprom: rename to at24.txt
  MAINTAINERS: add DT binding docs for AT24

 Documentation/devicetree/bindings/eeprom/{eeprom.txt => at24.txt} | 0
 MAINTAINERS                                                       | 1 +
 2 files changed, 1 insertion(+)
 rename Documentation/devicetree/bindings/eeprom/{eeprom.txt => at24.txt} (100%)

-- 
2.11.0
