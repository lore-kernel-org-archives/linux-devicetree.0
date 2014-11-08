From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v1 2/3] usb: phy: convert gpio-vbus to gpio_desc
Date: Sat, 8 Nov 2014 12:06:52 -0600
Message-ID: <20141108180652.GA17567@saruman>
References: <1414951910-16075-1-git-send-email-robert.jarzmik@free.fr>
 <1414951910-16075-2-git-send-email-robert.jarzmik@free.fr>
 <20141105192957.GM6548@saruman>
 <87sihx1lcd.fsf@free.fr>
 <20141105195015.GU6548@saruman>
 <87oasl1kn7.fsf@free.fr>
 <20141105200942.GW6548@saruman>
 <87a941wppk.fsf@free.fr>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87a941wppk.fsf-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 08, 2014 at 06:45:59PM +0100, Robert Jarzmik wrote:
> Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> writes:
>=20
> > fine by me, as long as their all optional and agreed with devicetree

dumb me: s/their/they're

> > folks. I think we still have time for v3.19 if you manage to finish this
> > before next week's end.
> I will try, no promise I'll succeed in this window.

sure, no pressure either :-)

> At least I should fire out within the next days the gpiod patch and
> the DT documentation patch if I want to respect the schedule.

good, we can at least cut down some dependencies for v3.20.

--=20
balbi

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUXlu7AAoJEIaOsuA1yqREIi4P/0cWXkDJjVfzLg++C7tP1skg
X1EYnmKQFxI1/Hxskn8rBI/EXm6dDZraCIr+WQ4jvak3+V4oq49j2chAhtaaEMob
l6Tg9pobsbg+wKJO9/c+YFtljW/+r7WSdiEUWVNUjc11oyUXmCjEQd68M2RClQHL
7q5QGAEMmx3RCYdCK/aQto9UkJyNgrlhvHee0et4PApzhwX2awxCZyni7I22aX4t
jd73o9efaB64ZzlKaAFVl7bQ9xURMfIhgzvxaLsqu9wkZd+6vyh0+sg0gaNudmn5
NIUg64NFvGTpV6xHIwcm4TDoZuR86MdNdZqUsTjaxfv9ZysWlba26aym8kFxJemO
vCQO02agFVgoBvijnaGyx3JJND1t2jdjJwQK7NpPryJDBsxrNW02KzSq8k3nfyJK
UN0sUhTHXxnGBF4aM1CyGQ8Fwq9jMmzXENixkhGblox8eee9Ncb9XntBnWPd1Jx+
n3jXBfItnrdPyW1hV1DjjRoidWiqAGUQN7wxfxQEIHmC+UVB7SDR6FQCtBd30GSz
zCoVjFcEKeixvT8nTHHy8QSRc13nNTqJZZyDa3eoCdE5QwCTRAg1AYjGNsAbF8dx
BBtelCXkeNO585WwIz7uscySpCjG6P7PV6wV3sUUnBCVkdx2u7HJsq8VpyD5vpw5
sUvTfo9ONsVscc0J/gaa
=NFcO
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
