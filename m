From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH v2 0/4] iio: hx711: add data-ready-delay
Date: Mon, 25 Jun 2018 17:17:42 +0200
Message-ID: <20180625151742.GA6358@arbeit>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, akpm@linux-foundation.org, linus.walleij@linaro.org, rdunlap@infradead.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds an additional property in the device tree for adjusting the
delay between a rising edge on PD_SCK until data is ready on DOUT.

This is necessary because of parasitic capacities on different systems.

Furthermore a maintainer for this driver is added.

In the last patch there is a fix of dtc warning if someone is using the
given example

Andreas Klinger (4):
  iio: hx711: add data-ready-delay-ns property in DT
  iio: hx711: add delay until DOUT is ready
  iio: hx711: add maintainer for driver
  iio: hx711: warning in dt binding example doc

 .../devicetree/bindings/iio/adc/avia-hx711.txt     |  9 ++++++++-
 MAINTAINERS                                        |  7 +++++++
 drivers/iio/adc/hx711.c                            | 23 ++++++++++++++++++++++
 3 files changed, 38 insertions(+), 1 deletion(-)

-- 
2.1.4
