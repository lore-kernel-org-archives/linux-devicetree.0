From: Grant Likely <grant.likely@arm.com>
Subject: Re: drivers binding to device node with multiple compatible strings
Date: Thu, 4 Oct 2018 10:39:33 +0100
Message-ID: <aa3341d6-8fef-40bc-783b-fbbd55b88420@arm.com>
References: <CADRPPNT0QiBkJtJnxjW95Yf-mirL5OzRrvqj8rC-O8fiz17VnA@mail.gmail.com>
 <CAL_JsqKRH8uEzSx6H6ZSRJF9Ecp4am1cNsxgQqf2OO5_aGR1zw@mail.gmail.com>
 <CADRPPNQam-QUfqDMvu42KS+50VaHfGPhCZj-1jRHQ-Od0fbxuQ@mail.gmail.com>
 <CACxGe6u2FQ8r1Ya6-mWoGcs7g2OLMccu68uskZvDLS6ows-hXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACxGe6u2FQ8r1Ya6-mWoGcs7g2OLMccu68uskZvDLS6ows-hXQ@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, leoyang.li@nxp.com
Cc: nd@arm.com, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linuxppc-dev@lists.ozlabs.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On 04/10/2018 10:32, Grant Likely wrote:
> On Fri, Sep 28, 2018 at 10:01 PM Li Yang <leoyang.li@nxp.com> wrote:
>>
>> On Fri, Sep 28, 2018 at 3:07 PM Rob Herring <robh+dt@kernel.org> wrote:
>>>
>>> On Thu, Sep 27, 2018 at 5:25 PM Li Yang <leoyang.li@nxp.com> wrote:
>>>>
>>>> Hi Rob and Grant,
>>>>
>>>> Various device tree specs are recommending to include all the
>>>> potential compatible strings in the device node, with the order from
>>>> most specific to most general.  But it looks like Linux kernel doesn't
>>>> provide a way to bind the device to the most specific driver, however,
>>>> the first registered compatible driver will be bound.
>>>>
>>>> As more and more generic drivers are added to the Linux kernel, they
>>>> are competing with the more specific vendor drivers and causes problem
>>>> when both are built into the kernel.  I'm wondering if there is a
>>>> generic solution (or in plan) to make the most specific driver bound
>>>> to the device.   Or we have to disable the more general driver or
>>>> remove the more general compatible string from the device tree?
>>>
>>> It's been a known limitation for a long time. However, in practice it
>>> doesn't seem to be a common problem. Perhaps folks just remove the
>>> less specific compatible from their DT (though that's not ideal). For
>>> most modern bindings, there's so many other resources beyond
>>> compatible (clocks, resets, pinctrl, etc.) that there are few generic
>>> drivers that can work.
>>>
>>> I guess if we want to fix this, we'd need to have weighted matching in
>>> the driver core and unbind drivers when we get a better match. Though
>>> it could get messy if the better driver probe fails. Then we've got to
>>> rebind to the original driver.
>>
>> Probably we can populate the platform devices from device tree after
>> the device_init phase?  So that all built-in drivers are already
>> registered when the devices are created and we can try find the best
>> match in one go?  For more specific loadable modules we probably need
>> to unbind from the old driver and bind to the new one.  But I agree
>> with you that it could be messy.
> 
> It's a tradeoff.

Oops! Accidentally hit send too early.

It's a tradeoff. If the platform device population is deferred until 
after all drivers are loaded, then there isn't any mechanism to ensure 
some devices get probed early in the init sequence.

As Rob said, while it is a problem in theory, there haven't been a lot 
of actual cases where it is a problem. The solution has been to either 
remove the generic match from the device, or we can blacklist particular 
devices from the generic driver.

g.


>>
>>>
>>> Do you have a specific case where you hit this?
>>
>> Maybe not a new issue but "snps,dw-pcie" is competing with various
>> "fsl,<chip>-pcie" compatibles.  Also a specific PHY
>> "ethernet-phy-idAAAA.BBBB" with generic "ethernet-phy-ieee802.3-c45".
>>
>> Regards,
>> Leo
