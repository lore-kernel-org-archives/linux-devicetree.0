From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi][PATCH 5/5] arm64: allwinner: a64: Add DAI nodes
Date: Thu, 25 Jan 2018 16:31:42 +0100
Message-ID: <20180125153142.322ce343cjzxer7g@flea.lan>
References: <20180124103943.2062-1-codekipper@gmail.com>
 <20180124103943.2062-6-codekipper@gmail.com>
 <20180124110222.cdglyg5m7644xiem@flea.lan>
 <CAEKpxBk8NXJn4KxEGXx7UddqpUMC65kdEgx1phZDWyUd3ER_3Q@mail.gmail.com>
 <20180125082904.t4sqob626kyzw4ga@flea.lan>
 <CAEKpxBmbhtGxk7hZMt3h7M_ih9njrwbtR7ooP4PT2kRD6xf=rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jxvw7izxteol4db3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAEKpxBmbhtGxk7hZMt3h7M_ih9njrwbtR7ooP4PT2kRD6xf=rw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--jxvw7izxteol4db3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2018 at 10:46:15AM +0100, Code Kipper wrote:
> On 25 January 2018 at 09:29, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On Wed, Jan 24, 2018 at 12:39:31PM +0100, Code Kipper wrote:
> >> On 24 January 2018 at 12:02, Maxime Ripard
> >> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >> > Hi,
> >> >
> >> > On Wed, Jan 24, 2018 at 11:39:43AM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> >> >> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> >>
> >> >> Add the DAI blocks to the device tree. I2S0 and I2S1 are for
> >> >> connecting to an external codec.
> >> >>
> >> >> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> >> ---
> >> >>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 26 +++++++++++++++=
+++++++++++
> >> >>  1 file changed, 26 insertions(+)
> >> >>
> >> >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/a=
rm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> >> index f060a58f374c..f3354f8c2026 100644
> >> >> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> >> @@ -419,6 +419,32 @@
> >> >>                       status =3D "disabled";
> >> >>               };
> >> >>
> >> >> +             i2s0: i2s@1c22000 {
> >> >> +                     #sound-dai-cells =3D <0>;
> >> >> +                     compatible =3D "allwinner,sun8i-h3-i2s";
> >> >
> >> > Same remark than for the spdif, please add a soc-specific compatible.
> >>
> >> Is that really necessary?..
> >
> > Yes.
> >
> >> for example on the a20 the functionality of the i2s is the same as
> >> the a10 so it is down as "allwinner,sun4i-a10-i2s", likewise here
> >> it's the same as the changes required for the H3. I was planning on
> >> using the compatible "allwinner,sun50i-a64-i2s" for the audio codec
> >> as there are some quirks that need to be addressed.
> >
> > And this is exactly why it is necessary. If we ever find a quirk in
> > the future, supporting that quirk will be smooth if we already have a
> > compatible for that SoC in the DT, and a pain if we don't.
> Hi Maxime,
> so just to comfirm. I'll make this change
> compatible =3D "allwinner,sun50i-a64-i2s", "allwinner,sun8i-h3-i2s"; to t=
he dtsi
> and later will add to the i2s driver the compatible
> "allwinner,sun50i-a64-i2s-audio-codec"(or something other than
> allwinner,sun50i-a64-i2s) for the quirks required for the i2s block
> used for the audio codec.

That looks reasonable yes.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--jxvw7izxteol4db3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpp+F0ACgkQ0rTAlCFN
r3QMtxAAj0oDwct6OIH+YtGlG1zHkmCDhkneUhgdAjm23gwCy2Q4fzH47zmQylgW
uMyaewhVk5G6KGAvfQbOEus07tmDXRshJAGoYTDuButwjJXL+ENrUCnRKRPuBPry
PnMw+n/jbFc0O7vr2Uc1bSlNNleDwb8Zxl0oG+7uAVbBvPVBJxuN8494CdbHSOyh
9Ehxc9mQgzyG5CqtkT2lErqYs5uwllpUaGcgqbSn2sXx9lvhYPEs/vFQiVA8K84A
oZIiWXUmFET6YhiXvDBmfxmv0wlX4PNc1qSxNuef6a8QgkRTkJ1F4nAqvHnxO2Hg
VYi6/yWQZWvuScxtL/cAFoPXnSLPEcFEz1EYV4Pcyt0tk3uSI4MZYymOFT6D44uv
80gBRMTIqmqUAuRw07VO9GuEpNGYWr9Z5pB6ca9keF88jpOIBlEzzRM9ois8Ven4
C1H7hAFKmL2zEwPVtsOpZVlDa3XQQRW0yQAtfJZgS4vCIStOj8CRHcazU2rJMDxV
2R76I1UOa6dgRDAPKoC705iykwmUvUkXwJxT/7ULCDrX+aEjqFgMs18kybaqmwio
EuyZvFdkkM4ecefdpOzH/SXH9TOiFTpcYDLrULkaMOHfpXf8o5y54VAIoSsMJoeS
byx+M+J1fn7b1JHyufI8IYO9qOn23VOwCgCuVKhxBLOFPwOo5qE=
=VRKM
-----END PGP SIGNATURE-----

--jxvw7izxteol4db3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
