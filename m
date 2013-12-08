From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: cpu: Document and tweak clock-frequency property
Date: Sun, 8 Dec 2013 19:22:37 +0000
Message-ID: <20131208192237.GM29268@sirena.org.uk>
References: <1386331027-26065-1-git-send-email-broonie@kernel.org>
 <52A36AB3.6060102@gmail.com>
 <20131208161922.GK29268@sirena.org.uk>
 <CAFEAcA8qsb0f_5dVbytCD3fGQdT+W4=PJudCY1f-ee4Pwm=0=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nkAIkdqOakIAdIKa"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFEAcA8qsb0f_5dVbytCD3fGQdT+W4=PJudCY1f-ee4Pwm=0=Q@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, arm-mail-list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nkAIkdqOakIAdIKa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 08, 2013 at 04:38:58PM +0000, Peter Maydell wrote:

> Sorry, but there is already shipping software (kvmtool
> and QEMU) which isn't emitting clock-frequency properties
> for cpu nodes, based on what you documented in the kernel
> doc file, which says:

I didn't document anything here except this patch, I was just trying to
reconcile the implementation with the documentation.

> "The ARM architecture, in accordance with the ePAPR, requires
> the cpus and cpu nodes to be present and contain the properties
> described below."

> not "must contain the properties described below and also
> any others that the ePAPR spec says are mandatory".

I think that's a fairly tortured way of reading the language there to be
honest (and doesn't reflect the actual deployed code reading the binding
which does use this property without documentation outside ePAPR and does
warn if it's absent).  If that really is how we want to read things then
we probably ought to delete the reference to ePAPR both here and in the
other binding documentation we have and fork the specs.

> So I'm afraid you're stuck with this being an optional property.

Like I say I think a reasonable and robust implementation shouldn't
reject a device tree with it missing but that doesn't stop the device
tree being out of spec.  This is also the existing kernel behaviour for
this property so we're stuck with it anyway and my goal here was to
minimise our deviation from the spec so I introduced the minimum
practical change in the process of copying it in for discoverability.

This sort of situation is going to become more and more common as people
actually look at device trees in production; the kernel will have to be
robust against device trees that it previously accepted even if they are
out of spec (and should just generally be robust in parsing).  We've got
to understand that the kernel will fill the role Windows does for PCs -
things that run well enough with existing kernels are going to end up
being released regardless of spec conformance.  Kernels should be
liberal in what they accept, DTs should be conservative in what they
contain and both need to understand that the other is going to get it
wrong some of the time.

> (It's also not at all clear what a virtual machine's devicetree
> should set the clock-frequency properties to anyway...)

Yes, it's a poorly considered property all round.  Most currently
available silicon has variable clocks for the cores which is an issue
with a fixed DT like FDT provides and like you say for simulators and so
on it's meaningless.

Ideally someone with the time/enthuisiasm will get this dealt with more
sensibly in a future revision of ePAPR.

--nkAIkdqOakIAdIKa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSpMb5AAoJELSic+t+oim9shgQAI1tfXG4R9MDIlbxgTZW8mP9
IeVNWR5NzM+DRCJmqarH90bpNsjrDQUXiNaWc4bWzXzPazb1zJtrGxFns7OU6ea1
xIS0eqwNfSEpOXPw0ftcGZRkC7WfLNhWrtcriSnny8YiKR8goqevRe68d4NQxlPd
FztDKfdfEiUMufRnxHDMEOykehdfmYMVUnuHVGyqXsjRLTDD1tW5e3U9j7sMYF2U
/72xy+Y4+7aTZnR8XgyDWuV1hyxkO8NX1mwiibVHwWg/0cy1EjySjXEBVMcEX7u9
JPDb65xdedRs9jayOsYgRpglPTDEqBTLTBpJb3q0FFg5EBUcNcoWZQCRYtSWsgcL
nyceDCI4xJf3AYRCVSv6fFIcCnKoiPTyNMz1L1Djky2+oXpON583EDl/LiCtBrRz
EBOtC+53+rOJhN+jV6uijfSt31DLETDkj//Bk7eWPW6hNBmV1TLfjCWWwNFyL+O1
kZpxa1AVhuR89sMyPdY+T/EnDT2sB9+AbN3OWpktb9oICnd3W7X7/AdMZ0m1fuJo
83n1WaV+E8FjBdhno6VEGfQb57qUE+59VrUtoR9Fx7mHva0r8Cbln1+giqv8cuf6
PTpQvfPAPqb2CkjKsDl84XlDI2/SUDT8ky5yzNowr7mX4WtOCIWHw1lKo/XM/zmE
5vk5G7aOtm1/N5fARMN8
=Z3XS
-----END PGP SIGNATURE-----

--nkAIkdqOakIAdIKa--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
