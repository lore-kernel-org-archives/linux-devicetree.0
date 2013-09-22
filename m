From: Daniel Mack <zonque@gmail.com>
Subject: [PATCH 0/4] dac7512: some cleanups and DT bindings
Date: Sun, 22 Sep 2013 21:51:45 +0200
Message-ID: <1379879509-3608-1-git-send-email-zonque@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: broonie@kernel.org, devicetree@vger.kernel.org, Daniel Mack <zonque@gmail.com>
List-Id: devicetree@vger.kernel.org

Here are some trivial things for the ti_dac7512 driver.

Mark, can you take them through your spi tree?


Thanks,
Daniel

Daniel Mack (4):
  drivers: misc: ti_dac7512: drop module version
  drivers: misc: ti_dac7512: drop DAC7512_DRV_NAME
  drivers: misc: ti_dac7512: provide a SPI ID table
  drivers: misc: ti_dac7512: add support for DT matching

 .../devicetree/bindings/misc/ti,dac7512.txt        | 20 +++++++++++++++++++
 drivers/misc/ti_dac7512.c                          | 23 +++++++++++++++++-----
 2 files changed, 38 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/ti,dac7512.txt

-- 
1.8.3.1
