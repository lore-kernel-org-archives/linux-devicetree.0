From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND v2 3/4] ARM: BCM: Add SMP support for Broadcom NSP
Date: Mon, 16 Nov 2015 22:09:27 +0100
Message-ID: <CACRpkdbMoqhZqqiqhEFVnRoJ+f2Tje7Du4BKET_s+DaUCcMzkw@mail.gmail.com>
References: <1446839371-22601-1-git-send-email-kapilh@broadcom.com>
	<1446839371-22601-4-git-send-email-kapilh@broadcom.com>
	<CACRpkdZN-iwdR_VwktdHsw+rGQLhCgmWnERYVDE+KaYOqJR30w@mail.gmail.com>
	<CAGVrzca34xrVznoEE2e26JyR11Q9L1sT4mJcNZ=NuprqUnZnjw@mail.gmail.com>
	<5642198C.2040205@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5642198C.2040205-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback
List-Id: devicetree@vger.kernel.org

On Tue, Nov 10, 2015 at 5:21 PM, Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> On 11/10/2015 7:59 AM, Florian Fainelli wrote:

>>> Also give it a sane name, bcm_sec_boot_address or so.
>>> "secondary_boot" sounds like a function you call to boot
>>> the second core.
>>
>> Agree with that, there could be a better name which better reflects
>> this is a variable.
>>
> As this change is consolidating SMP implementation, I kept the same
> name of the variable which was used in kona_smp.c so that the changes
> in the common code is minimal. Also, the fact that the change is part
> of up-streamed code, I didn't alter with the variable name. Shall I
> change it in the next patch?

Sure do it any way as long as the end result looks fine.
It was not a big issue anyways.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
