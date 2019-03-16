From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 0/4] Adding scale support to the lpc32xx ADC driver
Date: Sat, 16 Mar 2019 17:16:58 +0000
Message-ID: <20190316171658.327ab411@archlinux>
References: <20190315095231.17001-1-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190315095231.17001-1-gregory.clement@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Sylvain Lemieux <slemieux.tyco@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 15 Mar 2019 10:52:27 +0100
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> Hello,
> 
> This is the second version of a series adding the support of the scale
> feature to the lpc32xx ADC driver. In order to use it we need to have
> the voltage reference as a device tree property, however in order to
> be backward compatible, this property is optional and do not prevent
> to use the driver if missing.
> 
> I updated the binding documentation accordingly.
> 
> Gregory
> 
> Changelog:
> v1 -> v2:
> 
>  - "dt-bindings: iio: adc: move lpc32xx-adc out of staging" and
>    "iio:adc:lpc32xx use SPDX-License-Identifier" has been merged
> 
>  - split "iio:adc:lpc32xx use SPDX-License-Identifier" in 2 patches
>    one foe sorting and the second one for removal
Hohum. I'm reviewing cover letters now. Must have too much time on 
my hands ;)

This is talking about the wrong patch.

> 
>  - add reviewed-by from Rob Herring on the binding documentation patch
> 
>  - add default in the switch/case in lpc32xx_read_raw()
> 
>  - no more use scan_type.realbits and directly put the value in the
>    IIO_CHAN_INFO_SCALE case
> 
>  - keep the const for the struct iio_chan_spec and declare 2 of them.
> 
>  - remove the unrelated and bad whitespace change.
> 
> Gregory CLEMENT (4):
>   iio: adc: lpc32xx: Sort headers
>   iio: adc: lpc32xx: Cleanup headers
>   iio: adc: lpc32xx: Add scale feature
>   dt-bindings: iio: adc: lpc32xx-adc: Document vref-supply
> 
>  .../bindings/iio/adc/lpc32xx-adc.txt          |  5 ++
>  drivers/iio/adc/lpc32xx_adc.c                 | 59 +++++++++++++------
>  2 files changed, 47 insertions(+), 17 deletions(-)
> 
