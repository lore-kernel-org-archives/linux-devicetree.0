From: boris brezillon <b.brezillon@overkiz.com>
Subject: Re: [RFC PATCH 6/9] mtd: nand: add sunxi NFC dt bindings doc
Date: Thu, 09 Jan 2014 09:31:22 +0100
Message-ID: <52CE5E5A.6050209@overkiz.com>
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com> <1389190924-26226-7-git-send-email-b.brezillon@overkiz.com> <201401082228.55807.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <201401082228.55807.arnd@arndb.de>
Sender: linux-doc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, David Woodhouse <dwmw2@infradead.org>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/01/2014 22:28, Arnd Bergmann wrote:
> On Wednesday 08 January 2014, Boris BREZILLON wrote:
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
>> @@ -0,0 +1,71 @@
>> +Allwinner NAND Flash Controller (NFC)
>> +
>> +Required properties:
>> +- compatible : "allwinner,sun4i-nfc".
>> +- reg : shall contain registers location and length for data and reg.
>> +- interrupts : shall define the NFC interrupt.
>> +- #address-cells: shall be set to 1. Encode the nand CS.
>> +- #size-cells : shall be set to 0.
>> +- clocks : shall reference NFC clocks.
>> +- clock-names : NFC internal clock names. Shall contain :
>> +    * "ahb_clk" : AHB gating clock
>> +    * "sclk" : NFC clock
>> +
> One small request: Can we try to avoid the "NFC" name here? I think it's
> too overloaded and people may confuse it with near-field communication,
> which I'm sure will be supported in sunxi based devices at some point.
>
> It doesn't hurt to also mention that the function block is called
> nfc, but I think references to it are better named "nand", which is
> less confusing.

Sure, I'll remove references to the NFC acronym:
  - change compatible string to "allwinner,sun4i-nand"
  - avoid NFC references in the doc
  - rename the driver into sunxi-nand.c (formerly sunxi_nfc.c)

Do you see any other references to this acronym ?


Best Regards,

Boris
> 	Arnd

