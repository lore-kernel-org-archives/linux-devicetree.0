From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Re: [PATCH 02/12] drm: sun4i: Add support for
 enabling DDC I2C bus to dw_hdmi glue
Date: Tue, 9 Apr 2019 09:45:17 +0200
Message-ID: <20190409074517.lu4gsmyq2qcunqg4@flea>
References: <20190405234514.6183-1-megous@megous.com>
 <20190405234514.6183-3-megous@megous.com>
 <20190408072338.3urcotemju3qi2un@flea>
 <CAGb2v65W_H5HrnY9+DuW-noshXLHgErJhEpHHhzcG15n1u=8iw@mail.gmail.com>
 <20190408084714.b6xdi2pxbjvzwsnu@flea>
 <20190408121727.4vdqdokr6w5thck6@core.my.home>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ex55duqs5l5l627l"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBFE3WHSQKGQE2INCXLY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190408121727.4vdqdokr6w5thck6-9v8tmBix7cb9zxVx7UNMDg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Franky Lin <franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hante Meuleman <hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Wright Feng <wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Naveen Gupta <naveen.gupta-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel@l>
List-Id: devicetree@vger.kernel.org


--ex55duqs5l5l627l
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 08, 2019 at 02:17:27PM +0200, Ond=C5=99ej Jirman wrote:
> On Mon, Apr 08, 2019 at 10:47:14AM +0200, Maxime Ripard wrote:
> > On Mon, Apr 08, 2019 at 03:28:24PM +0800, Chen-Yu Tsai wrote:
> > > On Mon, Apr 8, 2019 at 3:23 PM Maxime Ripard <maxime.ripard@bootlin.c=
om> wrote:
> > > >
> > > > On Sat, Apr 06, 2019 at 01:45:04AM +0200, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org wrote:
> > > > > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > > > >
> > > > > Orange Pi 3 board requires enabling DDC I2C bus via some GPIO con=
nected
> > > > > transistors, before it can be used. Model this as a power supply =
for DDC
> > > > > (via regulator framework).
> > > > >
> > > > > Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > > >
> > > > The DDC bus itself is usually attached to the HDMI connector, so it
> > > > would make sense to make the supply also a property of the connecto=
r.
> > >
> > > I believe these are separate things. What this patch covers is power =
for
> > > a voltage shifter between the SoC and HDMI DDC pins. The HDMI connect=
or's
> > > 5V supply to power the remote DDC chip is something else. And on the
> > > Orange Pi 3 they are indeed separate supplies.
> >
> > Then maybe the endpoint link between the two would be the best place
> > to put this?
>
> Interestingly &hdmi node configures the DDC bus pins via pinctrl on the S=
oC
> side, so I put this there too, because it's related to those pins. I'm no=
t sure
> if that changes anything in the discussion.

It's kind of different though. The DDC controller is within the HDMI
controller, which is inside the SoC. Just like the pin muxer. As far
as the hardware goes, even on your board, you don't need that supply
so that the signal gets out of the SoC.

If the regulator is to power up some component on the path between the
SoC and the connector, then it should be attached there.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--ex55duqs5l5l627l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKxNjQAKCRDj7w1vZxhR
xd1YAQCbZIs2Pp7jd1cm9rrokDi5iMPRnQBKcSOdLIRXgkvLTAEAjNSL9iiFRvXv
J1tkS7/bj/Wsm4X0Ihv29bnFFGddWwQ=
=LLjI
-----END PGP SIGNATURE-----

--ex55duqs5l5l627l--
