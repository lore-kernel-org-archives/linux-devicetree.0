From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 00/18] ARM64: meson: DT cleanups
Date: Wed, 17 May 2017 15:34:05 -0700
Message-ID: <m2d1b75d0i.fsf@baylibre.com>
References: <20170513143337.14278-1-afaerber@suse.de>
        <36c02d8a-d3e2-4330-f600-e49a1ba680e8@baylibre.com>
        <5fb0130c-473e-dc15-b60c-e5b6144031ad@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5fb0130c-473e-dc15-b60c-e5b6144031ad-l3A5Bk7waGM@public.gmane.org> ("Andreas
        =?utf-8?Q?F=C3=A4rber=22's?= message of "Mon, 15 May 2017 21:10:58 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andreas,

Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org> writes:

> Am 15.05.2017 um 10:16 schrieb Neil Armstrong:

[...]

>>=20
>> It's not perfect, but now it's done, live with it, this has already been=
 discussed.
>
> No.
>
> Copy&pasting your comment N times does not make it any more valid. My
> files, my rules - I insist on vega-s95, gxbb and gx, which you guys
> refactored out from my gxbb, to be tidy.

hmm, "my files, my rules, ... my gxbb"

Very interesting perspective, but sorry, these do not belong to you.
They belong to the kernel community.  You can insist if you like, but we
do not make decisions just because someone says "mine".  Again, the
confrontaional tone is not helpful to the dialogue.

[...]

>>=20
>> Well, this is why we have 7 rc releases after the merge window...
>
> If Kevin is the maintainer, then he needs to carefully review patches.

Thank you for implying that I don't carefully review patches.  You're
winning me over. :(

Please see my reply to the cover letter as to why this kind of thing has
not been on my priority list of things I look for during review.

> It is not my job to review all patches when BayLibre gets paid for it!

You have no idea who is getting paid for what kind of work, so please
don't make decisions about what you review based on your assumptions.

[...]

> I will also remind that I was forced to clean up the node order in ALL
> exynos5250 .dts files before I could get my new exynos5250-spring.dts
> merged, so I have zero understanding about these "churn" and "live with
> it" comments here. The same rules need to apply to all

It's a nice ideal that the same rules would apply to all, and in some
areas of the kernel, it may be true.  However, in actual practice,
across the variety of kernel subsystems and platforms, there are in fact
a rather large variety of "rules" with a huge amount of discretion left
up to the maintainers.

While that is a point of endless frustration for some (many?) it's also
part of what makes the kernel community healthy, vibrant and still
alive.

Look, you convinced me based on sound technical arguments, good code,
well written changelogs and persistence, even in spite of your
accusatory tone and insinuations.

For future reference, I'd be much happier to review without the latter.

Thanks,

Kevin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
