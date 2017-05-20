From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2 00/18] ARM64: meson: DT cleanups
Date: Sat, 20 May 2017 15:16:28 +0200
Message-ID: <8b61eb79-8a63-6f74-b461-30b99ceeecea@suse.de>
References: <20170513143337.14278-1-afaerber@suse.de>
 <36c02d8a-d3e2-4330-f600-e49a1ba680e8@baylibre.com>
 <5fb0130c-473e-dc15-b60c-e5b6144031ad@suse.de> <m2d1b75d0i.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m2d1b75d0i.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kevin,

Am 18.05.2017 um 00:34 schrieb Kevin Hilman:
> Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org> writes:
>> Am 15.05.2017 um 10:16 schrieb Neil Armstrong:
>>> It's not perfect, but now it's done, live with it, this has already been discussed.
>>
>> No.
>>
>> Copy&pasting your comment N times does not make it any more valid. My
>> files, my rules - I insist on vega-s95, gxbb and gx, which you guys
>> refactored out from my gxbb, to be tidy.
> 
> hmm, "my files, my rules, ... my gxbb"
> 
> Very interesting perspective, but sorry, these do not belong to you.
> They belong to the kernel community.  You can insist if you like, but we
> do not make decisions just because someone says "mine".  Again, the
> confrontaional tone is not helpful to the dialogue.

We can certainly argue who started which tone here. From my perspective
I kindly asked Jerome to fix his node order on IRC, he said okay, but
neither he nor any of you ever sent such patches. (This was back when we
had an actual mismerge.) Weeks later I grudgingly sent the v1 cleanup
series myself, but instead of thanking me for doing "your" work, I was
greeted with unfriendly opposition and - yes, frustratingly is a word
here - put my efforts elsewhere. Neil's actions - who is neither author
nor maintainer here - of copying an opinionated personal and partially
wrong statement into a dozen neutral patches was highly offensive to me
and further escalated things. Stating his opinion, which he is welcome
to do, once would has sufficed.

Also what this "my" is about - and that should give you thought - is
that you guys added nodes to the Vega .dtsi file without adding any
BayLibre or other copyright. To someone downloading a tarball without
git history, that makes it look as if _I_ misordered those nodes in the
file that carries my name. So I would kindly suggest that you add your
copyright when making non-trivial additions.

Thanks,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
