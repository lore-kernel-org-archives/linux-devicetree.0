From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: reset: Add document for Broadcom STB
 reset controller
Date: Fri, 11 Jan 2019 10:51:36 -0800
Message-ID: <6d2183a3-ec16-70a4-8cc8-ca7640dba387@gmail.com>
References: <20181221013409.14324-1-f.fainelli@gmail.com>
 <20181221013409.14324-2-f.fainelli@gmail.com> <20190103174117.GA6613@bogus>
 <2a54c2cf-5595-ade5-fb29-40e8b6d3133e@gmail.com>
 <20190103191915.GB6613@bogus>
 <bcfe4df0-8928-90e2-6460-1391320af9be@gmail.com>
 <CAL_JsqKpFYnnAY-feAeJ-Va5yS7JH34FOzvBmTi4gMV=kjbCVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqKpFYnnAY-feAeJ-Va5yS7JH34FOzvBmTi4gMV=kjbCVQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Gregory Fong <gregory.0xf0@gmail.com>, Brian Norris <computersforpeace@gmail.com>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 1/3/19 2:54 PM, Rob Herring wrote:
> On Thu, Jan 3, 2019 at 1:31 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> On 1/3/19 11:19 AM, Rob Herring wrote:
>>> On Thu, Jan 03, 2019 at 10:53:25AM -0800, Florian Fainelli wrote:
>>>> On 1/3/19 9:41 AM, Rob Herring wrote:
>>>>> On Thu, Dec 20, 2018 at 05:34:08PM -0800, Florian Fainelli wrote:
>>>>>> Add a binding document for the Broadcom STB reset controller, also known
>>>>>> as SW_INIT-style reset controller.
>>>>>>
>>>>>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>>>>>> ---
>>>>>>  .../devicetree/bindings/reset/brcm,reset.txt  | 27 +++++++++++++++++++
>>>>>>  1 file changed, 27 insertions(+)
>>>>>>  create mode 100644 Documentation/devicetree/bindings/reset/brcm,reset.txt
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/reset/brcm,reset.txt b/Documentation/devicetree/bindings/reset/brcm,reset.txt
>>>>>> new file mode 100644
>>>>>> index 000000000000..6e5341b4f891
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/reset/brcm,reset.txt
>>>>>> @@ -0,0 +1,27 @@
>>>>>> +Broadcom STB SW_INIT-style reset controller
>>>>>> +===========================================
>>>>>> +
>>>>>> +Broadcom STB SoCs have a SW_INIT-style reset controller with separate
>>>>>> +SET/CLEAR/STATUS registers and possibly multiple banks, each of 32 bit
>>>>>> +reset lines.
>>>>>> +
>>>>>> +Please also refer to reset.txt in this directory for common reset
>>>>>> +controller binding usage.
>>>>>> +
>>>>>> +Required properties:
>>>>>> +- compatible: should be brcm,brcmstb-reset
>>>>>> +- reg: register base and length
>>>>>> +- #reset-cells: must be set to 1
>>>>>> +
>>>>>> +Example:
>>>>>> +
>>>>>> +  reset: reset-controller@8404318 {
>>>>>> +          compatible = "brcm,brcmstb-reset";
>>>>>> +          reg = <0x8404318 0x30>;
>>>>>
>>>>> Based on this address, should this be a sub-node of something else? Or
>>>>> not even a sub-node and just make the parent be a reset provider?
>>>>
>>>> The reset controller is part of a larger "sundry" node which has a
>>>> collection of functionality, from pinmux/pinctrl, reset controller,
>>>> spare bits, chicken bits, anything the designers forgot to put somewhere
>>>> else and decided to put there.
>>>>
>>>> If there is one thing consistent though is that given a set of 32-bit
>>>> register groups, they have a self contained functionality such that you
>>>> can break up the larger "sundry" space into smaller sub-blocks which
>>>> have one an only one functionality. Do you think this warrants a
>>>> different representation in Device Tree?
>>>
>>> With pinctrl in the mix, you're going to need sub-nodes anyways. So just
>>> define what this is a sub-node of.
>>
>> pinctrl is not necessarily something I want the kernel to control, since
>> we have a high level scripting language without our bootloader that
>> makes sure pinctrl is properly configured from early boot on all the way
>> to the kernel, and preserved across suspend/resume states.
>> pinctrl-single does work, and was occasionally used. Everything else is
>> typically muxes that the kernel does not need to touch/see/be aware of.
> 
> That's good. I'd rather see more platforms do that rather than have
> the kernel handle it. OTOH, bootloaders often use DT too, so maybe who
> handles pin muxing is irrelevant.
> 
>>> Also, I'd prefer to have complete example for the "sundry" node and
>>> child nodes than partial examples spread across the tree.
>>
>> I am afraid I can't provide that example because the sundry node is
>> really changing from chip to chip, and there is a gazillion of things in
>> there that the kernel typically does not even touch, like
>> pinmuxing/pinctrl, various mux selections etc. I could provide the
>> following example if that is what you are requesting?:
>>
>>
>> sun-top-ctrl: simple-bus@8404000 {
>>         compatible = "brcm,brcmstb-sun-top-ctrl", "simple-bus";
>>         reg = <0x8404000 0x708>;
>>
>>         reset: reset-controller@318 {
>>                 compatible = "brcm,brcmstb-reset";
>>                 reg = <0x318 0x30>;
>>                 #reset-cells = <1>;
>>         };
>> };
>>
>> Would that be what you expect to see?
> 
> The problem is with this alone, you should just move #reset-cells to
> the parent and remove the child node. That's all you really need from
> a DT perspective. But if this is really a separate block that's reused
> from chip to chip, then a separate node is fine. Typically in these
> situations, I just can't tell whether it's that or just the
> convenience of creating nodes for every kernel driver.

I found a couple of occurrences where the same HW block is used outside
of this sundry register block and also got confirmation from the
designers that the same block gets re-used from chip to chip, and
happens to get "wired" into the bus address decoding logic as part of
this sundry block for convenience and principle of least surprise.
-- 
Florian
