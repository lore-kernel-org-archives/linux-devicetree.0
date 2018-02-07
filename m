From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 0/3] drm/panel: simple: Add mode support to devicetree
Date: Wed, 07 Feb 2018 09:16:22 +0000
Message-ID: <87d11hb1nd.fsf@anholt.net>
References: <20180206165626.37692-1-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180206165626.37692-1-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?utf-8?Q?St=C3=A9phane?= Marchesin <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> writes:

> Hey all,
> Here's a set which allows us to add an "override" mode to the simple
> panel dt node. The override mode can be used for devices for which the
> typical display timing is not sufficient, yet the overriding mode should
> not be applied across the entire platform.=20
>
> An example of this (and the motivation) is the Chromebook Plus (kevin).
> If the sharp panel on this laptop is run at the mode advertised in the
> datasheet (and what is currently in mainline), it creates interference
> with the touch digitizer. To fix this, we need to run the pixel clock at
> a slightly higher rate (which we can do by increasing the back porches).
> This "fix" should not be used on other rockchip devices using this panel
> since they might not encounter the same interference.
>
> If an override mode is present, it will be checked against the panel's
> display_timing range. When validated, it will be exposed as the
> preferred mode along with the 'typical' modes generated from the panel's
> display_timing.
>
> This set is based on Linus' master to pick up the edp support in
> rk3399-gru-kevin.dts.

Couldn't you just add a different compatible string for the panel
driver, and use that to have a different mode exposed from the panel?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlp6w+YACgkQtdYpNtH8
nuiAmw//atw+uENp5uAmEk0PHqoJ81wyuDKFzQrFpSOAn/9iw49OlGh4lULAGWNP
ane9Q6XUMIJvgZ3MtL3BRgmso28asOyxqwsWUv3UymBW1CyLeUwyZgThkh8nvD7V
336h8o3BM/9s1IbcvkY5LIy9sXsaxC0FiRWlRaMg8PrQdqRrqmA/n9nLjDqVowZH
H1VdxvD3gxEXYo0XIQITua/c//DOUqd+F9oPaakmLJJGqDD6MdO+PdBw+ol1vXt0
5E5Imo/tIcLx2y+SUXrnncxoL5n3+5d9CU0V3xLHJ0XfFaZJEyNKMUZ0aOTKrxVh
aPUyE+m8eHPvocIyjn8zaMwDTIY72HChjTGw1P3xbMMlF5EwXzZ+bAspIz/cI5WV
F6JnaTFI8DW4mam0ZoHQkmIDaaYmCIEQo0Bj7/yzty7l9PX0C+H1Hq8JWPbAXh1i
pe+raQzb8d0BzSpfiu6fSTxWArjdQ3okVLmVfLxyg8gjeRutbCDdCmv6E6rfo3e3
bP0neYtz4WiPcvcGfQxK9r5YSZAlO7MgwDn3n8uspqVYLfCqUdx1U2umzU+55TN3
sAV53TxkVCQM9k3uuHZJsJOkY7uPhsPXIvLMpWjCnaC+kKv88o0E3p3jds5HlZl+
ODvq9CT9s5jcAFv3odgW9IUQMbJ9PEb+e/DtR2BPJB8o5Zb7Q6A=
=++oC
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
