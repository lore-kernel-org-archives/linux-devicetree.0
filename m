From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: How to select between different display timings? (was: [PATCH
 7/8] ARM: dts: tx28: restructure and update DTS file)
Date: Fri, 14 Feb 2014 15:02:08 +0100
Message-ID: <20140214150208.12417b11@ipc1.ka-ro>
References: <1375966287-6784-1-git-send-email-LW@KARO-electronics.de>
	<1375966287-6784-8-git-send-email-LW@KARO-electronics.de>
	<52FE1F2D.4010102@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52FE1F2D.4010102-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Dirk Behme wrote:
> Hi Lothar and Shawn,
>=20
> On 08.08.2013 14:51, Lothar Wa=C3=9Fmann wrote:
> > - add Copyright header
> > - use label references for better readability
> > - sort the entries alphabetically
> > - add some aliases used by U-Boot to edit the DT data
> >
> > Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> > ---
> >   arch/arm/boot/dts/imx28-tx28.dts |  693 +++++++++++++++++++++++++=
++++++++-----
> >   1 files changed, 611 insertions(+), 82 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/imx28-tx28.dts b/arch/arm/boot/dts/i=
mx28-tx28.dts
> > index 37be532..866af60 100644
> > --- a/arch/arm/boot/dts/imx28-tx28.dts
> > +++ b/arch/arm/boot/dts/imx28-tx28.dts
> ...
> > +&lcdif {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&lcdif_24bit_pins_a &lcdif_sync_pins_a &lcdi=
f_ctrl_pins_a>;
> > +       lcd-supply =3D <&reg_lcd>;
> > +       display =3D <&display>;
> > +       status =3D "okay";
> > +
> > +       display: display@0 {
> > +               bits-per-pixel =3D <32>;
> > +               bus-width =3D <24>;
> > +
> > +               display-timings {
> > +                       native-mode =3D <&timing5>;
                            ^^^^^^^^^^^^^^^^^^^^^^^^^
> > +                       timing0: timing0 {
[...]
> > +                       };
> > +               };
> > +       };
> > +};
>=20
> Being no graphics expert, looking at above device tree change, I'd li=
ke=20
> to understand how this can be used to switch between different displa=
y=20
> timings?
>=20
> In the kernel, I've found the code which selects the default/native-m=
ode=20
> (of_display_timing.c). But, as here, if there is a native/default mod=
e,=20
> there are alternative modes. I haven't understood how and who to sele=
ct=20
> these other modes? In this case, how could the alternative modes=20
> timing0/1/2/3/4 be selected in the kernel?
>=20
> Do you have any pointers regarding this?
>=20
You need to set the property 'native-mode' to the phandle of the
display-timings entry like marked above.


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org
___________________________________________________________
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
