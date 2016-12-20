From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: sun8i-q8-common: enable bluetooth on SDIO Wi-Fi
Date: Tue, 20 Dec 2016 14:50:11 +0100
Message-ID: <20161220135011.2rk7v6tjujhivcy6@lukather>
References: <20161213233658.atGuNCNY@smtp1h.mail.yandex.net>
 <20161216124748.rkvnnlo4x5onzpvk@lukather>
 <4720181481899200@web7g.yandex.ru>
 <20161219100952.bspym36nsehda3za@lukather>
 <11985541482156512@web2g.yandex.ru>
 <CAGb2v67wU+Hw-6oa9FxzB33sZY8Up-59HZ_mneFBdcRhXbU1pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9222354197327695686=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGb2v67wU+Hw-6oa9FxzB33sZY8Up-59HZ_mneFBdcRhXbU1pA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Hans de Goede <hdegoede@redhat.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Icenowy Zheng <icenowy@aosc.xyz>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--===============9222354197327695686==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v36fa2dt3b67j6jc"
Content-Disposition: inline


--v36fa2dt3b67j6jc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2016 at 10:24:44PM +0800, Chen-Yu Tsai wrote:
> On Mon, Dec 19, 2016 at 10:08 PM, Icenowy Zheng <icenowy@aosc.xyz> wrote:
> >
> >
> > 19.12.2016, 18:09, "Maxime Ripard" <maxime.ripard@free-electrons.com>:
> >> On Fri, Dec 16, 2016 at 10:40:00PM +0800, Icenowy Zheng wrote:
> >>>  >>  > >  &r_pio {
> >>>  >>  > >  wifi_pwrseq_pin_q8: wifi_pwrseq_pin@0 {
> >>>  >>  > > - pins =3D "PL6", "PL7", "PL11";
> >>>  >>  > > + pins =3D "PL6", "PL7", "PL8", "PL11";
> >>>  >>  > >  function =3D "gpio_in";
> >>>  >>  > >  bias-pull-up;
> >>>  >>  > >  };
> >>>  >>  >
> >>>  >>  > There's several things wrong here. The first one is that you r=
ely
> >>>  >>  > solely on the pinctrl state to maintain a reset line. This is =
very
> >>>  >>  > fragile (especially since the GPIO pinctrl state are likely to=
 go away
> >>>  >>  > at some point), but it also means that if your driver wants to=
 recover
> >>>  >>  > from that situation at some point, it won't work.
> >>>  >>  >
> >>>  >>  > The other one is that the bluetooth and wifi chips are two dev=
ices in
> >>>  >>  > linux, and you assign that pin to the wrong device (wifi).
> >>>  >>  >
> >>>  >>  > rfkill-gpio is made just for that, so please use it.
> >>>  >>
> >>>  >>  The GPIO is not for the radio, but for the full Bluetooth part.
> >>>  >
> >>>  > I know.
> >>>  >
> >>>  >>  If it's set to 0, then the bluetooth part will reset, and the
> >>>  >>  hciattach will fail.
> >>>  >
> >>>  > Both rfkill-gpio and rfkill-regulator will shutdown when called
> >>>  > (either by poking the reset pin or shutting down the regulator), so
> >>>  > that definitely seems like an expected behavior to put the device =
in
> >>>  > reset.
> >>>  >
> >>>  >>  The BSP uses this as a rfkill, and the result is that the blueto=
oth
> >>>  >>  on/off switch do not work properly.
> >>>  >
> >>>  > Then rfkill needs fixing, but working around it by hoping that the
> >>>  > core will probe an entirely different device, and enforcing a defa=
ult
> >>>  > that the rest of the kernel might or might not change is both frag=
ile
> >>>  > and wrong.
> >>>
> >>>  I think a rfkill-gpio here works just like the BSP rfkill...
> >>>
> >>>  The real problem is that the Realtek UART bluetooth driver is a user=
space
> >>>  program (a modified hciattach), which is not capable of the GPIO res=
et...
> >>
> >> Can't you run rfkill before attaching? What is the problem exactly?
> >> It's not in reset for long enough?
> >>
> >> This seems more and more like an issue in the BT stack you're
> >> using. We might consider workarounds in the kernel, but they have to
> >> be correct.
> >
> > One more rfkill interface will be generated for hci0 after hciattach, w=
hich can
> > be safely toggled block and unblock.
> >
> > However, if the GPIO is toggled down, the hciattach program will die.
> >
> > The bluetooth stack I used is fd.o's BlueZ.
>=20
> I think the bigger issue is that the tty/serial subsystem does not have
> power sequencing support. Here we're trying to use rfkill to do that,
> but that doesn't seem to be what it was intended for. It might work with
> standalone USB bluetooth controllers that don't need any special setup,
> since the device will just appear and get registered. But it might not
> work so well with UART based adapters that need userspace fiddling with
> firmware and hciattach.

Then you can also have a look at the generic power sequence patches
that are floating around.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--v36fa2dt3b67j6jc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYWTcTAAoJEBx+YmzsjxAgMqIP/2OWXIch9qzVX90jPtRBIP1M
wFGyUu/ZaYis5g55bAJNwwqFg8oeiZgbf0fpRAimOq8F9eeVfWNq0IywjudOlhGl
J0n35jR/GjHH8g9R9zkYDC3nnIjDgIhm813BFuTuJa6rrPTeT3mw68kClq1CwUz6
pY3acmP8cql1xPrGZ9d45eBYxAyE3DBQQSucOqF2GCyAxYCwAaZwlv+H6WHzGsEQ
uC0J1N4tjdnd9dFKv0yqtnuzpQAbcpILYHSTCUE8twXXnFLo6/TcpTutJld3LHMU
1o27o+Lvve6VhtxNPLImIA2yTdWI3eiS5Dr6Oicb8OXCjHUt0Eo+H9CC83mNuKMy
6W2bczUXdyqrRCbU9sgp6kei+/VTi25Tgdnqxm0pGj5h53ep3DpoZADUtIsLJsGF
+kUinhaTM2ZjlUqEap2czORDD39k/vu/gl9dFBlqgZUXECwoDXPScE7T6Cjxzy6I
hpVoZMXmCAAMN88WcWo/zT0GRdfXCKD28SjV/Rj782wu2h0//0Zj9c2nttIyZtJ8
wMqz4KeNqPwLD+wBUpJpIQ1d2pyZTNxIa3HKlUz2CjcKa0iEebAb5hR6OpPMAFnJ
GvNJl9/H++AcQOq7mw0aatWFpN7EDtSh7Vwk5ekJDj0oPZH3dFGSNdf6B1CKMrYB
6zA9Bs6nXaon6b/K7ENg
=TuFA
-----END PGP SIGNATURE-----

--v36fa2dt3b67j6jc--


--===============9222354197327695686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============9222354197327695686==--
