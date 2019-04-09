From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 01/12] arm64: dts: allwinner: h6: Add Orange
 Pi 3 DTS
Date: Tue, 9 Apr 2019 09:22:37 +0200
Message-ID: <20190409072237.fn2pe7ugtukdlnm2@flea>
References: <20190405234514.6183-1-megous@megous.com>
 <20190405234514.6183-2-megous@megous.com>
 <20190408074628.e5ers4gzlqz4coyk@flea>
 <20190408225851.svelyf7h3fiw4wjw@core.my.home>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vazlaal22ii7l2e2"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBRMQWHSQKGQE6C3NFPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190408225851.svelyf7h3fiw4wjw-9v8tmBix7cb9zxVx7UNMDg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Franky Lin <franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hante Meuleman <hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Wright Feng <wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Naveen Gupta <naveen.gupta-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev@v
List-Id: devicetree@vger.kernel.org


--vazlaal22ii7l2e2
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 09, 2019 at 12:58:51AM +0200, Ond=C5=99ej Jirman wrote:
> > > +&usb2otg {
> > > +	dr_mode =3D "host";
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&usb2phy {
> > > +	usb0_id_det-gpios =3D <&pio 2 15 GPIO_ACTIVE_HIGH>; /* PC15 */
> > > +	usb0_vbus-supply =3D <&reg_vcc5v>;
> > > +	usb3_vbus-supply =3D <&reg_vcc5v>;
> > > +	status =3D "okay";
> >
> > If we have an ID pin, then why is the OTG controller set to host?
>
> This board has fixed conenction between VBUS and DCIN, so if it is powere=
d
> from DCIN and someone will try to connect it to the PC as a peripheral,
> they'll get PC's VBUS shorted to the power supply connected to DCIN.
>
> Depending on voltage difference between DCIN and PC's VBUS, you can get
> overcurrent condidion and PC's port shutdown.
>
> The board is not entirely foolproof in this regard.
>
> - It can be host powered when connected via microUSB
> - It can be self-powered and host an device on microUSB
> - It can be self-powered and serve as a peripheral if you modify
>   a cable (cut VBUS) or the host is expecting this and has some
>   VBUS detection logic (most hosts will not have this)
>
> I just didn't want to encourage use as a peripheral, because it's not
> very foolproof. But I guess, DTS file will not stop anyone anyway.
>
> I'll change it to otg, and maybe leave a small note.

Your solution was great actually. I guess making a comment explaining
what you just did would be better though, so that no one is confused.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--vazlaal22ii7l2e2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKxIPQAKCRDj7w1vZxhR
xQcXAQDol3REexlF7y84fFUCcIEyEMiedbnGpFQLj6gLdmA1LQD6AnjKbKwNsJqo
Is/r3wfDkq5t5cMb3FvH7ld60Tv3rA0=
=d1oR
-----END PGP SIGNATURE-----

--vazlaal22ii7l2e2--
