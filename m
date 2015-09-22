From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH 1/3] Documentation: tps65912: Add DT bindings for the
 TPS65912 PMIC
Date: Tue, 22 Sep 2015 14:58:44 -0500
Message-ID: <5601B2F4.6090706@ti.com>
References: <1442339861-30300-1-git-send-email-afd@ti.com>
 <1442339861-30300-2-git-send-email-afd@ti.com> <20150920041630.GE3039@x1>
 <56003101.50107@ti.com> <20150921230725.GB11284@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150921230725.GB11284@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/21/2015 06:07 PM, Lee Jones wrote:
> On Mon, 21 Sep 2015, Andrew F. Davis wrote:
>> On 09/19/2015 11:16 PM, Lee Jones wrote:
>>> On Tue, 15 Sep 2015, Andrew F. Davis wrote:
>>>
>>>> The TPS65912 PMIC contains several regulators and a GPIO controller.
>>>> Add bindings for the TPS65912 PMIC.
>>>>
>>>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>>>> ---
>>>>   .../devicetree/bindings/gpio/gpio-tps65912.txt     | 17 +++++++++
>>>>   Documentation/devicetree/bindings/mfd/tps65912.txt | 43 ++++++++++++++++++++++
>>>>   .../bindings/regulator/tps65912-regulator.txt      | 32 ++++++++++++++++
>>>>   3 files changed, 92 insertions(+)
>>>>   create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tps65912.txt
>>>>   create mode 100644 Documentation/devicetree/bindings/mfd/tps65912.txt
>>>>   create mode 100644 Documentation/devicetree/bindings/regulator/tps65912-regulator.txt
>
> [...]
>
>>>> +Optional nodes:
>>>> + - Regulators: Documentation/devicetree/bindings/regulator/tps65912-regulator.txt
>>>> + - GPIO: Documentation/devicetree/bindings/gpio/gpio-tps65912.txt.
>>>
>>> Better to use ../gpio, ../regulator, etc.
>>>
>>> "Regulators" and "GPIO" aren't valid node names.
>>>
>>> Please be more specific.
>>>
>>
>> OK, I'll see if I can clear this up.
>
> [...]
>
>>>> +Optional properties:
>>>> + - Any optional property defined in bindings/regulator/regulator.txt
>>>
>>> ../regulator/...
>>>
>>
>> Not really sure what you mean here?
>
> Same as above.  Use "../regulator/regulator.txt" instead.
>

Oh, I see, fixed.
