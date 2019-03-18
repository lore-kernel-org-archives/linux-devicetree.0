Return-Path: <SRS0=wFt+=RV=linux.intel.com=andriy.shevchenko@kernel.org>
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 0/4] serial: sc16is7xx: Enable use on ACPI-enabled platforms
Date: Mon, 18 Mar 2019 12:29:13 +0200
Message-Id: <20190318102917.47318-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org, Georgii Staroselskii <georgii.staroselskii@emlid.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Enable SC16IS7xx to be usable on ACPI-enabled platforms.

In v2:
- rebase on top of latest linux-next
- fix typo in title of patch 1
- explain when the new property can be used
- append Tested-by tags

Cc: Rob Herring <robh+dt@kernel.org>,
Cc: devicetree@vger.kernel.org

Andy Shevchenko (4):
  dt-bindings: sc16is7xx: Add alternative clock-frequency property
  serial: sc16is7xx: Respect clock-frequency property
  serial: sc16is7xx: Switch to use device_get_match_data()
  serial: sc16is7xx: Drop of_match_ptr() use

 .../bindings/serial/nxp,sc16is7xx.txt         |  2 ++
 drivers/tty/serial/sc16is7xx.c                | 34 +++++++++----------
 2 files changed, 19 insertions(+), 17 deletions(-)

-- 
2.20.1
