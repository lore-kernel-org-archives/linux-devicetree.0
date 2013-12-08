From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: cpu: Document and tweak clock-frequency property
Date: Sun, 8 Dec 2013 16:19:22 +0000
Message-ID: <20131208161922.GK29268@sirena.org.uk>
References: <1386331027-26065-1-git-send-email-broonie@kernel.org>
 <52A36AB3.6060102@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bzuizT9vlVVqWfw+"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52A36AB3.6060102-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linaro-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--bzuizT9vlVVqWfw+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 07, 2013 at 12:36:35PM -0600, Rob Herring wrote:
> On 12/06/2013 05:57 AM, Mark Brown wrote:

> > +	- clock-frequency
> > +		Usage: required

> This breaks compatibility. It may be required for a feature in the

It doesn't, it's listed as mandatory in ePAPR section 3.7.1 which is
already part of our bindings - this is merely copying that information
into the binding document in the kernel so that it's more discoverable=20
and so that we can tweak the definition to reflect reality a bit more
closely.

> kernel to work, but should not be required in general. Perhaps we need
> "optional/recommended" or "optional/required for new designs". Or we
> could say required only with heterogeneous cores.

For practical purposes a robust implementation should make it optional
(as the current ARMv7 one does) but that doesn't change the spec.

> > +		Value type: <u32> or <u64>

> How do I determine the size? I think generally this property which is
> used in multiple bindings is always u32. Of course, that won't work for
> our 5GHz parts next year.

Beats me.  Actually now I recheck the spec it should be a prop encoded
array consisting of a single element that's either u32 or u64, I guess
the array encodes the information.

> > +		Definition:
> > +			This is specified in ePAPR as the current clock
> > +			frequency of the CPU.  When used with these
> > +			extensions it should reflect the maximum clock
> > +			frequency for the CPU.

> What does extensions mean? cpu topology nodes?

No, it means the document being modified - the same language is used
throughout the document to refer to the extensions it's defining on top
of the base ePAPR CPU bindings.

> It is useful to have a standard way to determine the current cpu
> frequency. I've been asked for this several times on highbank. This
> could be cpufreq, but there is not always a driver loaded. lshw already
> has support for reading the frequency using this property. So I'm not
> real sure deviating from the ePAPR is a good idea.

That'd be nice but it's not terribly practical to do it in DT given that
we have a static DT.  As soon as something does change the frequency the
information goes bad, and I don't know how this is going to play with
things like kexec.  One could spec that the core always needs to be
started at top speed though that doesn't seem helpful.

> If a cpu only supports 1 frequency, then clock-frequency will always
> reflect the current and max freq. If a cpu supports multiple
> frequencies, then it should have an OPP table with those frequencies. We
> should then get max frequency from the OPP table rather than
> clock-frequency. It is clear that clock-frequency is insufficient to
> describe everything we need.

Right, though encoding the operating points into DT isn't always going
to be useful.  What I'm trying to do here is both reflect the existing
ARMv7 usage and make the property a bit more useful.

If defining it to be the maximum frequency isn't going to fly we should
probably just override ePAPR to say it's optional and implementations
should not rely on its accuracy.

--bzuizT9vlVVqWfw+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSpJwHAAoJELSic+t+oim9zF0P/RuUJKGoJff1AhkxxONf0XQb
+FFXbsxOTZdf3Xy3xA2hI2YlA1egmQFUVUnD/jpc2d8l7EKR0VKba6xn6RY1uGht
xPP4h4/8cMNScWUkfeHP/qAqCAmR6PgJkCDmll79RBPWENndTNdUBEebjU+pGnZw
3z8Uxb4TI4sStnTJwxCAlbSXxEu97PHBlTFOwNVXPzDJBHudHijK2njm/9796DOj
ona8ALFbT6gBQPo7AZY9RHu6fKg22s7UREiJEDBYORgaGsl2wm9fwTlOivToZp6L
wQ/uwr2SBCmgaBrb+uhV7lnqo5MsGLTfXuOpkbwvt4pdW3YGJF33T+c2vOvFxINQ
ayjm+1iXVj6nAqu2KrVn6TEBV70M8zEeJu187ufwIaRQhUqkwEeHZ0slKsiX02Dk
lDXZHij8ZhZ4MzmMeBWreocOu+hQJ4Y65gX2fNx/0sZxBxohUEcK+c3HPXkLjijf
HxMlqSCFqDFjbVSUWQveKR7EHlg8F+r+P+7xH2xTlkjng6MvW9TjUKjBPRTyTxeq
bCw8l+DS9inMD6V+HlgK6CMNQV6UXgs4EW+4A2FhwTOwNRW7pHCORWv/hMp6VTvf
zW1ZFWPrY5ntZu/2M63xUPll2AV8uPwzI6QZBb7BEAw9azNwLMwpnFsFt7AR4Vbw
9gzOBaWCR6KFsWNDX4R0
=H7a/
-----END PGP SIGNATURE-----

--bzuizT9vlVVqWfw+--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
