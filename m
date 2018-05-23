From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 8/8] dt-bindings: stm32: add compatible for syscon
Date: Wed, 23 May 2018 09:47:42 -0500
Message-ID: <CAL_JsqL1F7frrfbBOVeoaZc-C=iNKzUB0J9ggpoSKO0o4aGOCw@mail.gmail.com>
References: <1526890046-10565-1-git-send-email-christophe.roullier@st.com>
 <1526890046-10565-9-git-send-email-christophe.roullier@st.com>
 <20180522172238.GA26145@rob-hp-laptop> <4f6941a0-4b41-f2db-52b1-d45aa7287fa2@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <4f6941a0-4b41-f2db-52b1-d45aa7287fa2@st.com>
Sender: netdev-owner@vger.kernel.org
To: Christophe ROULLIER <christophe.roullier@st.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Peppe CAVALLARO <peppe.cavallaro@st.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "andrew@lunn.ch" <andrew@lunn.ch>
List-Id: devicetree@vger.kernel.org

On Wed, May 23, 2018 at 4:32 AM, Christophe ROULLIER
<christophe.roullier@st.com> wrote:
> On 05/22/2018 07:22 PM, Rob Herring wrote:
>> On Mon, May 21, 2018 at 10:07:26AM +0200, Christophe Roullier wrote:
>>> This patch describes syscon DT bindings.
>>>
>>> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
>>> ---
>>>   Documentation/devicetree/bindings/arm/stm32.txt | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/stm32.txt b/Documentation/devicetree/bindings/arm/stm32.txt
>>> index 6808ed9..e46ebad 100644
>>> --- a/Documentation/devicetree/bindings/arm/stm32.txt
>>> +++ b/Documentation/devicetree/bindings/arm/stm32.txt
>>> @@ -8,3 +8,8 @@ using one of the following compatible strings:
>>>     st,stm32f746
>>>     st,stm32h743
>>>     st,stm32mp157
>>> +
>>> +Required nodes:
>>> +- syscon: the soc bus node must have a system controller node pointing to the
>>> +  global control registers, with the compatible string
>>> +  "st,stm32mp157-syscfg", "syscon";
>>
>> Please don't mix soc/board bindings with other nodes. So perhaps
>> stm32-syscon.txt.
>>
>> Rob
>>
>
> Hi Rob,
>
> Is it ok for you with this tree file:

Yes, one nit below.

>
> Documentation/devicetree/bindings/arm/stm32/stm32.txt
> Documentation/devicetree/bindings/arm/stm32/stm32-syscon.txt
>         With stm32-syscon.txt:
>
> ---------------------------------------------------
> STMicroelectronics STM32 Platforms System Controller
>
> Properties:
>   - compatible : should contain two values. First value must be :
>                 - " st,stm32mp157-syscfg " - for stm32mp157 based SoCs,
>                 second value must be always "syscon".
>   - reg : offset and length of the register set.
>
> Example:
>         syscfg: system-config@50020000 {

syscon@...

>                 compatible = "st,stm32mp157-syscfg", "syscon";
>                 reg = <0x50020000 0x400>;
>         };
> ---------------------------------------------------
>
> Do we need to update also all MCU family (stm32f4, stm32h7, stm32f7)
> property to be coherent ?

Yes, if they all have the same or similar syscfg block.

>
> Thanks for your feedback.
>
> Christophe.
>
