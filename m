From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v3 0/2] Add support for the TI ADS8344 A/DC chips
Date: Fri, 12 Apr 2019 11:15:35 +0200
Message-ID: <20190412091537.14657-1-gregory.clement@bootlin.com>
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

this is the third version of a small series adding the support for
the Texas Instruments ADS8344 ADC chip. This chip has a 16-bit
8-Channel ADC and is access directly through SPI.

I finally took time to address the last comments on the second
version.

Thanks!

Gregory

Changelog:

v2->v3:

 - Add the reviewed-by tag from Rob on the binding

 - Fix the license inconsistency

 - Add a comment about the spinlock based on the exhaustive explanation
   given by Jonathan
 

v1->v2:

 - Remove the mention to the #io-channel-cells in the first patch, as
   there is no consumer.

 - Remove scan_index and scan_type, they are not used.

 - Use defines for building the command and remove the comment.

 - Remove the goto and the label in the probe() function as the label
   was only use once.

 - Remove the "#ifdef CONFIG_OF", the driver already depends on OF.

 - Don't use of_match_ptr and rename ads8344_dt_id to ads8344_of_match.


Gregory CLEMENT (2):
  dt-bindings: iio: adc: Add bindings for TI ADS8344 A/DC chips
  iio: adc: Add driver for the TI ADS8344 A/DC chips

 .../bindings/iio/adc/ti-ads8344.txt           |  19 ++
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ti-ads8344.c                  | 204 ++++++++++++++++++
 4 files changed, 234 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-ads8344.txt
 create mode 100644 drivers/iio/adc/ti-ads8344.c

-- 
2.20.1
