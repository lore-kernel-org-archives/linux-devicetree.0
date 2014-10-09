From: Richard Weinberger <richard.weinberger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/6] UIO driver for APM X-Gene QMTM
Date: Thu, 9 Oct 2014 14:22:58 +0200
Message-ID: <CAFLxGvxkL33_TVaf6dT9joC8dzU9uvJVG-GJdDKXPsMVAvQhvw@mail.gmail.com>
References: <1412051169-9142-1-git-send-email-ankit.jindal@linaro.org>
	<CAPTm99V-xyXa7WQG2jzDz19gotJ0aQRPk_rb5ukvUpdFyFabfw@mail.gmail.com>
	<2114579.IN6EpqPdMv@wuerfel>
	<CAPTm99WBE7RnGYNZsCfsenYcR3wNSVYOg--90_s1Ji_=Vj5myA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPTm99WBE7RnGYNZsCfsenYcR3wNSVYOg--90_s1Ji_=Vj5myA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tushar Jagad <tushar.jagad-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 9, 2014 at 2:17 PM, Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 9 October 2014 17:36, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> On Thursday 09 October 2014 14:14:33 Ankit Jindal wrote:
>>> On 30 September 2014 09:56, Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>> > This patchset enables user space access to APM X-Gene QMTM
>>> > using UIO framework.
>>> >
>>> > The patchset also introduces new type UIO_MEM_PHYS_CACHE
>>> > for mem regions because APM X-Gene QMTM device supports
>>> > cache coherency with CPU caches.
>>>
>>
>> I haven't been able to review the patch in detail yet, but I have
>> a very high-level question: how do you decide which driver to use?
>>
>> I understand that the normal use case is for the QMTM to be used by
>> the kernel directly rather than being exported to user space, and
>> that the network driver will just use it if it is there.
>
> This UIO driver will be disabled by default. When this driver is
> enabled, the other dependent drivers need to be removed from the
> config.

And if the user forgets or creates an allmod/yesconfig we have
undefined behavior?

-- 
Thanks,
//richard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
