From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [STLinux Kernel] [PATCH v2 1/4] ARM: STiH407: Add nodes for
 RemoteProc
Date: Tue, 1 Sep 2015 10:11:37 +0100
Message-ID: <20150901091137.GN4796@x1>
References: <1440757911-9120-1-git-send-email-lee.jones@linaro.org>
 <1440757911-9120-2-git-send-email-lee.jones@linaro.org>
 <20150901082812.GB30542@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150901082812.GB30542@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 01 Sep 2015, Peter Griffin wrote:
> On Fri, 28 Aug 2015, Lee Jones wrote:
>=20
> > Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/stih407-family.dtsi | 48 +++++++++++++++++++++++=
++++++++++++
> >  1 file changed, 48 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/=
dts/stih407-family.dtsi
> > index 33daa49..89a363c 100644
> > --- a/arch/arm/boot/dts/stih407-family.dtsi
> > +++ b/arch/arm/boot/dts/stih407-family.dtsi
> > @@ -608,5 +608,53 @@
> >  			status		=3D "okay";
> >  			tx-only;
> >  		};
> > +
> > +		st231_gp0: st231-gp0@0 {
> > +			compatible =3D "st,st231-rproc";
> > +			reg =3D <0x40000000 0x01000000>;
> > +			reg-names =3D "carveout";
> > +			resets =3D <&softreset STIH407_ST231_GP0_SOFTRESET>;
>=20
> Support for these co-processor reset lines does not exist upstream. S=
o
> this series as it stands won't compile.

That's true.  I have the support as part of some DEBUG patches I have
in my branch.  Are you aware of a plan for these, or should I upstream
them myself as part of this set?

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
