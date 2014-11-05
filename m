From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v1 2/3] usb: phy: convert gpio-vbus to gpio_desc
Date: Wed, 5 Nov 2014 14:09:42 -0600
Message-ID: <20141105200942.GW6548@saruman>
References: <1414951910-16075-1-git-send-email-robert.jarzmik@free.fr>
 <1414951910-16075-2-git-send-email-robert.jarzmik@free.fr>
 <20141105192957.GM6548@saruman>
 <87sihx1lcd.fsf@free.fr>
 <20141105195015.GU6548@saruman>
 <87oasl1kn7.fsf@free.fr>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EDT6MSV0B3GxyNyZ"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87oasl1kn7.fsf-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--EDT6MSV0B3GxyNyZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 05, 2014 at 09:02:04PM +0100, Robert Jarzmik wrote:
> Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> writes:
>=20
> > On Wed, Nov 05, 2014 at 08:46:58PM +0100, Robert Jarzmik wrote:
> > Well, let's add that :-) Just make it optional. It's pointless to have
> > 80% duplicated code just because of 20% missing in phy-generic :-)
> >
> > Then we avoid adding gpio-vbus specific DT properties too.
> OK, got it.
>=20
> It will take me a couple of days. Philipp, am I missing something apart t=
he
> detection and connect stuff ? While I'm at making my board work with
> phy-generic, let's thing ahead.
>=20
> Felipe, that will mean at least this for phy-generic :
>  - usb_phy_gen_create_phy() will be enhanced
>    =3D> struct usb_phy_generic_platform_data will get a :
>      - int gpio_vbus field (or whatever name you wish)
>      - int gpio_vbus_inverted (or maybe we could go directly for gpio des=
c)

Actually, you might want to first convert phy-generic to gpio_desc and
avoid the inverted field.

>      - int gpio_pullup field (I'm not sure here, maybe we should just dro=
p that)
>      - bool wakeup field (or another name)

sonds good to me.

>    =3D> device tree will get :
>      - a vbus-gpio (or another name)
>      - a pullup-gpio (or nothing if we drop)

fine by me, as long as their all optional and agreed with devicetree
folks. I think we still have time for v3.19 if you manage to finish this
before next week's end.

>  - there will be a request_irq() and a workqueue (mostly taken from gpio-=
vbus)
>    =3D> will call usb_gadget_vbus_connect()
>    =3D> will call usb_gadget_vbus_disconnect()

the workqueue should be unnecessary if you use
devm_request_threaded_irq() without a top half.

> I'm writing all this just to be sure I have the good picture before I
> start coding.

sounds good to me :-)

When it comes to DT, let's try to keep things as generic as possible so
we can just move phy-generic.c into drivers/phy/ later on without much
effort ;-)

I guess everything that you need already has existent bindings.

cheers

--=20
balbi

--EDT6MSV0B3GxyNyZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUWoQGAAoJEIaOsuA1yqREcvMP/3GA7kwa3YlVn6ogS16i+9bq
yrejKMgtmhUaXQNRPEq4jIwIPb2BLlLtqMl4k4iQ8HLmcvjL06ipvEiahjfPB8LA
Ee++5vbEO5xE2j7R1jnKXpWtCy08LwV8MGQGwoXhTv0I53893CXq/DLhFbK4oBjR
cYk+yZcC6xH5mwVO4L6TmLa+6EIXktoFXEdAqshrrvw/acmW54T4ihpzQIwSHyOv
WrpK6s/XeepFmicnK6+Wt9Dw4JgDYwa0PBqAnQfVuuHsqqOnTKKvtTPSsIVzWsgD
jb3SararQe50ZiyhrU6dLqKUWcQ53hYG1QwQ+md4TOprydlWeUBv8P+xOKNUOPgf
MjyNEAKdOrQOzPC++K8rJfTZDtlLKmkgxOarYimGp8M0Zg4UkxYiMWhL5Qe/vTET
FxmZv3mkBkApJu5smHL6Tr+oEaWzoXnYbZpxMmJqkD2kyZIAJ7nbCNIbQeVzoxLD
Hsn38ph8jlZQW0FNOFZtvWvnUrvrOX89di2LkZHMjXKbi5bpDaNPKJ48aW+Qd//Y
OpacfzKGZdZVkYgHO6I/QqJNM/oLCUBf8pl/qPeRhknOKkWyXEnLwWKOmmjM0zg/
wBXPpNtygEAA3Fq9J3mmLHPTgJ3jvD1EV1cmgEAqYAcWQ2J+ceVVd2SfMECkfFLH
PYxE8epdU/AAaJgCps9D
=oFWb
-----END PGP SIGNATURE-----

--EDT6MSV0B3GxyNyZ--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
