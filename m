From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 7/9] ARM: STi: DT: STiH407: Add FDMA driver dt nodes.
Date: Fri, 11 Sep 2015 18:55:55 +0100
Message-ID: <20150911175555.GF18779@x1>
References: <1441980871-24475-1-git-send-email-peter.griffin@linaro.org>
 <1441980871-24475-8-git-send-email-peter.griffin@linaro.org>
 <20150911162749.GD18779@x1>
 <20150911164822.GA1150@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150911164822.GA1150@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 11 Sep 2015, Peter Griffin wrote:
> On Fri, 11 Sep 2015, Lee Jones wrote:
> > On Fri, 11 Sep 2015, Peter Griffin wrote:
> >=20
> > > These nodes are required to get the fdma driver working
> > > on STiH407 based silicon.
> > >=20
> > > Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > ---
> > >  arch/arm/boot/dts/stih407-family.dtsi | 51 +++++++++++++++++++++=
++++++++++++++
> > >  1 file changed, 51 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boo=
t/dts/stih407-family.dtsi
> > > index 838b812..da07474b 100644
> > > --- a/arch/arm/boot/dts/stih407-family.dtsi
> > > +++ b/arch/arm/boot/dts/stih407-family.dtsi
> > > @@ -565,5 +565,56 @@
> > >  						  <&phy_port2 PHY_TYPE_USB3>;
> > >  			};
> > >  		};
> > > +
> > > +		fdma0: fdma0-audio@8e20000 {
> >=20
> > I'm not familiar with the FDMA driver, so can't comment knowledgeab=
ly,
> > but the <dev> part of <dev>@<base_address> should only describe the
> > type of hardware.  I believe in this case it should just be
> > dma@08e20000.  Also notice the leading zero in the address, which I
> > believe mitigates possible confusion.  Then you be more specific wi=
th
> > the label, so something like 'fdma-audio' seems appropriate here.
>=20
> Ok, can change to that format in v3.
>=20
> >=20
> > > +			compatible =3D "st,stih407-fdma-mpe31";
> > > +			reg =3D <0x8e20000 0x20000>;
> >=20
> > I personally find padding up to 32bits helpful in the addresses.
>=20
> None of the stih407-family nodes I can see have this padding, includi=
ng
> the ones merged by you.

Nither of these two facts mean it's correct.

I'm happy to write a patch to correct them all.

Bear in mind that this isn't a hard and fast rule.  Both work and are
legal.  I just think the padding is more consistent.

> > > +			interrupts =3D <GIC_SPI 5 IRQ_TYPE_NONE>;
> > > +			dma-channels =3D <16>;
> > > +			#dma-cells =3D <3>;
> > > +			st,fdma-id =3D <0>;
> >=20
> > We usually shy away from ID properties.  What is it required for in
> > this case?
>=20
> Yes Rob did already mention that over here, see my reply at the botto=
m
> http://www.spinics.net/lists/devicetree/msg92529.html.
>=20
> However I can't think of any other useful properties we could add
> to derive this information. The fdma controller number is used
> by the driver to generate a unique firmware filename.

Who chooses the naming scheme of the firmware binary?

Is there any reason they can't be:

  fdma_STiH407_audio.elf
  fdma_STiH407_app.elf
  fdma_STiH407_free_running.elf

Then you can have a different compatible for each.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
