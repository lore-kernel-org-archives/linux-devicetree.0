From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] arm64: bcm2837 dts: enable bcm2708 frambuffer driver for the  raspberry pi-3
Date: Mon, 14 Aug 2017 11:22:41 -0700
Message-ID: <87378uf1qm.fsf@eliezer.anholt.net>
References: <534636301.409284.1502451058701.ref@mail.yahoo.com> <534636301.409284.1502451058701@mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <534636301.409284.1502451058701-sAHhhX/85wgbqTNvkayDYw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: VOTARY GITHUB <github.raspberrypi-6a75wwHIGTwqDJ6do+/SaQ@public.gmane.org>, "linux@armlinux.org.uk" <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "lee@kernel.org" <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "stefan.wahren@i2se.com" <stefan.wahren-eS4NqCHxEME@public.gmane.org>, "f.fainelli@gmail.com" <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "rjui@broadcom.com" <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "sbranden@broadcom.com" <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "catalin.marinas@arm.com" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon@arm.com" <will.deacon-5wv7dgnIgG8@public.gmane.org>"github.raspberrypi@votarytech.com" <github.raspberrypi-6a75wwHIGTwqDJ6do+/SaQ@public.gmane.org>, "ijc@hellion.org.uk" <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "andrea.merello@gmail.com" <andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: "robh+dt@kernel.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland@arm.com" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

VOTARY GITHUB <github.raspberrypi-6a75wwHIGTwqDJ6do+/SaQ@public.gmane.org> writes:

> From 3200cb6fd787390df1bccf1bb1f7a67ca04136fd Mon Sep 17 00:00:00 2001
> From: VT-Github-Raspberrypi <github.raspberrypi-6a75wwHIGTwqDJ6do+/SaQ@public.gmane.org>
> Date: Tue, 8 Aug 2017 16:57:15 +0530
> Subject: [PATCH] arm64: bcm2837 dts: enable bcm2708 frambuffer driver for=
 the
> =C2=A0raspberry pi-3
>
> This fb drivers to make rendering full boot up logs on the screen.
>
> Fixed: https://github.com/raspberrypi/linux/issues/2156

I don't think we should be adding DT nodes for the old, downstream-only
fbdev driver to the upstream tree.  We have nodes already for the open
source driver that directly programs the hardware, which will disable
the firmware's closed-source modesetting interfaces used by bcm2708
fbdev.  For early boot display, the proper solution is simplefb, not a
custom fbdev driver.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlmR6nEACgkQtdYpNtH8
nuhsdg/+IJHiBKT9fe2L/JncFoNr8jXtb2feCJsIsrao+MzOgwl7ruo3SuSBDWg6
cAdbtfW21MeDG95wI4fs9UOEBI/mCNduvsf4YlgZE0ghsOU30WwlVZsHtifqxNrY
kttmS1e5V1l0RJuoOVWFVP4oiGAqNI+sQd+g3fne2bl/R8+9quNaLBZUKSHTiBDj
mUf9gbhAP0he2sL6FYPgFFEBYzjKGzcMXThFgi1uEhePyVw/Sf7JgyYEeyXCXlJ/
SSSlEo+zwEu+4fTUSfq/y4ChuMfX99d71TMLkbvEIInRmUesLTvm4Lrl2gUv3HW3
jpqcEm10xnS5zEoen0mfzX3Zi4mZXlGde5Wm+eMK/iIo+bRyr1knG9h/WyiBLnxI
M+SIZtuF/Z53MrGKUDN83dcyWnhnRqS4dTouX9TR5upE7rQwPCv1BeTS0p+hSnfm
G3ooYsJW1V7Z73Z6L5xw1g3DkFmzOxUfB6zxsjSYWkse/AqhlHlZ8hQ0QhZdA/XS
Zns41WYh6A78LbVetc2DZUjoUEyS+Y5sTIYBaRQVK7jZJF1PUWa5oZm7VxHZILFx
/gtAzZPqFuTBrsJS405LjG1S04OU3KXtRah63MbHWT/jvgRzaJipwXT7uVQND+dC
EtsExtw0/dkWfJivGyDi9Xw+qzWgoDzs8C/bP7lm4tTHB2oFDUY=
=kpbz
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
