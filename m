From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 0/2] Add support for the TI ADS8344 A/DC chips
Date: Fri, 15 Mar 2019 16:11:49 +0100
Message-ID: <20190315151152.30467-1-gregory.clement@bootlin.com>
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
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,

this small series adds the support for the Texas Instruments ADS8344
ADC chip. This chip has a 16-bit 8-Channel ADC and is access directly
through SPI.

The first patch add the binding documentation and the second one, the
driver itself.

Gregory

Gregory CLEMENT (2):
  dt-bindings: iio: adc: Add bindings for TI ADS8344 A/DC chips
  iio: adc: Add driver for the TI ADS8344 A/DC chips

 .../bindings/iio/adc/ti-ads8344.txt           |  21 ++
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ti-ads8344.c                  | 216 ++++++++++++++++++
 4 files changed, 248 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-ads8344.txt
 create mode 100644 drivers/iio/adc/ti-ads8344.c

-- 
2.20.1
