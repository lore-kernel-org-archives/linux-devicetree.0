From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC v2 4/5] DT bindings documentation for Synopsys UDC platform driver
Date: Fri, 20 Jan 2017 07:58:45 -0600
Message-ID: <CAL_JsqJcEFwBGVcmP8Jy1w55nHtmN=-42pAMd011n+z0+=U46A@mail.gmail.com>
References: <1484640308-25976-1-git-send-email-raviteja.garimella@broadcom.com>
 <1484640308-25976-5-git-send-email-raviteja.garimella@broadcom.com>
 <20170119173659.jeao5pqtlepmidek@rob-hp-laptop> <f86f32cd-8fed-c30f-d647-8f7992013458@broadcom.com>
 <95544a16-08aa-f983-465c-e557b4d3785e@gmail.com> <dce7e46f-66f7-7c8d-182d-ba8347082b52@broadcom.com>
 <efabd5cc-eafb-0887-852e-24b0f52019cf@gmail.com> <87d20899-9e79-5d10-f6c0-c443f586c2e6@broadcom.com>
 <4e086b59-fdca-729a-149f-85967604310f@broadcom.com> <5ec22ba3-6753-3f62-77b0-1715a53e8fea@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5ec22ba3-6753-3f62-77b0-1715a53e8fea@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <scott.branden@broadcom.com>
Cc: Ray Jui <ray.jui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Raviteja Garimella <raviteja.garimella@broadcom.com>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, Linux USB List <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 19, 2017 at 4:56 PM, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> On 01/19/2017 02:36 PM, Scott Branden wrote:
>>>>> The driver stands alone from the SoC and does not need compatibility
>>>>> strings per SoC.  New SoCs will use the exact same block.
>>>>
>>>> Even if you take the exact same block and put it in a different SoC,
>>>> that's still an integration work that 99% of the time goes just fine
>>>> because the validation worked great, and the 1% of the time where you
>>>> need to capture an integration bug, you are glad this SoC-specific
>>>> compatible string exists such that you can work around it in the driver.
>>>
>>> That's a very conservative estimate. Based on my experience, it's more
>>> like 50/50, i.e., roughly half of the time we found SoC integration
>>> specific quirks or workaround are needed.
>>>
>> 50% is an exaggeration for sure.  Maybe a driver you are has that issue
>> but that is not the case with most drivers.  We have many IP blocks in
>> the SoC - both internal and externally sourced IP.  We integrate SP805
>> timer driver into many SoCs and never specify a SoC specific
>> compatibility string with it (nor should we).

Even if it was only 10%, that's still reason to do it.

> Well, that's a good example where in premise, each SoC vendor
> integrating such a peripheral from a third party should actually have
> defined its own SoC/vendor compatible string to document the
> integration. And you can sometimes see some vendors having to workaround
> such essential peripherals and ending-up documenting compatible strings
> (or close enough in the example at [1]).

ARM peripherals are a bit unique because they have ID registers and
vendors tend to change them if they change the IP. And we can also set
the ID in the DT.

It's also a huge difference between a timer and a USB controller.
There's very little in a timer that vendors can f*ck up as well as few
revisions and config options. Experience has shown that USB always
gets integrated in different ways. We can't even get the number of
clocks right on licensed IP blocks. Like many things, there is a
judgement call here.

> [1]: http://www.spinics.net/lists/devicetree/msg159585.html
>
> It's a bad example though in that it's an IP that came from ARM, so the
> confidence level in getting the integration right is just higher
> (typically above level 9000), because ripping apart a third party is
> governed by strict architecture licensing agreements that usually
> prevents people suffering from the Not Invented Here syndrome from
> making damage.
>
>>
>> That being said - if your driver needs to know SoC specifics is should
>> not need to have an SoC specific compatibility string added per driver.
>> Why can your driver just not query that information from the upper level
>> SoC specific info already present in device tree?
>
> You could do that, but that just does not happen to be a common or
> recommended practice AFAICT, although I could be just wrong here of course.

We did a lot of work to get rid machine_is_X(). Let's say you have 10
SoCs and 5 have a quirk in a device and 5 don't. You need 2 device
compatible strings to match in that case. If you check at the top
level you may have to check 5 strings because you can't claim all 5
SoCs to be compatible with each other (that only works for
sub/supersets). You would also have to update the driver for new SoCs
depending if they had the quirk or not.

>> Each SoC is already specified in device tree at the upper level already.
>> Example:
>> arch/arm/boot/dts/bcm7445.dtsi has this compatibility info already
>> present in its device tree:
>>
>>     compatible = "brcm,bcm7445", "brcm,brcmstb";
>>
>> If needed, a driver should query this info rather than adding SoC
>> specific compatibility strings to every single device tree entry.
>
> Or you could just put it in the compatible string list for a given
> peripheral, and yes, this is a repetition of information that is already
> there at a higher level from that particular node, but, it has the
> advantage of making all this information self contained within that
> node's context, and that's a good design goal.
>
>>
>> We should only add driver revision numbers as needed, not SoC specific
>> names.  That way drivers don't change when the (same revision) of the IP
>> block is added to a new SoCs.  And then if a SoC specific workaround is
>> needed the upper level compatibility string can be queried should be
>> utilized.  It already exists today and is available for use to all drivers.
>
> The point is to plan ahead for information that you *may*, but *wish*
> you did not need.
>
> Quite frankly, I don't think you are going to win any argument where you
> don't add a SoC compatible string to the binding, because there are tons
> of precedents and good practices that suggest doing it. You might as
> well just do it, it's documented, it's there, if you end up using it or
> not, that's totally up to the driver author.

Right.

Rob
