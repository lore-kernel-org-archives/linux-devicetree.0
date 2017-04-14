From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v7 4/9] drm/stm: Add STM32 LTDC driver
Date: Fri, 14 Apr 2017 11:38:30 -0700
Message-ID: <87o9vyj0m1.fsf@eliezer.anholt.net>
References: <1492164819-10513-1-git-send-email-yannick.fertre@st.com> <1492164819-10513-5-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492164819-10513-5-git-send-email-yannick.fertre-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org> writes:

> This controller provides output signals to interface directly a variety
> of LCD and TFT panels. These output signals are: RGB signals
> (up to 24bpp), vertical & horizontal synchronisations, data enable and
> the pixel clock.
>
> Reviewed-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> Signed-off-by: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>

I squashed in one tiny fix for the new compiler warning due to *event
being unused in disable() now, applied Neil's review and my own, and
pushed patches 1-4.  Patches 5-9 will have to go through your arm-soc
trees for the platform.

Congrats!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAljxFyYACgkQtdYpNtH8
nujH6A/9GnImxOWxoQM+uDGVH7eDt1KbWKgDT4Nlv6MHBx/m1f/YZZuYgJH9BEcI
XJffuwCZoHUw5cWRxOcmpW9Xpq+yLU637zZFAl8xMxx2jhT/xvJ6BGbtUoacc2Sv
8iWwKtMsosIGAf6Rn7Ryj6Y+uxvkAu4DisWeY+zL3Q3CfBJK5Gp3Kp2e96icNqj9
zbfanzmBVzXCNzv6NFivIa14ZXQf1gnRW2rP9s/lk7+ZlZZjZguhH0o4ZZaqFrGu
iAoIPKym1qhz+uA2lHYdYH/v0ReHIP9oKFmtbcmpmsCDTL1XrzKGu5QKj+7rKPVI
zyTdh8ZXUjoxwPJ5sUkq2EVjbP6PbFRryr0BNVsxo/nTeYIuiylaGylNEDsqahQh
yY1sHaKBqWXRMV7CFA3zUhbCVbOraLrkMJGwc0hyzNEwSzQTw9+fT+gk2BeOula0
ru6RNiYPAsy/gBUsbODJoHGuZxGdOzTOyTAAp+yRDQz27GiouN3E/Lot8pGIfahC
f8r8Apoy3PIIQLAdxBiCuewDdqpG7CjwTwvHJj5b3O+sm/OWN1PVLKqPoGLzTFj8
j3JGTCe8eo9eBCWQD55cUqzmyU0k5UVpwnJ4t16hkNzz9C370wXfAYHBUe9lzNlK
Zkw8ZVVplZPNV2a9gW1N0d+WVqZAKKWP1i8W0dXjQMBJUZB16hA=
=t0Nk
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
