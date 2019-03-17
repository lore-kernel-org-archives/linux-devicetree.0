From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH v2 0/5] Add a VCNL4040 light and proximity driver
Date: Sun, 17 Mar 2019 08:47:57 -0700
Message-ID: <20190317154802.15174-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Tomas Novotny <tomas@novotny.cz>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Extend the Vishay VCNL4000/4010/4020/4200 driver to work with the VCNL4040
chip.

Changes since V1:
    Separated byte vs word bug fix.
    Separated device tree hooks.
    Separated devicetree binding patches.

Angus Ainslie (Purism) (5):
  iio: light: vcnl4000 use word writes instead of byte writes
  iio: light: vcnl4000 add devicetree hooks
  dt-bindings: iio: light: add vcnl4000 devicetree bindings
  iio: light: vcnl4000 add support for the VCNL4040 proximity and light
    sensor
  dt-bindings: iio: light: add vcnl4040 devicetree bindings

 .../bindings/iio/light/vcnl4000.txt           | 24 ++++++
 drivers/iio/light/vcnl4000.c                  | 77 ++++++++++++++++---
 2 files changed, 91 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/light/vcnl4000.txt

-- 
2.17.1
