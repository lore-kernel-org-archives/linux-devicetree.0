From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 0/5] Adding scale support to the lpc32xx ADC driver
Date: Fri,  8 Feb 2019 17:09:39 +0100
Message-ID: <20190208160944.13281-1-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hello,

This series adds the support of the scale feature to the lpc32xx ADC
driver. In order to use it we need to have the voltage reference as a
device tree property, however in order to be backward compatible, this
property is optional and do not prevent to use the driver if missing.

I updated the binding documentation accordingly.

While I was on this driver, I made also some clean-up.

Gregory

Gregory CLEMENT (5):
  dt-bindings: iio: adc: move lpc32xx-adc out of staging
  dt-bindings: iio: adc: lpc32xx-adc: Document vref-supply
  iio:adc:lpc32xx use SPDX-License-Identifier
  iio:adc:lpc32xx Cleanup headers
  iio:adc:lpc32xx Add scale feature

 .../{staging => }/iio/adc/lpc32xx-adc.txt     |  5 ++
 drivers/iio/adc/lpc32xx_adc.c                 | 57 +++++++++----------
 2 files changed, 33 insertions(+), 29 deletions(-)
 rename Documentation/devicetree/bindings/{staging => }/iio/adc/lpc32xx-adc.txt (67%)

-- 
2.20.1
