From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH 9/10] ARM: dts: tx28: restructure and update DTS file
Date: Thu, 17 Apr 2014 09:35:34 +0200
Message-ID: <20140417093534.5a513b05@ipc1.ka-ro>
References: <1375281480-25775-1-git-send-email-LW@KARO-electronics.de>
	<1375281480-25775-9-git-send-email-LW@KARO-electronics.de>
	<534F7710.8050801@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <534F7710.8050801-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Dirk Behme wrote:
> On 31.07.2013 16:37, Lothar Wa=C3=9Fmann wrote:
> >
> > Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> > ---
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
> > +                       timing0: timing0 {
> > +                               panel-name =3D "VGA";
> ...
>=20
> I've been looking for any user or documentation of 'panel-name'. But=20
> couldn't find anything. Anything I missed?
>=20
Our U-Boot uses this to find the active video setting according to an
environment variable setting.


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
