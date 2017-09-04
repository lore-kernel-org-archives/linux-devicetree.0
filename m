From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi][PATCH] ARM: dts: sunxi: h3/h5 :Add DAI nodes
Date: Mon, 4 Sep 2017 13:40:59 +0200
Message-ID: <20170904114059.cqvs4kh4esrzfxo5@flea>
References: <20170903150806.3451-1-codekipper@gmail.com>
 <2581170.20QKPVRcId@jernej-laptop>
 <CAEKpxB=MF-8BPS_Jc=qgj9sTCfn9EKWxdtJQD4goRGSv0xnHMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="kop7f3a3cmwenhcm"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAEKpxB=MF-8BPS_Jc=qgj9sTCfn9EKWxdtJQD4goRGSv0xnHMw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--kop7f3a3cmwenhcm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 04, 2017 at 12:51:38PM +0200, Code Kipper wrote:
> On 3 September 2017 at 18:35, Jernej =C5=A0krabec <jernej.skrabec-ix9DCk4F938@public.gmane.org=
t> wrote:
> > Hi Marcus!
> >
> > Dne nedelja, 03. september 2017 ob 17:08:06 CEST je codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> > napisal(a):
> >> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>
> >> Add the new DAI blocks to the device tree. I2S0 and I2S1 are for
> >> connecting to an external codec whereas I2S2 is used for HDMI
> >> audio.
> >>
> >> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >>  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 39
> >> ++++++++++++++++++++++++++++++++++++++ 1 file changed, 39 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> >> b/arch/arm/boot/dts/sunxi-h3-h5.dtsi index 11240a8313c2..cf6fcc857324
> >> 100644
> >> --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> >> +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> >> @@ -450,6 +450,45 @@
> >>                       status =3D "disabled";
> >>               };
> >>
> >> +             i2s0: i2s@01c22000 {
> >> +                     #sound-dai-cells =3D <0>;
> >> +                     compatible =3D "allwinner,sun8i-h3-i2s";
> >> +                     reg =3D <0x01c22000 0x400>;
> >> +                     interrupts =3D <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> >> +                     clocks =3D <&ccu CLK_BUS_I2S0>, <&ccu CLK_I2S0>;
> >> +                     clock-names =3D "apb", "mod";
> >> +                     dmas =3D <&dma 3>, <&dma 3>;
> >> +                     resets =3D <&ccu RST_BUS_I2S0>;
> >> +                     dma-names =3D "rx", "tx";
> >> +                     status =3D "disabled";
> >> +             };
> >> +
> >> +             i2s1: i2s@01c22400 {
> >> +                     #sound-dai-cells =3D <0>;
> >> +                     compatible =3D "allwinner,sun8i-h3-i2s";
> >> +                     reg =3D <0x01c22400 0x400>;
> >> +                     interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> >> +                     clocks =3D <&ccu CLK_BUS_I2S1>, <&ccu CLK_I2S1>;
> >> +                     clock-names =3D "apb", "mod";
> >> +                     dmas =3D <&dma 4>, <&dma 4>;
> >> +                     resets =3D <&ccu RST_BUS_I2S1>;
> >> +                     dma-names =3D "rx", "tx";
> >> +                     status =3D "disabled";
> >> +             };
> >> +
> >> +             i2s2: i2s@01c22800 {
> >> +                     #sound-dai-cells =3D <0>;
> >> +                     compatible =3D "allwinner,sun8i-h3-i2s";
> >> +                     reg =3D <0x01c22800 0x400>;
> >> +                     interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> >> +                     clocks =3D <&ccu CLK_BUS_I2S2>, <&ccu CLK_I2S2>;
> >> +                     clock-names =3D "apb", "mod";
> >> +                     dmas =3D <&dma 5>, <&dma 5>;
> >> +                     resets =3D <&ccu RST_BUS_I2S2>;
> >> +                     dma-names =3D "rx", "tx";
> >> +                     status =3D "disabled";
> >> +             };
> >> +
> >
> > I don't want to be a pain, but shouldn't we skip this one for now? It i=
s only
> > for HDMI and has different capabilities (8 channels supported and sligh=
lty
> > different formula to calculate oversample rate.
> I'll have a look into this..maybe this can be handled by the
> simple-audio-card binding that we use. The other thing with the
> padding which you mentioned I can add a field for. Maxime, what's your
> thoughts on this?..I can re-submit without i2s2.

Yes, please do so.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kop7f3a3cmwenhcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZrTvLAAoJEBx+YmzsjxAgRAoP/iPbDmP9VxuXiWc4s3HUsTC0
wV5OmtGkBf1mWo79BFey+42l3WGIrNchCt8e7uDjHtk95RFOrZ/Ft5istM4nt64A
/T1HULNBxe9TdUCgfbY01ef8hAsA6UBfGkhKqENdkAf9A948vmZ0tLzQCSoFeKFP
Dx6x5Kzo6Ofa9vNt2s3wTUvZhNXspFDwMk5mERi/wFChjIONtgNgaIVAvWYSbXVC
XuWpYmsS218kaFCidwwYqYmiXc68riGftGVh7n6WN6qR41FNiJS/QtDWY3dwbygi
6sjqK4JCYV/gDVUDXO9SjSu5uNQBk/RsBfb7OnQqrrQvTn0KMC2gRb86nqsDGjha
LpK45m+lMO8sHaQUltMq/+mOdLI6VP8OFPVmSmlsKWluZ2kBQmdUIgM8JUXaczEZ
nWpM+NXvJPsEL/Y2HLfuClcqrOZUjIf/OG1dTqPr4C8JkNmR7seoHcerH6r1EPGZ
1Jw6TPyxOgtLiDoJYLM3UcIH47CO5fzlHVbKUEn8EfxCtcVMfCgaQQuz99uy840D
M3lPwRv+zJ7ynnur6kSTdaK6gN7dxOjlHz9my9q2zWLC8iGY7wgl7zNCIslZ7/dh
VNSY+G04keKc0Hp2JNBM1eEjdeJ0cUCanaUSMq5K/A9X6NZDImyNasIrliQouewV
R5LdgQC95cCb0HRlpA2V
=m2yD
-----END PGP SIGNATURE-----

--kop7f3a3cmwenhcm--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
