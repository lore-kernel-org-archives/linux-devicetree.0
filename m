From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH 3/8] ARM: dts: aspeed: Add I2C buses
Date: Wed, 04 Oct 2017 15:06:33 +1030
Message-ID: <1507091793.5452.10.camel@aj.id.au>
References: <20170928075149.8154-1-joel@jms.id.au>
         <20170928075149.8154-4-joel@jms.id.au>
         <CAFd5g46LrdCkPq-dZyrA3Nnw28=r-sCsPvp5bWngYUF=3RmDYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-wN7roEnls3pshcsqkUzh"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFd5g46LrdCkPq-dZyrA3Nnw28=r-sCsPvp5bWngYUF=3RmDYA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-wN7roEnls3pshcsqkUzh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-28 at 11:35 -0700, Brendan Higgins wrote:
> > On Thu, Sep 28, 2017 at 12:51 AM, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> wrote:
> > Now with an upstream i2c bus driver, we can add=C2=A0=C2=A0the 14 i2c b=
uses that
> > exist in ASPEED G4 and G5 generation SoCs.
> >=C2=A0
> > It also adds aliases for the 14 built-in I2C busses to ensure userspace
> > sees the numbering staring from zero and counting up.
> >=C2=A0
> > Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
> > ---
>=C2=A0
> > Reviewed-by: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>=C2=A0
> nit: can we make the i2c labels and the pinctrl labels match?
>=C2=A0
> For example:
>=C2=A0
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c13: i2c-bus@480 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0#address-cells =3D <1>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0#size-cells =3D <0>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0#interrupt-cells =3D <1>;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0reg =3D <0x480 0x40>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0compatible =3D "aspeed,ast2500-i2c-bus";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0clocks =3D <&clk_apb>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0bus-frequency =3D <100000>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0interrupts =3D <13>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0interrupt-parent =3D <&i2c_ic>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0pinctrl-names =3D "default";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0pinctrl-0 =3D <&pinctrl_i2c14_default>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0status =3D "disabled";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
>=C2=A0
> "i2c13" has a pinctrl-0 of "pinctrl_i2c14_default"
>=C2=A0
> I know that pinctrl_i2c14_default is consistent with the function and
> groups it uses, but I would like to see them all be consistent at some
> point in the future.

I doubt we'll be making them consistent: How the i2c devices are aliased by
Linux are independent of how they're labelled in hardware or the datasheet.

For sanity's sake pinmux's functions and groups follow the datasheet (thoug=
h if
you want to maintain the Aspeed pinctrl drivers, be my guest :D)

We could rename the pinmux nodes to offset them from the function and group=
,
but it feels less self-contained if the nodes are named at the whim of the
device requesting the function if there's no further configuration on top o=
f
the function and group*. It also makes it harder to auto-explode the functi=
on
name into the node definitions as we'd then need some further mangling to m=
ake
things line up.

* The pinctrl devicetree bindings allow for definition of nested nodes to
specify collections and combinations of pin function and group, and pin
configuration such as drive-strength. Thus the nodes can be a lot more comp=
lex
than what we've defined up until now, but what we've got enables a lot of
pretty straight-forward uses-cases.

We could alias the i2c devices in line with the hardware, but that breaks t=
he
convention of starting device numbering at 0.

Ultimately Joel and I chose to make the break at the point where the i2c de=
vice
requests the mux function. It's up to the device to know what hardware mux
configuration it needs and that's what this approach documents. The
inconsistency is irritating but I don't feel like it's the end of the world=
,
and I think the alternatives are (slightly) worse.

Cheers,

Andrew
--=-wN7roEnls3pshcsqkUzh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1GVRAAoJEJ0dnzgO5LT58D8P/373Y2qg+iX5cpGawE7Bs3RS
XmYYAoMnz1s8nmJJZP9QW6HvIxRFGSwmhweGKtnFCpJQxr6BDaUarD5qoOc7+EAL
QN50K1+gyVo8CO4BEWFinw6c5xMKtudKZoWfBLFLJE7fGTkCpNGz/E86u3Zt7BU1
w+cJyxIVeHO6Mf/duU00eIFJO7w5xU2VjM01jNMz96R7l6NmOsX7tSZuJl9+Avt6
Xv7WzgnUc49UHupP6vquf/0fBwgpfcUTj0r6JMD8aGsDuqCplTTpbXX0iltklz2b
rOa30/ItKt1AgsX6+WSCRTnaD6v9M/Fr2Zm3dicHFwP5SAewMLSl23bCFkGVIwhX
yvbZMHwIpoxBtFeG/nYXVgdF29z+/HK8H5Du2+AzDNePH1uexVB4ZR8wOm2YdQyF
nUWVfa7Di0kJcBg+qFn+PH9rZwHcpBfrPxrxaCssYH68okV6qnRwTciJfP3+hana
NOvxmuDbBrB1ebQcONAS+Orv0wBebL+iGtU4qLl8LYHqbwozzHk56CLQyyrsvq0Y
scJxslcHWcj6Z/nrJpMzMZUafJ4+2DoinJyH9pbhDhjs2qcFBzG/+23UCagSqefC
BBre9s8hGWIkzWR8N6aHXAYFxvcptVyboMz0cCFTrmfhwMkNjJHHBbLX5Hy1fZTd
TNT9+5m8orAgxIBxpmIl
=SE2F
-----END PGP SIGNATURE-----

--=-wN7roEnls3pshcsqkUzh--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
