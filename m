From: Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [RFC PATCH 2/2] ASoC: simple-card: Add
 documentation for force-dpcm property
Date: Mon, 14 Oct 2019 17:10:54 +0100
Message-ID: <20191014161054.GD4826@sirena.co.uk>
References: <20191013190014.32138-1-daniel.baluta@nxp.com>
 <20191013190014.32138-3-daniel.baluta@nxp.com>
 <20191014115635.GB4826@sirena.co.uk>
 <CAEnQRZDbXZUhix_aR_DCUzFn1NYz1Zh7MxW5uwnuycps9PNohw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Dzs2zDY0zgkG72+7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEnQRZDbXZUhix_aR_DCUzFn1NYz1Zh7MxW5uwnuycps9PNohw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Guido Roncarolo <guido.roncarolo@nxp.com>, Jerome Laclavere <jerome.laclavere@nxp.com>
List-Id: devicetree@vger.kernel.org


--Dzs2zDY0zgkG72+7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 14, 2019 at 04:17:31PM +0300, Daniel Baluta wrote:
> On Mon, Oct 14, 2019 at 2:57 PM Mark Brown <broonie@kernel.org> wrote:

> > DPCM is an implementation detail of Linux (and one that we want to phase
> > out going forwards too), we shouldn't be putting it in the DT bindings
> > where it becomes an ABI.

> I see your point. This is way I marked the patch series as RFC. I need to find
> another way to reuse simple-card as machine driver for SOF.

Have a look at the way the Renesas systems are using this and the audio
graph card - they have DPCM.

--Dzs2zDY0zgkG72+7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2kng4ACgkQJNaLcl1U
h9AY3Qf+KqjpJbSFjgUExOknWKmIQsHL8qO28Dh8CbziYGq/2T/5n/myzuBq77rJ
Jsf5asU3PTubpf1TQOytAog3UDtT69cqu4JIgAu2GCv7HrX7aZ7keiAlw5rlH8OC
wh5SxpbIgE959u5iOlD3l5e+koSPk+nnpiZAXfq8faWGDcbsA4OlzNqxq5kEX3j6
wQxJwGKHX73MatU5AF2IEBdZQeyg1eygBqNLvAyLp8//NdN/TijgVQbpxK2ZVeCL
RRtZDUu+j2yIvXE6ugzHd/6RQD0VnCZmAXfA/R5hgKIaNVJeyJ6hXZJ3sW7Go4Iu
1DzGwQiDN5A8JadoizM4L/L9L7MAKA==
=ZL3b
-----END PGP SIGNATURE-----

--Dzs2zDY0zgkG72+7--
