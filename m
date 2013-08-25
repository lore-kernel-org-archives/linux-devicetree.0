From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/2] extcon: extcon-dra7xx: Add extcon driver for USB
 ID detection
Date: Sat, 24 Aug 2013 22:30:11 -0700
Message-ID: <52199663.8070201@roeck-us.net>
References: <1376648029-30659-1-git-send-email-george.cherian@ti.com> <1376648029-30659-2-git-send-email-george.cherian@ti.com> <52127284.6030506@wwwdotorg.org> <521312CC.8060003@ti.com> <52139F0F.6090507@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <52139F0F.6090507@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: George Cherian <george.cherian@ti.com>, balbi@ti.com, myungjoo.ham@samsung.com, cw00.choi@samsung.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, grant.likely@linaro.org, rob@landley.net, ian.campbell@citrix.com, mark.rutland@arm.com, pawel.moll@arm.co
List-Id: devicetree@vger.kernel.org

On 08/20/2013 09:53 AM, Stephen Warren wrote:
> On 08/20/2013 12:55 AM, George Cherian wrote:
>> Hi Stephen,
>>
>> Thanks for your review.
>>
>> On 8/20/2013 1:01 AM, Stephen Warren wrote:
>>
>>> On 08/16/2013 04:13 AM, George Cherian wrote:
>>>> Adding extcon driver for USB ID detection to dynamically
>>>> configure USB Host/Peripheral mode.
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/extcon/extcon-dra7xx.txt
>>>> b/Documentation/devicetree/bindings/extcon/extcon-dra7xx.txt
>>>> +EXTCON FOR DRA7xx
>>>> +
>>>> +Required Properties:
>>> Please at lest explain what a DRA7xxx is, and the purpose of the HW
>>> module this binding describes.
>>
>> DRA7xx is the SoC name and the USB VID  detection is implemented via gpio's
>> Basically it does only ID detection via GPIO and there is no VBUS
>> detection in h/w.
>
> If there's no SoC-specific HW, then the binding has nothing to do with
> the SoC; it's entirely generic.
>
I am currently working on adding device tree support to the extcon-gpio driver.

Wonder if it would make sense to just use that driver. As far as I can see
the only missing part is support for multiple cables and cable naming through
device tree properties.

Any thoughts ? The patches are not yet clean enough to submit upstream,
but I could send them as RFC if there is interest.

Guenter
