From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 0/2] extcon: Add fsa9480 extcon driver
Date: Mon, 25 Feb 2019 17:58:20 +0100
Message-ID: <20190225165822.2770-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: myungjoo.ham@samsung.com
Cc: cw00.choi@samsung.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: devicetree@vger.kernel.org

This small patchset adds support for Fairchild Semiconductor FSA9480
microUSB switch.

It has been tested on Samsung Galaxy S and Samsung Fascinate 4G,
but it can be found also on other Samsung Aries (s5pv210) based devices.

Tomasz Figa (2):
  dt-bindings: extcon: Add support for fsa9480 switch
  extcon: Add fsa9480 extcon driver

 .../bindings/extcon/extcon-fsa9480.txt        |  21 +
 drivers/extcon/Kconfig                        |  10 +
 drivers/extcon/Makefile                       |   1 +
 drivers/extcon/extcon-fsa9480.c               | 473 ++++++++++++++++++
 4 files changed, 505 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt
 create mode 100644 drivers/extcon/extcon-fsa9480.c

-- 
2.17.1
