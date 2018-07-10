From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH v5 0/3] iio: hx711: add data-ready-delay
Date: Tue, 10 Jul 2018 20:17:54 +0200
Message-ID: <20180710181754.GA5360@arbeit>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, akpm@linux-foundation.org, linus.walleij@linaro.org, rdunlap@infradead.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds an additional property in the device tree for adjusting the
delay between a rising edge on PD_SCK until data is ready on DOUT.

This is necessary because of parasitic capacitance on different systems.

In the last patch there is a fix of dtc warning if someone is using the
given example.

Changes against v4:
- Thanks to Rob for giving me explanations
- make square wave with clock PD_SCK and change documentation for it

Changes against v3:
- added suggestion of Rob to rename the new attribute to clock-frequency

Changes against v2:
- added suggestion of Jonathan to add vendor prefix in device tree setting

Andreas Klinger (3):
  iio: hx711: add clock-frequency property in DT
  iio: hx711: add delay until DOUT is ready
  iio: hx711: fix spurious unit-address in example

 .../devicetree/bindings/iio/adc/avia-hx711.txt     |  8 ++++-
 drivers/iio/adc/hx711.c                            | 39 ++++++++++++++++++++++
 2 files changed, 46 insertions(+), 1 deletion(-)

-- 
2.1.4
