From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 0/9] Doc/DT: DT bindings for various display components
Date: Mon, 17 Mar 2014 15:55:27 +0200
Message-ID: <5326FECF.9070104@ti.com>
References: <1393590016-9361-1-git-send-email-tomi.valkeinen@ti.com>
 <532017B3.708@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6633667464776523387=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <532017B3.708@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@linaro.org>
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, Tomasz Figa <tomasz.figa@gmail.com>, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Rob Clark <robdclark@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

--===============6633667464776523387==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="OEQSqhwqi6p5A4LjV7dsp9MGstraGuEkI"

--OEQSqhwqi6p5A4LjV7dsp9MGstraGuEkI
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Grant,

Ping.

Are you fine with me proceeding with the current V4L2 port/endpoint
bindings?

 Tomi

On 12/03/14 10:15, Tomi Valkeinen wrote:
> Hi Grant,
>=20
> On 28/02/14 14:20, Tomi Valkeinen wrote:
>> Hi,
>>
>> This series is a re-send of
>> http://article.gmane.org/gmane.linux.drivers.devicetree/61739
>>
>> I'm cc'ing more people, and I want to clarify the contents of the seri=
es:
>>
>> While this has been developed for OMAP, only the first patch is about =
OMAP
>> bindings. The rest are generic bindings for video components, which ca=
n be used
>> on any platform.
>>
>> The bindings use the V4L2 style video port/endpoint system, described =
in
>> Documentation/devicetree/bindings/media/video-interfaces.txt, to conne=
ct the
>> components. The same port/endpoint bindings are used by Philipp Zabel =
in his
>> imx-drm patch series.
>=20
> This series is a piece of bigger series, which brings DT support for
> OMAP display subsystem. This uses the same V4L2 style ports/endpoints a=
s
> has been discussed recently regarding the series from Philipp. It
> doesn't use the helper code from Philipp, but a custom one as Philipp's=

> code didn't exist when I made this, and also because I needed extra
> functionality not present in Philipp's series (which aimed to just move=

> the current V4L2 code to a common place).
>=20
> The main concerns with the ports/endpoints has been the optional 'port'=

> node for the case where we have a single endpoint, and the
> double-linking of the endpoints.
>=20
> If I remove the optional 'port' usage from my series, are you ok with m=
e
> proceeding with this series for 3.15, with the double-linked endpoints?=

>=20
> As far as I see, when we come to a conclusion how the linking should be=

> made, it's trivial to change the bindings in this series to match it,
> even without needing any compatibility code. I just need to remove the
> other link, and old dts files having double-linking will still work fin=
e.
>=20
> The reason I want to push this forward asap is that omap4 and omap5 are=

> already DT only, and for omap5 we don't have working display without DT=

> support for display. For omap4, we have a really hacky way to add
> display support for a few boards, but that is causing major headaches
> and I want to get rid of it.
>=20
>  Tomi
>=20
>=20



--OEQSqhwqi6p5A4LjV7dsp9MGstraGuEkI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTJv7PAAoJEPo9qoy8lh71vnYP+wRa6mhmz5mWarL8F9IKk6xu
zljbATK49H2ZdCAKMHRvWQNKi/ZBxAZ7zGEjO9G2KAAFFQdt3MwjUgZrdOHeNx40
hg/7NUZRfg3x6o8OT8/+29AH97VlaGntkMo0R72zMVJiS53DzbaqG2B0BYbaLdGf
s/PE2sqYztHfAT0QmNhgQUpHyIlPO3ALjxQM1ONe1DUbvglPha/qbVga4Kb7dgu1
m5pDmSwpqkzcNFOkOf15omJCYOlbTLK8ik/VQSxrwrPCXeLj3SGtBna2/XmFMbYe
vaSa8v41uaJLMWNwQ4fCUNGoBvdl3Hgur79FwzlcDa4k++9ZXoZld6BfbL668GzI
np+8jo5KacGOtGwDLuox0HVovNCEd9Z2TanDl4Z60dcjZc0iOen39nxRumd3WqQJ
ZbqZwuIEm3ue56KhuqOu1Y1YiroJVJkM5zDa/m9YL9MULAxcrCfo/rf5kHWKBApT
ZxREbfihFQ8N+IFaE4VgYWC0hg4DLV4KjI8vjGM/m1T1Bn2Zs8dSe+o0GLgf3u/Q
R9S++GfMl1tHBrqsy4xwM0BoJGfjHp0UWAQ7O0WetS7p9rkHbrCixRM2ul4PuuOj
fOeExvUSTZtT1y2cRjdzFRB4njp4WUDuca+yHHeiSc5AFX7IHUOHJQ6LCUnNXvnC
ilC+FtrnfVZTLMkVtwf3
=tRh3
-----END PGP SIGNATURE-----

--OEQSqhwqi6p5A4LjV7dsp9MGstraGuEkI--


--===============6633667464776523387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6633667464776523387==--
