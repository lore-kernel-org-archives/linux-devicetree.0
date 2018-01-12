From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/7] pinctrl: sunxi: add support for pin
 controllers without bus gate
Date: Fri, 12 Jan 2018 09:51:34 +0100
Message-ID: <20180112085134.dcsikciujsxuuwhx@flea.lan>
References: <20180106042326.46519-1-icenowy@aosc.io>
 <ef82983f-6f91-46c2-1f67-7d4efc10c905@arm.com>
 <3A97A26E-0774-4279-B7B9-8312225E2C72@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sqfzuowjuk7oe46v"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBIPO4HJAKGQEWWPHUOA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <3A97A26E-0774-4279-B7B9-8312225E2C72-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--sqfzuowjuk7oe46v
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

1;5002;0c
On Thu, Jan 11, 2018 at 09:21:06PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2018=E5=B9=B41=E6=9C=8811=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
7:48:40, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> =E5=86=99=E5=88=B0:
> >Hi,
> >
> >another take to avoid this patch at all, I just remembered this from an
> >IRC discussion before:
> >
> >On 06/01/18 04:23, Icenowy Zheng wrote:
> >> The Allwinner H6 pin controllers (both the main one and the CPUs one)
> >> have no bus gate clocks.
> >
> >I don't think this is true. The pin controller *needs* an APB clock,
> >it's just not gate-able or not exposed or documented.
> >The "system bus tree" on page 90 in the manual shows that the "GPIO"
> >block is located on the APB1 bus.
> >So can't we just reference this apb clock directly? That would be much
> >cleaner, "more" correct and require less changes: "The best patch is no
> >patch":
>=20
> I can accept this. (In fact I have considered this, but
> I don't dare to directly use bus clock in a device, as it's not
> exported before.
>=20
> Maxime, Chen-Yu, can you agree the following code?

Yes, that works for me.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--sqfzuowjuk7oe46v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpYdxUACgkQ0rTAlCFN
r3QKiw/9Hae+QLluYxYJP3sdeGHTY9+aEY/fvPXv/9YjXAN2a1UKHtvC7d/tciwA
v5BULn6zZ/Pky/8N3AXttmNcfpjJSFMj7BQCw41dlzWL91RCfCsVet2HEmC1xCrq
3TRmqWEHflDZiHzbG+SNealqOHh7/Ey7wvPMO8YGB/bxNBWb8HTz2nN7s51zD+RS
W3pWUSZDUYAw1PZyV9RONZTJkcPdnlUJceockBxlrWlojJ+Ya8XqWL4mNy5ZEzR5
um6WBGYb7x/mdCmIw+6kWY8OgocNgkdSv5oS+HLxr6Vl0Naz/NEiXFo//iFm0BU8
Db14SUeEdKbwy53WCpr251Nsu/WnXIxnWkPj9d0Pef+XIxh7gt+OcCQsng4tnQ+H
zQVXcAuRn8yW7FuIm2Ok9DzZYEikRUC8KpqP0VgWMQovnwkel0gKKq6jTtBdiree
WE+0h+klY0jdCECIqoySgKh/9GWkSSWTHOJDHvk2XapTDEBbgFww7E7gmKNo4rAi
sFmGqnoL2/wGA4fOrgPF3w+qjabwxxNaQ9Z9YMiWtVVt81xcKfUVGhS1cfkYUir2
0NSufc/EACIwwHMNOlYrvP+PPuXPAd6lLwitEL0lRc13zj0s26BWMQrPW+nMWGY2
SGDuo/nKtHb0a2rloBecsZIT5ZZCN0aigYtt6WSDVQrfEkJob+4=
=jHXY
-----END PGP SIGNATURE-----

--sqfzuowjuk7oe46v--
