From: Kapil Hali <kapilh@broadcom.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: add SMP enable-method for Broadcom
 NSP
Date: Sun, 6 Dec 2015 23:59:28 +0530
Message-ID: <56647E88.6040002@broadcom.com>
References: <1448987049-17041-1-git-send-email-kapilh@broadcom.com>
 <1448987049-17041-2-git-send-email-kapilh@broadcom.com>
 <20151202152604.GA20467@rob-hp-laptop> <565F16F1.9070809@broadcom.com>
 <CAL_JsqLQuXzLpFJj7b=_pPN1Tp66P2o69bytxGPHCQu30Qy_CQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLQuXzLpFJj7b=_pPN1Tp66P2o69bytxGPHCQu30Qy_CQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Lee Jones <lee@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Kever Yang <kever.yang@rock-chips.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Olof Johansson <olof@lixom.net>, Paul Walmsley <paul@pwsan.com>, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bcm-k
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 12/6/2015 6:22 AM, Rob Herring wrote:
> On Wed, Dec 2, 2015 at 10:06 AM, Kapil Hali <kapilh@broadcom.com> wrote:
>> Hi Rob,
>>
>> On 12/2/2015 8:56 PM, Rob Herring wrote:
>>> On Tue, Dec 01, 2015 at 11:24:05AM -0500, Kapil Hali wrote:
>>>> Add a compatible string "brcm,bcm-nsp-smp" for Broadcom's
>>>> Northstar Plus CPU to the 32-bit ARM CPU device tree binding
>>>> documentation file and create a new binding documentation for
>>>> Northstar Plus CPU.
>>>>
>>>> Signed-off-by: Kapil Hali <kapilh@broadcom.com>
>>>> ---
>>>>  .../bindings/arm/bcm/brcm,nsp-cpu-method.txt       | 39 ++++++++++++++++++++++
>>>>  Documentation/devicetree/bindings/arm/cpus.txt     |  1 +
>>>>  2 files changed, 40 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
>>>> new file mode 100644
>>>> index 0000000..bf08872
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
>>>> @@ -0,0 +1,39 @@
>>>> +Broadcom Northstar Plus SoC CPU Enable Method
>>>> +---------------------------------------------
>>>> +This binding defines the enable method used for starting secondary
>>>> +CPUs in the following Broadcom SoCs:
>>>> +  BCM58522, BCM58525, BCM58535, BCM58622, BCM58623, BCM58625, BCM88312
>>>> +
>>>> +The enable method is specified by defining the following required
>>>> +properties in the "cpus" device tree node:
>>>> +  - enable-method = "brcm,bcm-nsp-smp";
>>>> +  - secondary-boot-reg = <...>;
>>>
>>> Both of these are supposed to be per cpu core.
>>
>> 'enable-method' if not found in 'cpu' node is looked at in the 'cpus'
>> node. Except for two-three SoC families, 'enable-method' is within
>> 'cpus' node. Is my interpretation incorrect? Did I miss anything here?
> 
> I'm not sure how you counted, but it is much more than 2-3 that are
> correct (including all of PPC). It is quite mixed in dts files, but it
> is documented to be per cpu node, so lets follow the documentation
> please.
> 
> Rob
> 
I looked at arch/arm/* and not other arch types. But, as you said, let
us keep it how it is in documentation and I have already updated latest
patch set reflecting this change.

Thanks,
Kapil
