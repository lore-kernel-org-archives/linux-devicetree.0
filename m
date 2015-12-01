From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: enable pinctrl for Broadcom NSP
Date: Tue, 1 Dec 2015 08:24:21 -0800
Message-ID: <565DC9B5.8070801@broadcom.com>
References: <1448042309-46445-1-git-send-email-yrdreddy@broadcom.com>
 <5654FBE4.5010802@gmail.com>
 <CACRpkdZCBbrfHq+DiWcfe6i_2FPUXyMQwbsQu5_zAKYa=fJugg@mail.gmail.com>
 <565DC555.2070004@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <565DC555.2070004-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Yendapally Reddy Dhananjaya Reddy <yrdreddy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 12/1/2015 8:05 AM, Scott Branden wrote:
> Hi Linus,
>
> On 15-12-01 02:00 AM, Linus Walleij wrote:
>> On Wed, Nov 25, 2015 at 1:08 AM, Florian Fainelli
>> <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On 20/11/15 09:58, Yendapally Reddy Dhananjaya Reddy wrote:
>>>> This enables the pinctrl support for Broadcom NSP SoC
>>>>
>>>> Signed-off-by: Yendapally Reddy Dhananjaya Reddy
>>>> <yrdreddy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>>
>>> Looks like a sane pinctrl node here, unless there are objections, I
>>> would like to go ahead and apply this for v4.5, thanks!
>>
>> I'm waiting for an indication from the other BCM pinctrl
>> maintainers to tell whether this SoC is unique enough to deserve
>> its own driver.
> If Stephen Warren is the other maintainer you are talking about he does
> not work at Broadcom.  I don't think he is familiar with the variety of
> pinctrl implementations present.  But yes, the pinctrl implementations
> have been rather unique in these Socs.  As Ray indicated we're trying to
> get the silicon designers to standardize more going forward so we don't
> have to create unique drivers for these SoCs.

Yes. Hopefully NSP and NS2 will be the last iProc based SoCs that 
require unique pinmux driver.

>>
>> Yours,
>> Linus Walleij
>>
>
> Regards,
>   Scott
>

Thanks,

Ray
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
