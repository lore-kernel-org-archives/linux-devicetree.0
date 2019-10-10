From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 2/3] ARM: dts: add Netronix E60K02 board common file
Date: Thu, 10 Oct 2019 12:50:51 +0200
Message-ID: <20191010105051.GG19803@latitude>
References: <20190930194332.12246-1-andreas@kemnade.info>
 <20190930194332.12246-3-andreas@kemnade.info>
 <20191006223848.GE19803@latitude>
 <20191010073129.607f7b6f@kemnade.info>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0055864157273189629=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191010073129.607f7b6f@kemnade.info>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: mark.rutland@arm.com, marex@denx.de, Marco Felsch <m.felsch@pengutronix.de>, devicetree@vger.kernel.org, andrew.smirnov@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de, angus@akkea.ca, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, manivannan.sadhasivam@linaro.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0055864157273189629==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E69HUUNAyIJqGpVn"
Content-Disposition: inline


--E69HUUNAyIJqGpVn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2019 at 07:31:29AM +0200, Andreas Kemnade wrote:
> Hi Jonathan,
>=20
> On Mon, 7 Oct 2019 00:38:48 +0200
> Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> wrote:
>=20
> > Thanks for CCing me on this patchset. Nice to see more e-book reader
> > related work!
> >=20
> btw. seems that we have a common target, since our ebook readers both
> have a tps65185. It seems to be a good idea to comment things on the
> i2c busses without proper bindings. That might help to find allies.

Yep. I did this in imx50-kobo-aura.dts:

	/* TODO: TPS65185 PMIC for E Ink at 0x68 */


If you want to take on the task of writing/upstreaming a TPS65185
driver, feel free. I'm currently not working on one.
(I have an MFD driver and a hwmon driver on a branch somewhere, but no
regulator driver.)

> I will send a v3 with correct memory, better name for GLED
> and the above-mentioned comments.

Thanks!

--E69HUUNAyIJqGpVn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl2fDPkACgkQCDBEmo7z
X9tnWA//emtOhSRw1zxZK6fZP0uHAJvsQEaElaqk/KIEwrlBbRp9z4jyqyqWQkSJ
lw1P4ukj3fRqtdYf0L0fzO6sssSZcVLztO0BVO0PeP9R0DXxjcJ4HeD+PMvu0962
8kZxzYcA0j5qCPacCDCLnpQbbDqFN5OrW8jyjipjui9fp0EAikqObtLNn0OTM2gs
9zttSZu9gWCKXQxivfEp1W07v3sHrQuIKRvOGY8pDz0aXy5ahJ9Qv6wIS+SnovOM
GRPX6ZJE4BVUS9YonFITt9+h1VMJZw0YtxwDncjaDVqHE7DliwqowGcAPjRviceE
CK3/bikNO5hGZhlXIi5/KIJgbZ+Bp5laTFMKfNvYHFt8MjKIzLBsn+iXO3eZ+Rd5
0+H/WQNBAPaBhocrVkGm8Xkv72AkP7+M+zCJb1MbAvCwcTiTA4mMQ1MZ4GS2aE7W
z+SU/fu6CFRIjsSHsQ86qtx1bmSI1w18VFFGCYnPNMmu4KHSVhah+yjnZE4gzfDO
oOHuZO5tZ/7Ac8FHRjr6sWBZrf5B37FJbs+WmTzZcrY8CmM1BZvGAFvzkgOQAqlS
Jf7nNiJ00+hED3taMwzTQPdRprnwuFFHzKD+YfiMIEU9ugUUbuYqw1ai9ALbWXLm
2OTYEpI9Pthh6OFe4ADt3iZgSgFJtmYtkEGLGc3x2GPJ9+eiquU=
=MOg3
-----END PGP SIGNATURE-----

--E69HUUNAyIJqGpVn--


--===============0055864157273189629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0055864157273189629==--
