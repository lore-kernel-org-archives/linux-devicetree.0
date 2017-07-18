From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] pinctrl: Add DT bindings for Cortina Gemini
Date: Tue, 18 Jul 2017 11:38:05 +0200
Message-ID: <CACRpkdY3e1N=StPHa8VOSXfeBT1KxdmXAnBX+j0cjm_+Ccw6Bg@mail.gmail.com>
References: <20170715175056.13040-1-linus.walleij@linaro.org> <20170717193939.dwl2w6m47gqysvdc@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170717193939.dwl2w6m47gqysvdc@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, Janos Laube <janos.dev@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 17, 2017 at 9:39 PM, Rob Herring <robh@kernel.org> wrote:
> On Sat, Jul 15, 2017 at 07:50:52PM +0200, Linus Walleij wrote:
>> The Cortina Gemini pin controller uses the standard pin control
>> bindings for muxing functions with groups so these bindings
>> should be entirely uncontroversial.
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>>  .../bindings/pinctrl/cortina,gemini-pinctrl.txt    | 54 ++++++++++++++++++++++
>>  1 file changed, 54 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt
>> new file mode 100644
>> index 000000000000..2ef3e8a65559
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt
>> @@ -0,0 +1,54 @@
>> +Cortina Systems Gemini pin controller
>> +
>> +This pin controller is found in the Cortina Systems Gemini SoC family,
>> +see further arm/gemini.txt. It is a purely group-based multiplexing pin
>> +controller.
>> +
>> +Required properties:
>> +- compatible: "cortina,gemini-pinctrl"
>> +- regmap: phandle to the system controller node
>
> Why not a child of the system controller?

It is a child of the system controller, I just didn't show that in the
example.

And it's true, then I can just look it up from the parent.

I'll revise.

Yours,
Linus Walleij
