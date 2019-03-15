From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH 0/2] Add a VCNL4040 light and proximity driver
Date: Fri, 15 Mar 2019 14:54:23 -0700
Message-ID: <20190315215425.24140-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: angus.ainslie@puri.sm
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tomas Novotny <tomas@novotny.cz>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Brian Masney <masneyb@onstation.org>, Robert Eshleman <bobbyeshleman@gmail.com>, Mathieu Othacehe <m.othacehe@gmail.com>, Parthiban Nallathambi <pn@denx.de>, ryang <decatf@gmail.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Extend the Vishay VCNL40x0/4200 driver to work with the VCNL4040
chip.

Angus Ainslie (Purism) (2):
  iio: light: vcnl4000 add support for the VCNL4040 proximity and light
    sensor
  dt-bindings: iio: light: Document the VCNL4xx0 device tree bindings

 .../bindings/iio/light/vcnl4xx0.txt           | 15 ++++
 drivers/iio/light/vcnl4000.c                  | 89 ++++++++++++++++---
 2 files changed, 91 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/light/vcnl4xx0.txt

-- 
2.17.1
