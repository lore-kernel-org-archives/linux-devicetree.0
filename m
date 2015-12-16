From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] devicetree: sound: add binding for WM8974 codec
Date: Wed, 16 Dec 2015 18:48:10 +0000
Message-ID: <20151216184810.GO5727@sirena.org.uk>
References: <1450270975-17955-1-git-send-email-mans@mansr.com>
 <yw1xoadqeczx.fsf@unicorn.mansr.com>
 <20151216134411.GM5727@sirena.org.uk>
 <yw1xk2oeebxv.fsf@unicorn.mansr.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7Vi1RbbjZdZQ982c"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <yw1xk2oeebxv.fsf-OEaqT8BN2ezZK2NkWkPsZwC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--7Vi1RbbjZdZQ982c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2015 at 01:54:20PM +0000, M=E5ns Rullg=E5rd wrote:
> Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> > I need the patch in a form I can apply.

> I assumed your email client had some way of displaying the message I
> replied to.  Guess I was wrong.

My workflow for reviewing and applying patches is based around my inbox,
as are most review flows in the kernel - things that aren't in my inbox
*might* get looked at but it's unreliable.

> > You can't blindly rely on get_maintainers, it's prone to both false
> > positives (CCing too many people, especially if you enable git matching
> > when it often starts spamming people who are just doing global cleanups)
> > and false negatives (if you don't enable git matching and it misses
> > people who care about a specific driver).

> So in short, I'm supposed to magically divine who wants to see what.

You're supposed to do like SubmittingPatches suggests make a judgement
call based on things like looking at MAINTAINERS and the people that git
shows are reviewing and applying patches or otherwise seem relevant -
it's not really something that can be fully automated (for example, it
might make sense to CC someone who worked on the specific thing you're
changing even if they don't commonly review the file as a whole).

Looking at git history will also help you ensure that the style you're
presenting your changes in (for example things like the subject line)
matches the general style people are using.

--7Vi1RbbjZdZQ982c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWcbHqAAoJECTWi3JdVIfQqwgH/iwZ5gej2F+LCqsJaaizuWwW
fioBMXsv8qESV4LeC/imroW9QW+wxJNnAvOHRJUVqpuDqoxb68+Bk0Ri6IunS/YN
K64XjyX70JvCnrcfxEdAHQ+WRLQsymMA6Su12ldJzQr/LL4L7Dcsc5BCZKspD6l0
Prn0IGI5sJh8YJUtqYn4pnfHaymzw2fd3/VEQ+92Nm6pifW3OeyuPjFB4zgtpo/w
5tk37xcS3F7AbnVm4XwmPA4gyHYOWty+TxepL19MXkWqUaH8fHSlO/DOwVMI0gCg
etDG0NB2+kDy2WE1S1ZtMC66oOgI996TqX26hYcYPtyChcgy3YzYWueEogTJEQ8=
=S9ph
-----END PGP SIGNATURE-----

--7Vi1RbbjZdZQ982c--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
