From: Boris BREZILLON <b.brezillon.dev@gmail.com>
Subject: Re: [RFC PATCH v2 09/14] mtd: nand: add sunxi NFC dt bindings doc
Date: Wed, 29 Jan 2014 19:01:40 +0100
Message-ID: <52E94204.1050207@gmail.com>
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com>	<1391006064-28890-10-git-send-email-b.brezillon.dev@gmail.com> <CAL_JsqLVr1gSLArqtfOiHce+u6ZK8FiKMX0o9bvMrMoGGhATvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLVr1gSLArqtfOiHce+u6ZK8FiKMX0o9bvMrMoGGhATvg@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, David Woodhouse <dwmw2@infradead.org>, Grant Likely <grant.likely@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mtd@lists.infradead.org, dev@linux-sunxi.org
List-Id: devicetree@vger.kernel.org

Hello Rob,

Le 29/01/2014 18:11, Rob Herring a =E9crit :
> On Wed, Jan 29, 2014 at 8:34 AM, Boris BREZILLON
> <b.brezillon.dev@gmail.com> wrote:
>> Add the sunxi NAND Flash Controller dt bindings documentation.
>>
>> Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
>> ---
>>   .../devicetree/bindings/mtd/sunxi-nand.txt         |   46 ++++++++=
++++++++++++
>>   1 file changed, 46 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/sunxi-nan=
d.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/=
Documentation/devicetree/bindings/mtd/sunxi-nand.txt
>> new file mode 100644
>> index 0000000..b0e55a3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
>> @@ -0,0 +1,46 @@
>> +Allwinner NAND Flash Controller (NFC)
>> +
>> +Required properties:
>> +- compatible : "allwinner,sun4i-nand".
>> +- reg : shall contain registers location and length for data and re=
g.
>> +- interrupts : shall define the nand controller interrupt.
>> +- #address-cells: shall be set to 1. Encode the nand CS.
>> +- #size-cells : shall be set to 0.
>> +- clocks : shall reference nand controller clocks.
>> +- clock-names : nand controller internal clock names. Shall contain=
 :
>> +    * "ahb_clk" : AHB gating clock
>> +    * "sclk" : nand controller clock
>> +
>> +Optional children nodes:
>> +Children nodes represent the available nand chips.
>> +
>> +Optional properties:
> For the controller or per nand chip?
>
>> +- onfi,nand-timing-mode : mandatory if the chip does not support th=
e ONFI
>> +  standard.
> Add to generic nand binding.
>
>> +- allwinner,rb : shall contain the native Ready/Busy ids.
>> + or
>> +- rb-gpios : shall contain the gpios used as R/B pins.
> Isn't allwinner,rb implied by a lack of rb-gpios property. Or no R/B
> pin is an option?
Both are optional. In case none of the properties are defined the dev_r=
eady
callback is set to NULL and the nand_base waiting loop is used.

> If so, don't you need some fixed time delay
> properties like max erase time?

This is handled in nand_base (using the chip_delay field), but I guess=20
we could
use the information retrieved from nand timings and the operation in=20
progress...

> rb-gpios could be added to the generic nand binding as well.
Sure.
>
> Rob

