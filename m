From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH v3 6/6] mfd: dt: Move syscon bindings to syscon
 subdirectory
Date: Tue, 13 Dec 2016 23:09:05 +1030
Message-ID: <1481632745.3112.42.camel@aj.id.au>
References: <20161206025321.1792-1-andrew@aj.id.au>
         <20161213110710.GV3625@dell.home> <1481630734.3112.40.camel@aj.id.au>
         <5094120.Y7DXfRGTEm@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-jyDX9i7r16dg28HsuaB+"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5094120.Y7DXfRGTEm@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-jyDX9i7r16dg28HsuaB+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-12-13 at 13:17 +0100, Arnd Bergmann wrote:
> On Tuesday, December 13, 2016 10:35:34 PM CET Andrew Jeffery wrote:
> > On Tue, 2016-12-13 at 11:07 +0000, Lee Jones wrote:
> > > On Tue, 13 Dec 2016, Andrew Jeffery wrote:
> > > > On Mon, 2016-12-12 at 09:39 -0600, Rob Herring wrote:
> > > > > On Tue, Dec 06, 2016 at 01:53:21PM +1100, Andrew Jeffery wrote:
> > > >=20
> > > > Lee's next email in the chain poked Arnd for an opinion, but Arnd
> > > > didn't reply.
> > > >=20
> > > > I don't mind. I moved these bindings separately so we could just dr=
op
> > > > the patch if there was push-back. If we drop the whole idea I'll ne=
ed
> > > > to apply a small fix to patch 5/6 to avoid creating the syscon
> > > > subdirectory.
> > >=20
> > > The sub-directory is a good idea for drivers who are *solely* syscon
> > > based.
> > >=20
> >=20
> > Yes, I wasn't saying otherwise, just commenting on my motivation and
> > approach.
> >=20
> > As far as I can tell all of the bindings I move here describe solely
> > syscon-based devices.
> >=20
>=20
> But do we know which ones they are?
>=20
> In principle, any syscon device node can have a specialized driver
> exporting an interface, the bindings always allow it to be done
> one way or the other, and we may change the driver or run a different
> OS that has decided differently.
>=20

Right; for the Linux case there are currently no driver implementations
that match on the compatible strings in the documents I moved (save for
qcom,tcsr, except that it's the qcom,gsbi compatible driver parsing a
phandle to the qcom,tcsr syscon node).

However, I can't guarantee the solely-syscon property for other
operating systems. Given that, it now looks to me like we shouldn't
have such a directory at all.

Cheers,

Andrew
--=-jyDX9i7r16dg28HsuaB+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYT+vpAAoJEJ0dnzgO5LT5PXgP/03s+DU+6Qj9L6Sw2s4njOHb
tAqN5BqtEMH0vYkoQ/88t4TVJRYtyfPeoGzdJnuQJxos90ymuW40jdKNEBqf8daq
H5hDXJRgYTRtPMyLx/k+D6GLCc3zhG00NANNWm9NvBt6vUn7jzpWRmFOmNMNYqOF
QdVf0YDXqQyQCuZdJ8GYkdyF9HTabrdngmF9zUP6tprtAR0W1MxNh7+PF4IhE4Xv
1TOBtrtnLt40IYwRatcFRLg+kb3Ly3xYmflb3pgBVV/Zoef1eJmBXHF+AQv+yCEY
ikn4YSRWb7FwE70yu8Aslr7vZ3hGjpOYP8hu50ME0zEWddggOR6wii8Ijf9RU75/
BsmFxQHsIHmqhCPG4I4zJkmW4EA3xSjWC1+3TzIksGFOmBinKaVU1nlV3GGwVL4m
oEP/YTQ5asySI3K9A/2IQ8sRK/fdKpls5LtcIcuwgWTWScQO95w0NQUg0YCXQvfS
12JIbzTe2BgtkQqYJzXiYxhhERxZOkRHcoX7LQtV3cVt0WmrhxK67pi3buLFGgM6
JpTXQ7/gFEEkSmj4XD71Dy9j4dbaghjeYbPDTakO58feHsS0REE5ABJbmwp+Bk0v
b+BJ4JuKssiQOXAmCNg11ViBYR6t+AAcAf16z+NMG4Zhplmew48v96hgzd/cbxEV
ra/g2T/0ijr/edWlVS8l
=MJ6F
-----END PGP SIGNATURE-----

--=-jyDX9i7r16dg28HsuaB+--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
