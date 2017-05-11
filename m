MIME-Version: 1.0
In-Reply-To: <1702237.66ccflAQAJ@kerker>
References: <1494406408-31760-1-git-send-email-stefan.wahren@i2se.com>
	<1494406408-31760-16-git-send-email-stefan.wahren@i2se.com>
	<1702237.66ccflAQAJ@kerker>
Date: Thu, 11 May 2017 15:38:01 -0500
Message-ID: <CAL_Jsq+qLnC8v2+9OPgiT1k9W7CzwAJGKviL9B2pDVd=9kzmZg@mail.gmail.com>
Subject: Re: [PATCH v5 15/17] dt-bindings: qca7000: append UART interface to binding
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Michael Heimpold <mhei@heimpold.de>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, May 11, 2017 at 2:12 PM, Michael Heimpold <mhei@heimpold.de> wrote:
> Hi,
>
> Am Mittwoch, 10. Mai 2017, 10:53:26 CEST schrieb Stefan Wahren:
>> This merges the serdev binding for the QCA7000 UART driver (Ethernet over
>> UART) into the existing document.
>>
>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
>> ---
>>  .../devicetree/bindings/net/qca-qca7000.txt        | 32
>> ++++++++++++++++++++++ 1 file changed, 32 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qca-qca7000.txt
>> b/Documentation/devicetree/bindings/net/qca-qca7000.txt index
>> a37f656..08364c3 100644
>> --- a/Documentation/devicetree/bindings/net/qca-qca7000.txt
>> +++ b/Documentation/devicetree/bindings/net/qca-qca7000.txt
>> @@ -54,3 +54,35 @@ ssp2: spi@80014000 {
>>               local-mac-address = [ A0 B0 C0 D0 E0 F0 ];
>>       };
>>  };
>> +
>> +(b) Ethernet over UART
>> +
>> +In order to use the QCA7000 as UART slave it must be defined as a child of
>> a +UART master in the device tree. It is possible to preconfigure the UART
>> +settings of the QCA7000 firmware, but it's not possible to change them
>> during +runtime.
>> +
>> +Required properties:
>> +- compatible        : Should be "qca,qca7000-uart"
>
> I already discussed this with Stefan off-list a little bit, but I would like
> to bring this to a broader audience: I'm not sure whether the compatible
> should contain the "-uart" suffix, because the hardware chip is the very same
> QCA7000 chip which can also be used with SPI protocol.
> The only difference is the loaded firmware within the chip which can either
> speak SPI or UART protocol (but not both at the same time - due to shared
> pins). So the hardware design decides which interface type is used.
>
> At the moment, this patch series adds a dedicated driver for the UART
> protocol, in parallel to the existing SPI driver. So a different compatible
> string is needed here to match against the new driver.
>
> An alternative approach would be to re-use the existing compatible string
> "qca,qca7000" for both, the SPI and UART protocol, because a "smarter"
> (combined) driver would detect which protocol to use. For example the driver
> could check for spi-cpha and/or spi-cpol which are required for SPI protocol:
> if these exists the driver could assume that SPI must be used, if both are
> missing then UART protocol should be used.

In general this wouldn't work if the default SPI mode is used. Then
maybe you rely on reg property instead. But that all seems a little
fragile to me.

> (This way it would not be necessary to check whether the node is a child of
> a SPI or UART master node - but maybe this is even easier - I don't know)

It's the other way around. The parent controls init/probing of the
children. Maybe another OS could do things differently I suppose.

> Or in shorter words: my concern is that while "qca7000-uart" describes the
> hardware, it's too closely coupled to the driver implementation. Having
> some feedback of the experts would be nice :-)

It's true that we don't really need the interface as part of the
compatible, but I don't think it really hurts anything to have
something more specific. The firmware is also part of the hardware, so
a compatible that also implies firmware operation is not uncommon. I'm
fine either way.

Rob
