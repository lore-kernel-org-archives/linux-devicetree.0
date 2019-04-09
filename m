From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 02/13] arm64: dts: allwinner: h6: Add
 Orange Pi 3 DTS
Date: Tue, 9 Apr 2019 13:47:56 +0200
Message-ID: <20190409114756.v6v33nsdtiitglee@flea>
References: <20190409002452.14551-1-megous@megous.com>
 <20190409002452.14551-3-megous@megous.com>
 <CAMty3ZBK2jPHTP4Y+hiy8Gq+Nx9iWYoUgke+BvopyzR8T6=0Xw@mail.gmail.com>
 <20190409113157.e4vrzesbgmyslomb@core.my.home>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aa6vze47q2e2azio"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB5EMWLSQKGQEDS5UVIQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190409113157.e4vrzesbgmyslomb-9v8tmBix7cb9zxVx7UNMDg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Franky Lin <franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hante Meuleman <hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Wright Feng <wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Naveen Gupta <naveen.gupta-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TaqPxH82wqD4g@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--aa6vze47q2e2azio
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 09, 2019 at 01:31:57PM +0200, Ond=C5=99ej Jirman wrote:
> Hi Jagan,
>
> On Tue, Apr 09, 2019 at 02:08:18PM +0530, Jagan Teki wrote:
> > Based on the conversation about using common dtsi from this thread[1],
> > I'm commenting here to make show the diff directly on the nodes,
> > giving comments on each node so-that we can see the diff globally.
>
> Thanks for the suggestions below. It mostly repeats the differences and
> commonalities I already stated in the previous discussion.
>
> I don't have much to add to what I already said previously, though, becau=
se you
> didn't address my concerns there. But I can restate and expand on those
> concerns.
>
> Previously I already agreed it's possible to base orangepi-3.dts on
> orangepi.dtsi, and proposed a maintainable way forward, and why to follow=
 it (to
> quote myself):
>
>   Schematics allow for high amount of variability in the power tree (see =
all the
>   NC (not connected) / 0R resistors) in the schematic around AXP805. Ever=
y board
>   based on this Xunlong design can be subtly different.
>
>   I already suggested a maintainable solution, below. Where base dtsi has=
 empty
>   config for regulators and every board based on that just defines it com=
pletely
>   for itself.
>
>   A few regulators (for CPU/GPU) will most probably have the same meaning=
 on
>   every derived board, so these can probably be kept in dtsi without caus=
ing too
>   much annoyance.
>
>   It's unpleasant to have wrong regulator setup defined in an underlying =
dtsi,
>   and then trying to override it by removing/adding random properties in =
the
>   board dts for the new boards based on that, so that it fits.
>
>   The rest of the current HW descriptions in the sun50i-h6-orangepi.dtsi =
can be
>   shared (as of now).
>
> My suggestion was this:
>
>   So to base Orange Pi 3 dts on top of existing sun50i-h6-orangepi.dtsi I=
'd have
>   to first move some things out of the base dtsi to the OrangePi Lite2 an=
d One
>   Plus board dts files, in order to have sun50i-h6-orangepi.dtsi only des=
cribe
>   HW that is *really* shared by these 2 boards and Orange Pi 3.
>
>   If I do that, I'd undefine all the axp805 regulator nodes and move the
>   configurations to each of the 3 board files. That will probably end up =
being
>   the least confusing and most maintainable. See axp81x.dtsi lines 86-144=
 for
>   what I mean.
>
> You seem to be suggesting a solution where every time we add an OrangePi =
H6
> based board, the person adding it will have to go through the base dtsi a=
nd all
> the other boards based on it, status disable or otherwise change regulato=
rs in
> the base dtsi, patch all the other boards to re-enable it.
>
> It would be already unpleasant just adding a third board based on this ap=
proach.
> And when the fourth board is added, with another small differences in the
> regulator use/meanings, the person will be looking at patching 4 dts file=
s
> + adding one for his own board. For what benefit, to save some bytes righ=
t now?
>
> I think maintainability, ease of adding new boards is more important, tha=
n
> having a dtsi that tries to maximally cover all the commonalities between=
 the
> existing boards right now, without regards for the future. That's why
> I suggested an approach like in axp81x.dtsi lines 86-144.

I agree.

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

--aa6vze47q2e2azio
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKyGbAAKCRDj7w1vZxhR
xZTAAQCOzqr6NWU8ZLOC72DWyNDWvVDoMHEH5977Yq/x03pA3wEAwsPhQ1kQG3mb
mRjfuU5xD+jCyn066cuvMBk6bRHgQgA=
=ef/T
-----END PGP SIGNATURE-----

--aa6vze47q2e2azio--
