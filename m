From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: cpu: Document and tweak clock-frequency property
Date: Sun, 8 Dec 2013 21:50:26 +0000
Message-ID: <20131208215026.GO29268@sirena.org.uk>
References: <1386331027-26065-1-git-send-email-broonie@kernel.org>
 <52A36AB3.6060102@gmail.com>
 <20131208161922.GK29268@sirena.org.uk>
 <CAFEAcA8qsb0f_5dVbytCD3fGQdT+W4=PJudCY1f-ee4Pwm=0=Q@mail.gmail.com>
 <20131208192237.GM29268@sirena.org.uk>
 <CAFEAcA9oCPi0dj89NJ0k2wOsbVBCV=3=7FBrn=xuYdouJWc98Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M70YYmmjmThh04Jd"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFEAcA9oCPi0dj89NJ0k2wOsbVBCV=3=7FBrn=xuYdouJWc98Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, arm-mail-list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--M70YYmmjmThh04Jd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 08, 2013 at 07:51:59PM +0000, Peter Maydell wrote:
> On 8 December 2013 19:22, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Sun, Dec 08, 2013 at 04:38:58PM +0000, Peter Maydell wrote:

> >> "The ARM architecture, in accordance with the ePAPR, requires
> >> the cpus and cpu nodes to be present and contain the properties
> >> described below."

> >> not "must contain the properties described below and also
> >> any others that the ePAPR spec says are mandatory".

> > I think that's a fairly tortured way of reading the language there to be
> > honest

> It's the way that I read it, and presumably also the way it was read
> by  Marc Z when he wrote the kvmtool device tree writing code, and
> also I would assume the way it was read by the people who wrote the
> random three or four dts files in arch/arm/boot/dts that I checked,
> since none of them include clock-frequency properties as far as I
> can see. If half a dozen different people all produced device
> trees with cpu nodes without a clock-frequency property then
> I think it's a bit hard to claim that it requires a tortured reading
> of the documentation to decide that it's not mandatory.

I think you're assuming that people are reading the binding documents at
all when they write things and that should they look at them they will
follow any references to ePAPR (which requires a signup to download) and
then pay attention to the requirements annotations (this is done a lot
more clearly in most of the in-tree documentation) all without making
any mistakes.  I think each of these assumptions is optimistic.

> > (and doesn't reflect the actual deployed code reading the binding
> > which does use this property without documentation outside ePAPR and does
> > warn if it's absent)

> This code should be fixed, then... (I'm pretty sure the kernel
> has not always warned about the absence of this property,
> or there would not be such a wide prevalence of DTs and
> DT generating code which omitted it.)

Too late for that, it's shipping in stable kernels.

> > being released regardless of spec conformance.  Kernels should be
> > liberal in what they accept, DTs should be conservative in what they
> > contain and both need to understand that the other is going to get it
> > wrong some of the time.

> I agree generally with this, and I think I would also include that
> the kernel should not start warning about things which it has
> not warned about in the past, because this basically manifests
> as "user experiences warning which they can't do much about";
> it's directed at the wrong target and much too late.

I think it's reasonable to warn on things, especially in cases where
it's risky or difficult to try to figure out what to do without the
property.  At this point most people can update their DTs and obviously
there's an awful lot of cases where the only people who would ever see
warnings are definitely people in a position to do so (things like
consumer electronics for example).

There does come a point where it's just nitpicking and not helpful but
if it has a substantial effect on functionality then it's useful.  In
this case suppressing the warning for non-asymmetric systems might be
sensible.

> If you want to make properties mandatory then you should
> have some sort of setup for validating an entire device tree
> including all the properties which the kernel doesn't happen
> to use yet or doesn't use in every configuration. That can
> then feel free to warn copiously about any missing mandatory
> properties, obviously.

That's one of the goals with the DT validation software that people like
Tomasz are working on.  Sadly it doesn't exist yet, it would definitely
make life a lot easier.

> >> (It's also not at all clear what a virtual machine's devicetree
> >> should set the clock-frequency properties to anyway...)

> > Yes, it's a poorly considered property all round.  Most currently
> > available silicon has variable clocks for the cores which is an issue
> > with a fixed DT like FDT provides and like you say for simulators and so
> > on it's meaningless.

> So what would we lose by making it genuinely optional and
> just silently doing something reasonable if it's not set?

For all practical purposes it is currently optional but the spec says
it is mandatory.  I would rather err on the side of not changing the
documentation in case someone does work based on ePAPR and/or an old
kernel and since doing that keeps the spec more stable even if we do
implement in a more tolerant fashion within Linux (as we should).

--M70YYmmjmThh04Jd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSpOmfAAoJELSic+t+oim9EbIQAJXOl38m540s7j0hBz129II7
lHRI0N93RMsdzDdsNZrP/fGEiue5ciEcTrfrZVy0bqu1JkuTBPe+Ff0XDrRWwGkn
s+r7XwLYlr/eh3mYJulpMIy2gFordDfpKNv3fIRQttf0k1AEOzxkHbRZA41lYH5i
WcSie68F3qgo3Wftj4Bd6kvfj+2VhgrJ2NnIm/SQ2dkdtoeG+ZFCgjwUafGeqB6a
klxeBj56gbeQ/AE7ZcmJn1esG0kRgxIV66lukdkkbj5F4M1Kq8BDdmomZSN1LNbQ
yS8UEuR8/feCecY95/xrIaZVU5eEPek4FiMKxPPUjN72TZ43d6CNcuy/1qmskhL1
oWoKlF2DtaHt57NNHflg82efx9fcPuzI2Sm1afU2rr7PU99RHU2T9IeSNkz4GhIJ
G6sIOYLqSGpehSvO4/Rw+ulHPFpJU31pAbdwM3Ze9ZUxO1gfBNFbkOW1GuMPF6DZ
udjC/pebHzir+HpPp08EQXh4Vgq3tbYDqF6jMF8Dmv9y8ICCSQU53qMXdmO1nxHw
1AHvKm1A/ryDY9NzYBQcz9tPo5Ol2ijWHJT/ZcJbimCxeLwLYVm8TwtshPzCKQaW
Dgy4GSc89mnI+c8ZWkCze5V2AQFb9t3veNFtZLhhsxhER2Xj+GXGHVLqhQsV94s5
abQQj2KroF5bPZZvyW+0
=IR8J
-----END PGP SIGNATURE-----

--M70YYmmjmThh04Jd--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
