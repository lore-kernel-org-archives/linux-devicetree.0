From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3 1/2] drm/bridge: Add Cadence DSI driver
Date: Fri, 01 Sep 2017 11:32:32 -0700
Message-ID: <87efrql16n.fsf@anholt.net>
References: <20170831155519.3704-1-boris.brezillon@free-electrons.com>
 <87k21jzn38.fsf@anholt.net> <20170901082016.3b5e445e@bbrezillon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1901422477=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170901082016.3b5e445e@bbrezillon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Cyprian Wronka <cwronka@cadence.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Simon Hatliff <hatliff@cadence.com>, dri-devel@lists.freedesktop.org, Richard Sproul <sproul@cadence.com>, Rob Herring <robh+dt@kernel.org>, Alan Douglas <adouglas@cadence.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Neil Webb <neilw@cadence.com>
List-Id: devicetree@vger.kernel.org

--===============1901422477==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> Hi Eric,
>
> On Thu, 31 Aug 2017 10:03:23 -0700
> Eric Anholt <eric@anholt.net> wrote:
>
>> Boris Brezillon <boris.brezillon@free-electrons.com> writes:
>> > +			      VID_DATATYPE(MIPI_DSI_PACKED_PIXEL_STREAM_16);
>> > +			break;
>> > +
>> > +		default:
>> > +			dev_err(dsi->base.dev, "Unsupported DSI format\n");
>> > +			return;
>> > +		}=20=20
>>=20
>> > +static irqreturn_t cdns_dsi_interrupt(int irq, void *data)
>> > +{
>> > +	struct cdns_dsi *dsi =3D data;
>> > +	irqreturn_t ret =3D IRQ_NONE;
>> > +	u32 flag, ctl;
>> > +
>> > +	flag =3D readl(dsi->regs + DIRECT_CMD_STS_FLAG);
>> > +	if (flag) {
>> > +		ctl =3D readl(dsi->regs + DIRECT_CMD_STS_CTL);
>> > +		ctl &=3D ~flag;
>> > +		writel(ctl, dsi->regs + DIRECT_CMD_STS_CTL);=20=20
>>=20
>> Are you meant to just write flag to DIRECT_CMD_STS_CLEAR, maybe?
>
> Actually, I want to keep the status flag untouched, I'm just masking the
> interrupt to not be interrupted until the waiter has cleared the
> status flags.
>
> I'm doing that because the user may want to wait for several different
> events (error, done, timeout, ...), and I'm not doing the check in the
> interrupt handler. Instead, I'm just waking up the waiter and let him
> check the status flag himself.

Oh, OK.  That sounds good.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlmpp8AACgkQtdYpNtH8
nuhGHxAAhY2Ij/UA7dKB+TxvPxk1WTl/RECpI5odZ+w38fS5okvLFZkQJlbgHuuN
Yn0PJzCEiPb1eby/TjCuRwNReUrgzbHRV+zM8gs6SZu9xwAgRMeTL4sKfTHbmx8t
+JUwu2ySXY31i3MIjVaj+n/8p6BRD2X0DzXHF2qeJeaslJWV4vRH9zEsw2oNFp3Y
725E/TfmNkLKZ9LO3iSmC4CLAWOrv9m/vLOu+8crgYcGfr3hyU3s0wCIww+b8ngF
1EqMLmK+B4MlexfSiigOa5Wf+P0aHy/iAjJSft9I4isw0K3HAIrkVRPCwZNrapJl
NxojIyk5lQk7Optxn0Nclc3NfDY4ahOhcbgeLboTRm5tFGYriDjq0ljQsnyfcgkt
b+l6aXfjU51nc1eUvonZTG1dz1J5DOMPAmDSPmWaTQ+mmj9UQr+6BISrMtnFPwJo
wvonD/Hb58jSvOiATgPFhc/fW9/nO1S0MXH71IPhok0a4aGw3eRGF1wjj9OSSjAX
z5rf6/D79gwUBOqcXUzWrACapQoD7OKNE9jckBqANYJORRUl71/vgcTUg/E8AzVv
K5pZYu4hKxF7O7nt9rZkMNuoWBs3ttO2gDFuttSkMkULHq9Bi5k608LAw3XsxQFB
LHpdQYZ3WP7AV7DLgRpOICxsaJqini735vKdn6/479QaFmaHajQ=
=685d
-----END PGP SIGNATURE-----
--=-=-=--

--===============1901422477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1901422477==--
