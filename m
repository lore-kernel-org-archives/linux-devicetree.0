From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: Add DT support for Juno r2 board
Date: Wed, 30 Dec 2015 09:09:46 -0600
Message-ID: <CAL_Jsq+RZk3LnOhGtiXRFmxmA6bTOEdymtF1yN=6q=iRmUr_9Q@mail.gmail.com>
References: <1450872611-15326-1-git-send-email-sudeep.holla@arm.com>
 <20151229183521.GL12450@rob-hp-laptop> <5683BE7A.9020404@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5683BE7A.9020404-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, arm-hC8oa7XEHlfYtjvyW6yDsg@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 30, 2015 at 5:22 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi Rob,
>
> Thanks for the review.
>
> On 29/12/15 18:35, Rob Herring wrote:
>>
>> On Wed, Dec 23, 2015 at 12:10:11PM +0000, Sudeep Holla wrote:
>>>
>>> Juno r2 is identical to Juno r1 with Cortex A57 cores replaced by
>>> Cortex A72 cores.
>>
>>
>> That's a bigger change than I'd expect...
>>
>
> I am not sure if I understood what you meant by that. Do you want me to
> elaborate with more details ?

No, just my commentary that I'd expect r1 -> r2 to be a board or Si
spin rather than a whole new core.

>>> Acked-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
>>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>>> ---
>>>   Documentation/devicetree/bindings/arm/arm-boards |   1 +
>>>   Documentation/devicetree/bindings/arm/cpus.txt   |   1 +
>>
>>
>> This should probably be a separate patch, but I already have a patch in
>> my tree for 4.5 adding arm,cortex-a72. So just drop this hunk.
>>
>
> OK, will post DT binding separately.

No need, it is already in my tree.

>>> +       pcie-controller@40000000 {
>>> +               compatible = "arm,juno-r1-pcie", "plda,xpressrich3-axi",
>>> "pci-host-ecam-generic";
>>
>>
>> Is this common with r1?
>>
>
> AFAIK it is. Liviu can you confirm ?

Then perhaps you should move this to a common spot.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
