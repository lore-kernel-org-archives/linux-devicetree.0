From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [GIT PULL] Support for Fujitsu MB86S7X SoCs
Date: Thu, 02 Apr 2015 10:37:47 +0100
Message-ID: <551D0DEB.1060609@arm.com>
References: <CAKR0VNJdCEEoM8mqFrc-teQ-q=DopGisos16+uKt=ky2mRjF8g@mail.gmail.com> <CAJe_ZheO1iNKj80798gT8RLcYoYo3xky3urw=ke4x-3wKdtZ9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJe_ZheO1iNKj80798gT8RLcYoYo3xky3urw=ke4x-3wKdtZ9w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <vincent.cw.yang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On 31/03/15 04:02, Jassi Brar wrote:
> On 18 March 2015 at 11:14, Vincent Yang <vincent.cw.yang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Arnd and Olof,
>>
>> Please consider pulling in these patches for series of Fujitsu SoC
>> based around variations of 2xCA7+2xCA15 big.LITTLE architecture.
>>
>> The MHU driver is already queued in Mailbox tree.
>>

I see this in next but would like to fix the binding before it gets
merged in v4.1. I have provided feedback on that patch. Mainly the
compatible, clocks and the interrupt names have to fixed in the binding.
Code changes can be done later, but bindings no. I prefer an ACK from DT
guys if possible.

Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
