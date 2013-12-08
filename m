From: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: cpu: Document and tweak clock-frequency property
Date: Sun, 8 Dec 2013 22:55:28 +0000
Message-ID: <CAFEAcA_GG_GW0ZXbTPMp7M0foK_sjUwYx0kk_YULVn0d9ozosA@mail.gmail.com>
References: <1386331027-26065-1-git-send-email-broonie@kernel.org>
 <52A36AB3.6060102@gmail.com> <20131208161922.GK29268@sirena.org.uk>
 <CAFEAcA8qsb0f_5dVbytCD3fGQdT+W4=PJudCY1f-ee4Pwm=0=Q@mail.gmail.com>
 <20131208192237.GM29268@sirena.org.uk> <CAFEAcA9oCPi0dj89NJ0k2wOsbVBCV=3=7FBrn=xuYdouJWc98Q@mail.gmail.com>
 <20131208215026.GO29268@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131208215026.GO29268-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, arm-mail-list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 8 December 2013 21:50, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sun, Dec 08, 2013 at 07:51:59PM +0000, Peter Maydell wrote:
>> On 8 December 2013 19:22, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> > (and doesn't reflect the actual deployed code reading the binding
>> > which does use this property without documentation outside ePAPR and does
>> > warn if it's absent)
>
>> This code should be fixed, then... (I'm pretty sure the kernel
>> has not always warned about the absence of this property,
>> or there would not be such a wide prevalence of DTs and
>> DT generating code which omitted it.)
>
> Too late for that, it's shipping in stable kernels.

> There does come a point where it's just nitpicking and not helpful but
> if it has a substantial effect on functionality then it's useful.  In
> this case suppressing the warning for non-asymmetric systems might be
> sensible.

Hmm, so "mandatory for non-symmetric [I assume you mean
that and not really 'non-asymmetric'?], otherwise optional" ?
I think that would be reasonable and preserve backwards
compatibility.

> For all practical purposes it is currently optional but the spec says
> it is mandatory.  I would rather err on the side of not changing the
> documentation in case someone does work based on ePAPR and/or an old
> kernel and since doing that keeps the spec more stable even if we do
> implement in a more tolerant fashion within Linux (as we should).

As I say, I don't think your specification currently does say
it is mandatory. If the documentation doesn't clearly list
it as a mandatory parameter, and a large number of
people writing DTS files or DT generation code haven't
put it in, and the kernel didn't complain about it not being
present for a long long time, then de facto it is optional,
and you should make your documentation conform with reality
and fix bugs where the kernel isn't coping with that.

thanks
-- PMM
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
