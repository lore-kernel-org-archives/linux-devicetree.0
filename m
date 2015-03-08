MIME-Version: 1.0
In-Reply-To: <54F8D9F6.3040003@linaro.org>
References: <1425548685-12887-1-git-send-email-srinivas.kandagatla@linaro.org>
	<1425548765-13019-1-git-send-email-srinivas.kandagatla@linaro.org>
	<CAL_Jsq+wrZYn82otDfLsTVpgmhLFWtzRHQ4v+qn-Ks--ZpXR8Q@mail.gmail.com>
	<54F8D9F6.3040003@linaro.org>
Date: Sun, 8 Mar 2015 17:19:23 -0500
Message-ID: <CAL_Jsq+JK2nbuAQXiHjOKEx2qMy+ahKVrQHBg_XKUHYXEc-UwQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] eeprom: Add bindings for simple eeprom framework
From: Rob Herring <robherring2@gmail.com>
Content-Type: text/plain; charset=UTF-8
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kumar Gala <galak@codeaurora.org>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Mar 5, 2015 at 4:34 PM, Srinivas Kandagatla <srinivas.kandagatla@linaro.org> wrote:
>>> +
>>> +For example:
>>> +
>>> +       /* Provider */
>>> +       qfprom: qfprom@00700000 {
>>> +               compatible      = "qcom,qfprom";
>>> +               reg             = <0x00700000 0x1000>;
>>> +               ...
>>> +
>>> +               /* Data cells */
>>> +               tsens_calibration: calib@404 {
>>> +                       reg = <0x404 0x10>;
>>> +               };
>>> +
>>> +               serial_number: sn {
>>> +                       reg = <0x104 0x4>, <0x204 0x4>, <0x30c 0x4>;
>>> +
>>> +               };
>>> +               ...
>>> +       };
>>> +
>>> += Data consumers =
>>> +Are drivers which consume eeprom data cells.
>>
>>
>> s/drivers/device nodes/
>>
> Thats true, "device nodes" makes sense.
>>>
>>> +
>>> +Required properties:
>>> +
>>> +eeproms: List of phandle and data cell the device might be interested
>>> in.
>>> +
>>> +Optional properties:
>>> +
>>> +eeprom-names: List of data cell name strings sorted in the same order
>>> +             as the resets property. Consumers drivers will use
>>
>>
>> resets?
>
> Opps..
> I remember fixing this, I will take care of it in next version.
>>
>>
>>> +             eeprom-names to differentiate between multiple cells,
>>> +             and hence being able to know what these cells are for.
>>
>>
>> Is this still needed? The sub-node name defines the name. Or you can
>> use reg-names with-in the sub-node.
>
> Yes, eeprom-names is needed in the consumer nodes, where there are multiple
> eeproms cells, its easy to lookup by name rather than index,which depends on
> the order of the entries.

Can you give an example with multiple entries? What would be the advantage of multiple entries in a node versus multiple nodes? 

Your usage is a bit broken. 

> reg-names inside the "data cells" is ok, but I can't think of its use
> immediately. May be useful for debug?

As a replacement for eeprom-names is what I had in mind. 

Rob

>
> --srini
>
>>
>>
>>
>> Rob
>>
>>> +
>>> +For example:
>>> +
>>> +       tsens {
>>> +               ...
>>> +               eeproms = <&tsens_calibration>;
>>> +               eeprom-names = "calibration";
>>> +       };
>>> --
>>> 1.9.1
>>>
>
