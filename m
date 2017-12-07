From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [RESEND PATCH v3 2/2] ARM64: dts: meson-axg: add pinctrl DT info
 for Meson-AXG SoC
Date: Thu, 7 Dec 2017 07:52:52 -0800
Message-ID: <CAOi56cXtSjsNjOWLEwzox7nCGnG-WOOzPkM1+MSvaPnyOtLuZw@mail.gmail.com>
References: <20171120102354.5354-1-yixun.lan@amlogic.com> <20171120102354.5354-3-yixun.lan@amlogic.com>
 <7htvx3r4o7.fsf@baylibre.com> <9d28dcdf-655b-a843-1f21-24ebb1f27be3@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9d28dcdf-655b-a843-1f21-24ebb1f27be3@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <carlo@caione.org>, Xingyu Chen <xingyu.chen@amlogic.com>, devicetree <devicetree@vger.kernel.org>, linux-gpio@vger.kernel.org, linux-amlogic <linux-amlogic@lists.infradead.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 6, 2017 at 5:44 PM, Yixun Lan <yixun.lan@amlogic.com> wrote:
> Hi Kevin
>
>
> On 12/07/17 04:18, Kevin Hilman wrote:
>> Yixun Lan <yixun.lan@amlogic.com> writes:
>>
>>> From: Xingyu Chen <xingyu.chen@amlogic.com>
>>>
>>> Add new pinctrl DT info for the Amlogic's Meson-AXG SoC.
>>>
>>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>>> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
>>> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
>>> ---
>>>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 44 ++++++++++++++++++++++++++++++
>>>  1 file changed, 44 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>>> index 5fc33b76b91c..e0fb860e12c5 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>>> @@ -9,6 +9,7 @@
>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>  #include <dt-bindings/clock/axg-clkc.h>
>>>  #include <dt-bindings/clock/axg-aoclkc.h>
>>
>> This doesn't apply because this aoclkc.h header does not exist in
>> mainline.
>>
>> Kevin
>>
>
> this is due to I create the patch in serial sequence (first clk, then
> pinctrl), I probably will fix my work flow next time - to rebase all the
> patch separately on the -rc version
>
> but here, the pinctrl DT part has no dependency on DT clk patch..
> you could drop the above two #include and just apply the reset
>
> could you amend & apply this? or do you want me to send another updated
> version?

I prefer that you rebase (either on -rc or my v4.16/dt64 branch[1]) and resend.

Thanks,

Kevin

[1] https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git/log/?h=v4.16/dt64
