From: Boris BREZILLON <b.brezillon.dev@gmail.com>
Subject: Re: [PATCH 7/8] ASoC: atmel: document clock properties of the wm8904
 driver
Date: Mon, 17 Mar 2014 12:24:41 +0100
Message-ID: <5326DB79.50501@gmail.com>
References: <1395049541-28128-1-git-send-email-voice.shen@atmel.com> <1395049541-28128-8-git-send-email-voice.shen@atmel.com> <20140317100219.GB8070@e106331-lin.cambridge.arm.com> <5326CBE0.1000309@overkiz.com> <20140317104804.GE8070@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140317104804.GE8070@e106331-lin.cambridge.arm.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, boris brezillon <b.brezillon@overkiz.com>
Cc: Bo Shen <voice.shen@atmel.com>, Mark Brown <broonie@kernel.org>, "nicolas.ferre@atmel.com" <nicolas.ferre@atmel.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Mark Brown <broonie@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Le 17/03/2014 11:48, Mark Rutland a =C3=A9crit :
> On Mon, Mar 17, 2014 at 10:18:08AM +0000, boris brezillon wrote:
>> Hello Mark,
>>
>> Le 17/03/2014 11:02, Mark Rutland a =C3=A9crit :
>>> On Mon, Mar 17, 2014 at 09:45:40AM +0000, Bo Shen wrote:
>>>> From: Boris BREZILLON <b.brezillon@overkiz.com>
>>>>
>>>> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
>>>> Signed-off-by: Bo Shen <voice.shen@atmel.com>
>>>> ---
>>>>
>>>>    Documentation/devicetree/bindings/sound/atmel-wm8904.txt | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/atmel-wm8904.=
txt b/Documentation/devicetree/bindings/sound/atmel-wm8904.txt
>>>> index 8bbe50c..aca341c 100644
>>>> --- a/Documentation/devicetree/bindings/sound/atmel-wm8904.txt
>>>> +++ b/Documentation/devicetree/bindings/sound/atmel-wm8904.txt
>>>> @@ -3,6 +3,8 @@ Atmel ASoC driver with wm8904 audio codec complex
>>>>    Required properties:
>>>>      - compatible: "atmel,asoc-wm8904"
>>>>      - atmel,model: The user-visible name of this sound complex.
>>>> +  - clocks: A list of clocks needed by the wm8904 chip.
>>>> +  - clock-output-names: Driver related clock names. Shall contain=
 "pck0".
>>> The word "driver"  doesn't need to appear in biding documents, and =
this
>>> fails to describe what it sets out to. How about the following:
>>>
>>> - clocks: a list of phandle + clock-specifier pairs, one for each e=
ntry
>>>     in clock-names.
>> Agreed.
>>> - clock-names: Should contain "pck0"
>> After thinking a bit more about it, this can be any programmable clk=
 (pckX).
> Huh?
>
> The clock-names property describes the names of the inputs to the
> device, from the view of the device, not the names of the clocks fed
> into those inputs.
>
> What are the names of the clock input lines on the wm8904?

mclk, and you're right, this is how we should name the clk (I just got
influenced by the existing driver, which was requesting pck0).

This gives the following:

- clock-names: Should contain "mclk"

Do you agree ?

>
> Cheers,
> Mark.

