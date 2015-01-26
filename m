From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3] ARM: zynq: DT: Add USB to device tree
Date: Mon, 26 Jan 2015 07:50:22 -0800
Message-ID: <c65880cef67945ebaf61306febc1349b@BN1BFFO11FD010.protection.gbl>
References: <1417536431-27759-1-git-send-email-soren.brinkmann@xilinx.com>
 <d78fedd84f354d80985187f851cb3cd1@BN1AFFO11FD055.protection.gbl>
 <54C5F89A.3090901@suse.de> <54C5F965.90100@monstr.eu>
 <54C5FBC3.7030903@suse.de> <54C60A56.7010403@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54C60A56.7010403-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ola Jeppson <ola-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2015-01-26 at 10:35AM +0100, Andreas F=C3=A4rber wrote:
> Am 26.01.2015 um 09:33 schrieb Andreas F=C3=A4rber:
> > Am 26.01.2015 um 09:23 schrieb Michal Simek:
> >> On 01/26/2015 09:19 AM, Andreas F=C3=A4rber wrote:
> >>> And if I apply it to my -next based tree, adding corresponding no=
des to
> >>> zynq-parallella.dts, I get repeatedly:
> >>>
> >>> [  +0,012242] ci_hdrc ci_hdrc.0: no of_node; not parsing pinctrl =
DT
> >>> [  +0,000157] ci_hdrc ci_hdrc.0: ChipIdea HDRC found, lpm: 0; cap=
:
> >>> f090e100 op: f090e140
> >>> [  +0,000081] platform ci_hdrc.0: Driver ci_hdrc requests probe d=
eferral
> >>> [  +0,005360] ci_hdrc ci_hdrc.1: no of_node; not parsing pinctrl =
DT
> >>> [  +0,000120] ci_hdrc ci_hdrc.1: ChipIdea HDRC found, lpm: 0; cap=
:
> >>> f0910100 op: f0910140
> >>> [  +0,001810] platform ci_hdrc.1: Driver ci_hdrc requests probe d=
eferral
> >>>
> >>> Am I missing any other patches or config options?
> >>> (I do notice that the pinctrl v3 patch that got merged has a triv=
ial bug
> >>> for usb0, for which I'll send a patch later on.)
> >>
> >> Why is it deferred? Is it because of pinmuxing stuff?
> >=20
> > No, happened without as well.
> >=20
> > Looking at a different place in dmesg, I spot this:
> >=20
> > [  +0,003988] usb_phy_generic phy0: GPIO lookup for consumer reset-=
gpios
> > [  +0,000012] usb_phy_generic phy0: using device tree for GPIO look=
up
> > [  +0,000015] of_get_named_gpiod_flags: can't parse 'reset-gpios-gp=
ios'
> > property
> >  of node '/phy0[0]'
> > [  +0,000013] of_get_named_gpiod_flags: can't parse 'reset-gpios-gp=
io'
> > property
> > of node '/phy0[0]'
> > [  +0,000010] usb_phy_generic phy0: using lookup tables for GPIO lo=
okup
> > [  +0,000153] usb_phy_generic phy0: lookup for GPIO reset-gpios fai=
led
> > [  +0,000012] usb_phy_generic phy0: Error requesting RESET GPIO
> > [  +0,004360] usb_phy_generic: probe of phy0 failed with error -2
> > [  +0,004991] usb_phy_generic phy1: GPIO lookup for consumer reset-=
gpios
> > [  +0,000012] usb_phy_generic phy1: using device tree for GPIO look=
up
> > [  +0,000013] of_get_named_gpiod_flags: can't parse 'reset-gpios-gp=
ios'
> > property
> >  of node '/phy1[0]'
> > [  +0,000013] of_get_named_gpiod_flags: can't parse 'reset-gpios-gp=
io'
> > property of node '/phy1[0]'
> > [  +0,000010] usb_phy_generic phy1: using lookup tables for GPIO lo=
okup
> > [  +0,000012] usb_phy_generic phy1: lookup for GPIO reset-gpios fai=
led
> > [  +0,000011] usb_phy_generic phy1: Error requesting RESET GPIO
> > [  +0,004337] usb_phy_generic: probe of phy1 failed with error -2
> >=20
> > So, I guess the chipidea driver is deferring because the phys want =
a
> > property that neither me nor you are specifying? Would that be the =
two
> > MDIO pins 52 and 53 that would need to be specified?
>=20
> Erm, scratch that last question - wrong PHY. Trying it resolved the
> above phy errors but not the original problem. And so does an empty o=
ne:
>=20
> @@ -99,11 +100,13 @@
>=20
>         usb_phy0: phy0 {
>                 compatible =3D "usb-nop-xceiv";
> +               reset-gpios =3D <>;
>                 #phy-cells =3D <0>;
>         };
>=20
>         usb_phy1: phy1 {
>                 compatible =3D "usb-nop-xceiv";
> +               reset-gpios =3D <>;
>                 #phy-cells =3D <0>;
>         };
>  };
>=20
> In my manuals and notes I can't find any GPIO being used as reset for
> the USB PHYs. Any thoughts appreciated.

Such a connection is optional. The platform might rely on its reset
circuit, though it might not work for warm reboots.
I haven't looked at parallela docs, but if there is a schematic
available, that should tell you if/what is connected to the PHY reset
pin.

	Soren
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
