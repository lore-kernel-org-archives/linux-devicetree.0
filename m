From: Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH 2/5] dt-bindings: iio: adc: lpc32xx-adc: Document
 vref-supply
Date: Sat, 9 Feb 2019 20:07:36 +0200
Message-ID: <8bc7bfcf-ad04-0615-1735-c2bbf20b7861@mleia.com>
References: <20190208160944.13281-1-gregory.clement@bootlin.com>
 <20190208160944.13281-3-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190208160944.13281-3-gregory.clement@bootlin.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi Gregory,

On 02/08/2019 06:09 PM, Gregory CLEMENT wrote:
> As most of the other ADC the lpc32xx one use a vref-supply property:
> document it.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/lpc32xx-adc.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/lpc32xx-adc.txt b/Documentation/devicetree/bindings/iio/adc/lpc32xx-adc.txt
> index b3629d3a9adf..3a1bc669bd51 100644
> --- a/Documentation/devicetree/bindings/iio/adc/lpc32xx-adc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/lpc32xx-adc.txt
> @@ -6,6 +6,10 @@ Required properties:
>    region.
>  - interrupts: The ADC interrupt
>  
> +Optional:
> + - vref-supply: The regulator supply ADC reference voltage, optional
> +   for legacy reason, but highly encouraging to us in new device tree
> +

here vref-supply voltage is 3.3v only, I think that might be a reason why
the property is omitted.

My concern is that the documentation shall not contain sections with
description of properties found in the past for 'legacy reasons', if you
like to support the backward compatibility in the driver, please update
the documentation to the expected state and add a stub to care about
legacy DTBs in the driver only.

FWIW I personally don't mind about breaking the backward compatibility
for NXP LPC32xx, it might be a concern when CONFIG_ARM_ATAG_DTB_COMPAT=y
is removed from the lpc32xx_defconfig though.

>  Example:
>  
>  	adc@40048000 {
> @@ -13,4 +17,5 @@ Example:
>  		reg = <0x40048000 0x1000>;
>  		interrupt-parent = <&mic>;
>  		interrupts = <39 0>;
> +		vref-supply = <&vcc>;
>  	};
> 

I kindly ask you to include me to To: list, if you send another changes for
NXP LPC32xx platform.

Thank you.

--
Best wishes,
Vladimir
