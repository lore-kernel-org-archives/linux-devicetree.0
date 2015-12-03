From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] Device tree binding documentation for chromeos-firmware
Date: Thu, 3 Dec 2015 09:08:24 -0600
Message-ID: <CAL_JsqJGk5_Nk7joSHfJXxcVrpHDBbawY=nPOrOiraWinuka4w@mail.gmail.com>
References: <1448997171-7064-1-git-send-email-martyn.welch@collabora.co.uk>
 <1448997171-7064-2-git-send-email-martyn.welch@collabora.co.uk>
 <20151202151552.GA11101@rob-hp-laptop> <56601611.6010800@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56601611.6010800@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 3, 2015 at 4:14 AM, Martyn Welch
<martyn.welch@collabora.co.uk> wrote:
>
> On 02/12/15 15:15, Rob Herring wrote:
>>
>> On Tue, Dec 01, 2015 at 07:12:49PM +0000, Martyn Welch wrote:
>>>
>>> This patch adds documentation for the chromeos-firmware binding.
>>>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: Pawel Moll <pawel.moll@arm.com>
>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
>>> Cc: Kumar Gala <galak@codeaurora.org>
>>> Cc: devicetree@vger.kernel.org
>>> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
>>> ---
>>>   .../devicetree/bindings/misc/chromeos-firmware.txt | 27
>>> ++++++++++++++++++++++
>>
>>
>> bindings/firmware/ please.
>>
>>>   1 file changed, 27 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/misc/chromeos-firmware.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/misc/chromeos-firmware.txt
>>> b/Documentation/devicetree/bindings/misc/chromeos-firmware.txt
>>> new file mode 100644
>>> index 0000000..8240611
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/misc/chromeos-firmware.txt
>>> @@ -0,0 +1,27 @@
>
>
> <snip>
>
>>> +
>>> +Each signal is represented as a sub-node of "chromeos_firmware":
>>> +Subnode properties:
>>> +
>>> +       - gpios: OF device-tree gpio specification.
>>> +
>>> +Example nodes:
>>> +
>>> +       chromeos_firmware {
>>
>>
>> This should go under /firmware
>>
>
> I've changed this to be:
>
>         firmware {
>                 chromeos {
>                         ...
>                 };
>         ];
>
> Which I generally accept (assuming this is considered a part of the
> firmware) as a better way to represent this in the device tree, however this
> has the nasty side effect of causing the device tree parsing to avoid
> parsing the chromeos child and seeing it's compatible property (as the
> firmware node isn't a bus), resulting in the probe routine not being called.
>
> If I add a 'compatible = "simple-bus"' property to the firmware node it
> works, but this doesn't seem quite right as I believe "simple-bus" is
> defined as a "simple memory mapped bus".
>
> I /could/ rewrite the initialisation to call of_find_compatible_node(), but
> this seems rather hacky and inefficient. I can think of 2 other ways this
> could be resolved:
>
> (1) As this is only tangentially related to firmware, I rename it something
> like "chromeos-signals" and make it it's own node. In essence this driver
> provides a mechanism built on top of specific GPIO (ala gpio-keys seems to
> be, after-all this has a similar use of resources to that).

I'm starting to fail to understand the relationship to firmware here...

gpio-keys are at least a thing (being a key or set of keys). Your
grouping is a rather random collection of GPIOs. Maybe you need
"gpio-switch" binding and then the function would be "label" property.

> (2) Add a compatible string something like 'compatible="logical-group";' to
> the firmware node and add that too the bus matching logic. This would have
> the advantage of solving this in the general case (I guess there are other
> instances where a grouping of things more logically rather than physically
> connected would ideally be grouped together), though I expect there may be
> some strong views regarding this approach.

Why do you need them grouped?

> Would either of those be acceptable or is there a better way of resolving
> this that I've missed?

I don't know as I still don't really understand what the h/w looks like here.

Rob
