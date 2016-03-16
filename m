From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [STLinux Kernel] [PATCH v5 7/7] ARM: STiH407: Move over to using
 the 'reserved-memory' API for obtaining DMA memory
Date: Wed, 16 Mar 2016 16:55:26 +0000
Message-ID: <20160316165526.GZ13692@x1>
References: <1452602781-22424-1-git-send-email-lee.jones@linaro.org>
 <1452602781-22424-8-git-send-email-lee.jones@linaro.org>
 <20160316163508.GA8396@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160316163508.GA8396@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 16 Mar 2016, Peter Griffin wrote:

> Hi Lee,
>=20
> On Tue, 12 Jan 2016, Lee Jones wrote:
>=20
> > Doing so saves quite a bit of code in the driver.
> >=20
> > For more information on the 'reserved-memory' bindings see:
> >=20
> >   Documentation/devicetree/bindings/reserved-memory/reserved-memory=
=2Etxt
> >=20
> > Suggested-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
> > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/stih407-family.dtsi | 46 +++++++++++++++++++++++=
++++++------
> >  1 file changed, 38 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/=
dts/stih407-family.dtsi
> > index 15c20b6..27b8efc 100644
> > --- a/arch/arm/boot/dts/stih407-family.dtsi
> > +++ b/arch/arm/boot/dts/stih407-family.dtsi
> > @@ -15,6 +15,36 @@
> >  	#address-cells =3D <1>;
> >  	#size-cells =3D <1>;
> > =20
> > +	reserved-memory {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
> > +		ranges;
> > +
> > +		gp0_reserved: rproc@40000000 {
> > +			compatible =3D "shared-dma-pool";
> > +			reg =3D <0x40000000 0x01000000>;
> > +			no-map;
> > +		};
> > +
> > +		gp1_reserved: rproc@41000000 {
> > +			compatible =3D "shared-dma-pool";
> > +			reg =3D <0x41000000 0x01000000>;
> > +			no-map;
> > +		};
> > +
> > +		audio_reserved: rproc@42000000 {
> > +			compatible =3D "shared-dma-pool";
> > +			reg =3D <0x42000000 0x01000000>;
> > +			no-map;
> > +		};
> > +
> > +		dmu_reserved: rproc@43000000 {
> > +			compatible =3D "shared-dma-pool";
> > +			reg =3D <0x43000000 0x01000000>;
> > +			no-map;
> > +		};
>=20
> I don't believe these reserved memory ranges are correct for audio_re=
served and dmu_reserved.
>=20
> For example my vid_firmware-stih407.elf is linked at 0x41c00000 base =
address and my
> audio_firmware-bd-stih407.elf is linked at 0x40c00000.
>=20
> So with all the st231 rproc nodes enabled I guess it would still work=
=2E But
> currently I think st231_gp0 is reserving the memory region for st231_=
audio,
> and st231-gp1 is reserving the memory region for st231_dmu.

These addresses are taken from internally tested code.  I don't have
access to the LMI layout documentation (if it even exists) so can't
check for myself.  Isn't this just DDR anyway?  So in theory we can
configure each devices' slice where ever we feel is appropriate?  How
is memory allocated to the DMU and Audio drivers?  Do you have scripts
which link the aforementioned binaries?

If you think there is an issue, I suggest the best thing to do is ping
Ludovic, since he is the author of the original code.

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
