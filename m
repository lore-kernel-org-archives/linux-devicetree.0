From: Ben Gamari <bgamari.foss@gmail.com>
Subject: Re: [RFC PATCH] gpio: add GPIO hogging mechanism
Date: Sat, 20 Sep 2014 17:37:19 -0400
Message-ID: <87fvfmynw0.fsf@gmail.com>
References: <1387463671-1164-1-git-send-email-b.brezillon@overkiz.com> <1387463671-1164-2-git-send-email-b.brezillon@overkiz.com> <20131219164109.GB27409@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131219164109.GB27409@kroah.com>
Sender: linux-doc-owner@vger.kernel.org
To: Boris BREZILLON <b.brezillon@overkiz.com>
Cc: Rob Landley <rob@landley.net>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Hi Boris,

I'm just returning to this now.


Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> I don't understand what makes GPIO's "special" enough to get included in
> the driver core like this, and called for each and every device that is
> added to the system.
>
I'm also a bit confused why GPIOs ended up in the driver core but
perhaps I'm missing something. What was your motivation here?

Cheers,

- Ben

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUHfOPAAoJEErkyLZmeNiD/ucIAKfJqb41jB7GYeFrwAQ6nP0L
M7s45uYdzwLj4OSd2UAxqZ+4wOcFRs8pim78cGIhelnVa/da94WYLiUARLW80OPq
yZQ4xZY5c1O1tI882lvsiE1lmHLKtlm4mzfQPjJ0xHgmBnF/kfkbsOIL3qHofiau
Tvd5GBBEIc2KpIk7pN8QR1X1sNS5QUembBeVARA8QDZeEiOuLUUYA1UZbRQr2iFd
jrwW1W6E3yji31Get4SB7TDTMtsunu5o8XnX0KSaEeqK5TZylHVTELcJX8gehetJ
XrMO1Z9H20+sION0d4M8gHyfIC04G1q+aSsIrqje3iQuFlQDqMBr7VP0otxW4/4=
=KM9x
-----END PGP SIGNATURE-----
--=-=-=--
