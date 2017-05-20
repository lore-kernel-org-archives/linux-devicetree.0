From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2 00/18] ARM64: meson: DT cleanups
Date: Sat, 20 May 2017 17:48:42 +0200
Message-ID: <ee80352b-e5f2-8049-5f88-e6fe1b433a5e@suse.de>
References: <20170513143337.14278-1-afaerber@suse.de>
 <m2mvab88dh.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m2mvab88dh.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kevin,

Am 17.05.2017 um 23:46 schrieb Kevin Hilman:
> Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org> writes:
>> This series fixes several cosmetic issues, on top of your for-next branch.
>>
>> Patches 3-6 rename a node, the rest should all be non-functional changes.
>>
>> PLEASE STOP merging random new nodes at the bottom of DT files!
>> Just like it's a convention to sort new nodes by unit address, it has been
>> a convention to sort by-label nodes by their label. As discussed here and
>> elsewhere, this helps avoid merge conflicts and makes nodes easy to find.
>> I don't care whether we order A0 before A or after, but adding new HDMI
>> or CVBS nodes at the very bottom is totally out of alphabetical order.
>> Since my v1 you really should've known that...
> 
> Your tone is a bit tiresome and frankly makes me hesitate before
> reviewing the patches.  If you expect cordial dialogue and producitve
> collaboration, please dial the accusations back a notch.

I have sketched the history in another reply, maybe you understand the
sentiments better now.

I was annoyed to see that contributions by several people made the
problem worse than it was originally. I.e., my v1 fix and now v2 grew
more invasive because the issue did not get contained, not just not
fixed. Rebasing this branch was no fun.

[snip]

I will continue to point things out in review or hindsight where I can,
but as explained to Martin, this is not something I can continuously do
in the pace that BayLibre's nice driver contributions have led to.

As for the question of ownership, there should be no doubt that I not
only factually contributed meson-gxbb DT files but also figured out how
to get any kernel to boot on S905 with the old vendor U-Boot and fixed
serial output and added earlycon. That was before BayLibre stepped in.
So from my perspective all your contributions are based on my pioneering
S905 work (and my work in turn reused Carlo's S805 meson_uart etc.), and
I will not react well when some BayLibre employee not initially involved
with those efforts (Neil) now tells me to shut up and pretends as if he
makes the rules now just because his colleague stepped up as maintainer.
The ordering rules I applied here are not my invention but things I
picked on from previous reviews. You yourself had stated that I could
resend the patches and explain why - Russell and I already gave some
reasons, and there were no responses, which I took as no opposition and
was frankly surprised about the renewed level of opposition.

More generally, if a fix makes sense on its own and has no dependencies,
then I personally prefer it getting applied after reviews. If there's a
rule/reason for requiring full-series resends in Linux, it hasn't been
explained to me yet.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
