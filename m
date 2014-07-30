From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: Turn on USB host vbus on rk3288-evb
Date: Wed, 30 Jul 2014 20:24:03 +0200
Message-ID: <2935278.D1LmZlOTqj@diego>
References: <1406676273-20701-1-git-send-email-dianders@chromium.org> <1836225.xQCoI7eRWl@diego> <CAD=FV=Wm-cB3-xHQdOUAXyX2xeYrXxPN6wYZrAoC6WAQ9sQ_Bg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=Wm-cB3-xHQdOUAXyX2xeYrXxPN6wYZrAoC6WAQ9sQ_Bg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Doug,

Am Mittwoch, 30. Juli 2014, 08:13:52 schrieb Doug Anderson:
> On Wed, Jul 30, 2014 at 4:24 AM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wr=
ote:
> > Am Dienstag, 29. Juli 2014, 16:24:31 schrieb Doug Anderson:
> >> There is no phy driver that works on the Rockchip board for either=
 USB
> >> host port yet.  For now just hardcode the vbus signal to be on all=
 the
> >> time which makes both the dwc2 host and the EHCI port work.
> >>=20
> >> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> ---
> >>=20
> >>  arch/arm/boot/dts/rk3288-evb.dtsi | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)
> >>=20
> >> diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi
> >> b/arch/arm/boot/dts/rk3288-evb.dtsi index 749e20d..efd625e 100644
> >> --- a/arch/arm/boot/dts/rk3288-evb.dtsi
> >> +++ b/arch/arm/boot/dts/rk3288-evb.dtsi
> >> @@ -35,6 +35,18 @@
> >>=20
> >>                       debounce-interval =3D <100>;
> >>              =20
> >>               };
> >>      =20
> >>       };
> >>=20
> >> +
> >> +     /* This turns on vbus for both host0 (ehci) and host1 (dwc2)=
 */
> >> +     usb_host_vbus_regulator: usb-host-vbus-regulator {
> >> +             compatible =3D "regulator-fixed";
> >> +             enable-active-high;
> >> +             gpio =3D <&gpio0 14 GPIO_ACTIVE_HIGH>;
> >> +             pinctrl-names =3D "default";
> >> +             pinctrl-0 =3D <&usb_host_vbus>;
> >> +             regulator-name =3D "usb-host-vbus";
> >> +             regulator-always-on;
> >> +             regulator-boot-on;
> >> +     };
> >>=20
> >>  };
> >=20
> > It seems I have a slightly outdated schematics pdf for the evb ... =
and
> > only
> > see the OTG vbus pin, on <&gpio0 12>, but am missing the whole host=
 vbus.
>=20
> I have schematics that claim to be from January 25, 2014 and claim to
> be rev 1.0.  On my schematics:
>=20
> * GPIO0_B4 (12) =3D OTG_VBUS_DRV =3D pin 233 of the mainboard connect=
or
> * GPIO0_B6 (14) =3D HOST_VBUS_DRV =3D pin 239 of the mainboard connec=
tor
>=20
> On the mainboard schematics I have the OTG signal (233) doesn't
> actually go to the OTG port.  It goes to a debug header and nowhere
> else.  The HOST VBUS controls VBUS on both of the two "host" ports.
>=20
> > Could you think about finding another name for the handle? For exam=
ple, in
> > my incomplete evb-schematics the supply coming from the otg regulat=
or is
> > called vcc50_usb and there should be something similar for the host
> > supply, so I'd like something like
> >=20
> >         vcc50_usbhost: usb-host-vbus-regulator { /* or whatever it =
gets
> >         called */
> >         ...
> >         };
> >=20
> > simply to keep with the supply names defined in the schematics - ma=
kes
> > reading easier.
>=20
> I did!  ;)  ...but I matched my schematics, not yours.  Can you
> provide the date / version number from your schematics and we can see
> which is newer?  Just for reference I was emailed schematics last wee=
k
> but that doesn't necessarily guarantee that they're the newest ones.

the schematics I have is "RK3288_BETA", REV 0.2, created in 2014/02/12,=
 last=20
changed on 2014/03/04.

At least in my schematics on page 16 of 44, the OTG_VBUS_DRV pin leads =
to a=20
switch, that gets supplied by VCC50_BOOST and emits the VCC50_USB .
So, a later phy node should in the otg case probably have a
	whatever-supply =3D <&vcc50_usb>;
and not
	whatever-supply =3D <&usb_otg_vbus_regulator>


And there I'd guess the host supply will probably be structured similar=
ly -=20
even if I can't see it right now :-) .


> Given the above, I'm not planning to spin this patch unless you
> confirm you want me to.  Thanks!  :)

I'd like the regulator handle to be named after the supply name, not af=
ter the=20
pin-name :-) .


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
