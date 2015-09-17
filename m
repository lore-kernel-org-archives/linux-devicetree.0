From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: tps65023: add device tree support
Date: Thu, 17 Sep 2015 10:20:15 +0100
Message-ID: <20150917092015.GM11268@sirena.org.uk>
References: <1442324035-16414-1-git-send-email-thomas.elste@imms.de>
 <1442324035-16414-2-git-send-email-thomas.elste@imms.de>
 <20150916195612.GT12027@sirena.org.uk>
 <20150917104335.5464f8b5@pluto>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="umrsQkkrw7viUWFs"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150917104335.5464f8b5@pluto>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Elste <thomas.elste-cSCHQGRfioA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--umrsQkkrw7viUWFs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 17, 2015 at 10:43:35AM +0200, Thomas Elste wrote:

> And I will use a separate patch for the binding document (just found
> Documentation/devicetree/bindings/submitting-patches.txt).

It's actually fine to just have them in the same patch for a simple
driver using established bindings like this - the DT maintainers are
unlikely to have the bandwidth to look at it anyway.  But splitting is
also OK.

--umrsQkkrw7viUWFs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV+oXLAAoJECTWi3JdVIfQNp8H/2lW6AfMgu0ANgJGXn7EBUPU
aiLRx/Ys7esI/e+f4yfCxxVvId6ktTrH4f6o8S+0yGtWi6u2hStUO8u84T74omsz
AXV7d0i3S1Jhsrv6T0U3Dd00Fs/wyMnwL0q0aOy1r11ZP+OT4VrKAveWuHJFe1W2
CeMEZXp9xTSkGDlnAER2WbC33UmZ7OJNav8H5KeGu4x+i3D4fy9lAHIqTPK43xfW
erhR4NZJaoPcFndboE67MEwhEwlKApSaqsKJorUP8J7UGghGtH1YiYL6gebS3vAa
dRYS0ZVLHrjnnTVSTZrVr9A4QfwO1IV8lY+ufYfy9j2ebIrqXcpwCf0lbTDg2Ok=
=hY8R
-----END PGP SIGNATURE-----

--umrsQkkrw7viUWFs--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
