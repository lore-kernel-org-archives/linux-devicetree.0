From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v4 01/20] dt-bindings: i2c: eeprom: Document vendor to be
 used and deprecated ones
Date: Tue, 23 May 2017 15:52:36 +0200
Message-ID: <CABxcv=kL6E61FcTGDDHYD0mmk_yawroxFt+khQ7a7K++DHqioQ@mail.gmail.com>
References: <20170522140208.24652-1-javier@dowhile0.org> <20170522140208.24652-2-javier@dowhile0.org>
 <CAL_JsqLrdyUW=h9+SMc+5Eu558KSVXuS-ABD3-kv=Q02X5TY=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLrdyUW=h9+SMc+5Eu558KSVXuS-ABD3-kv=Q02X5TY=A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Simon Horman <horms@verge.net.au>, Sekhar Nori <nsekhar@ti.com>, David Lechner <david@lechnology.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hello Rob,

On Tue, May 23, 2017 at 3:48 PM, Rob Herring <robh@kernel.org> wrote:
> On Mon, May 22, 2017 at 9:01 AM, Javier Martinez Canillas
> <javier@dowhile0.org> wrote:
>> The at24 driver allows to register I2C EEPROM chips using different vendor
>> and devices, but the I2C subsystem does not take the vendor into account
>> when matching using the I2C table since it only has device entries.
>>
>> But when matching using an OF table, both the vendor and device has to be
>> taken into account, so the exact list of supported <vendor,device> tuples
>> should be documented in the Device Tree binding document.
>>
>> But there is no need to have different manufacturers if the EEPROM chips
>> from different manufacturers are really compatible, so matching using a
>> single "atmel" vendor is enough for all chip types.
>>
>> Document in the Device Tree binding that the "atmel" manufacturer should
>> be used, and also document the manufacturers that have been deprecated.
>>
>> Suggested-by: Wolfram Sang <wsa@the-dreams.de>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
>>
>> ---
>>
>> Changes in v4:
>> - Document the manufacturers that have been deprecated (Rob Herring).
>
> I don't think that's what I said.
>
>>
>> Changes in v3: None
>> Changes in v2: None
>>
>>  Documentation/devicetree/bindings/eeprom/eeprom.txt | 14 ++++----------
>>  1 file changed, 4 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/eeprom/eeprom.txt b/Documentation/devicetree/bindings/eeprom/eeprom.txt
>> index 5696eb508e95..121499252179 100644
>> --- a/Documentation/devicetree/bindings/eeprom/eeprom.txt
>> +++ b/Documentation/devicetree/bindings/eeprom/eeprom.txt
>> @@ -2,22 +2,16 @@ EEPROMs (I2C)
>>
>>  Required properties:
>>
>> -  - compatible : should be "<manufacturer>,<type>", like these:
>> +  - compatible : should be "atmel,<type>", like these:
>>
>>         "atmel,24c00", "atmel,24c01", "atmel,24c02", "atmel,24c04",
>>         "atmel,24c08", "atmel,24c16", "atmel,24c32", "atmel,24c64",
>>         "atmel,24c128", "atmel,24c256", "atmel,24c512", "atmel,24c1024"
>>
>> -       "catalyst,24c32"
>> +       The following manufacturers values have been deprecated:
>> +       "at", "at24", "catalyst", "microchip", "nxp", "ramtron", "renesas", "st"
>
> Only at and at24 should be deprecated.
>

Yes, I also fixed that on v5. Could you please take a look to that
version instead?

Best regards,
Javier
