From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Re: [PATCH 3/3] arm64: allwinner: dts: h6: add
 Wi-Fi support for Pine H64 model A/B
Date: Tue, 24 Jul 2018 16:41:51 +0200
Message-ID: <20180724144151.myyg7slocsfjjsfi@flea>
References: <20180724011551.49603-1-icenowy@aosc.io>
 <20180724011551.49603-4-icenowy@aosc.io>
 <CAGb2v67zR-Q9n7L6CaFKDUJFHFEC_h8-RYxkdyeyJb_GbNmkJw@mail.gmail.com>
 <CEA43CB7-1DA6-4983-BF18-82C4A48FB92B@aosc.io>
 <CAGb2v64Qae4O430kP30DQNhp0Dt774OHt0nMe35ckp8X=CTFLg@mail.gmail.com>
 <AC678B03-19B7-4110-B333-72188CE71296@aosc.io>
 <CAGb2v656oPmAX=_y88b05xqrona3HFtU-VmNQhHxK_n-4gD+aw@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fhazolum5rz6spmk"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBOXV3TNAKGQEKT622KA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v656oPmAX=_y88b05xqrona3HFtU-VmNQhHxK_n-4gD+aw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--fhazolum5rz6spmk
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 24, 2018 at 10:37:51AM +0800, Chen-Yu Tsai wrote:
> On Tue, Jul 24, 2018 at 10:28 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> >
> >
> > =E4=BA=8E 2018=E5=B9=B47=E6=9C=8824=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=
=8810:26:02, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> =E5=86=99=E5=88=B0:
> >>On Tue, Jul 24, 2018 at 10:23 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> >>wrote:
> >>>
> >>>
> >>> =E4=BA=8E 2018=E5=B9=B47=E6=9C=8824=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=
=8D=8810:21:59, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> =E5=86=99=E5=88=B0:
> >>>>On Tue, Jul 24, 2018 at 9:15 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> >>wrote:
> >>>>> The Pine H64 model A has a Wi-Fi module connector and the model B
> >>has
> >>>>an
> >>>>> on-board RTL8723BS Wi-Fi module.
> >>>>>
> >>>>> Add support for them. For model A, as it's not defaultly present,
> >>>>keep
> >>>>> it disabled now.
> >>>>
> >>>>Nope. Pine64 actually has two WiFi/BT modules. And they require
> >>>>different
> >>>>device tree snippets for both the WiFi and BT side. This is better
> >>>>resolved
> >>>>with device tree overlays.
> >>>>
> >>>>I have both, though I've yet found time to work on them.
> >>>
> >>> I have also both.
> >>>
> >>> The skeleton here can get the Wi-Fi of both to work.
> >>
> >>Cool. Then I can put away my RTL module for now. :)
> >
> > P.S. SDIO is auto detectable, and for BCM chips, the OOB interrupt
> > is only a bonus function and it can fall back to standard in-band
> > interrupt (which doesn't need special binding, and is currently
> > used by mainline r8723bs driver.)
>=20
> Correct. With BT you'll have serdev device nodes with different
> compatibles. Then you'll have to resort to overlays, and you'd probably
> end up adding WiFi OOB interrupt bits as well.
>=20
> So the question remaining is: should we enable the MMC part, along
> with power sequencing and regulator supplies, by default? Thinking
> more about it, I'm actually OK with it. The board connectors are
> clearly marked as being for a WiFi+BT module. The whole space on
> the board is surrounded by a box in silkscreen. Sorry for the
> initial nack.
>=20
> Maxime, any thoughts?

If there's a need for an overlay anyway, there's no real reason to
enable it by default, especially if not everything is there.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--fhazolum5rz6spmk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAltXOq4ACgkQ0rTAlCFN
r3SIrg//XVODv2+vLg3T9F4oCqaEy9wgJHKNryVNxe9yQ/EkIL5GjZkPvRsvaTz5
AvW+PtUP03WcxjarG3B9183vTgeWczvXdaKJE6yabbZ5O/byYKAnD3DynvDNwm3G
1Le/NlM8ugTz7fRJ1pF0ermWtm/MkRD6Bg1+Uqhe6GaITAjkgMLw5WeDQ3x2S1VS
DXk/KuO4CnJWXmMOil6/befh4xml0QeKiIpGdWyCtUBSPqlHONKNWJVxpB858Wk7
Rh0r8bw7F6lnOA0QYkjANJKfWgerw3+WtmbPxssXQpooD33fT2hlUIII+OjL0l1e
uAO0yUL8GtM8qxgrgZnkfLCuvcImbse4tvhAvqf/J2GjjLYCMcpfbwntyv9Qbkhn
vIJcV8DtOa7zQAK6Z2i3xiUYWjJD8UZNOQ3ImLr/StmCYL6D3g4Ys37L6Gex2mhY
tsGC+/YjM3oiENlYF1bVXNFUEy4j6JVQxWrIuMGIgoVSjXRknbKm1554OjwqvALy
BgfFbpJsqORqq1PyW2uKTUPY6gaBUaEwb785WOcJuE88r9uR6KFWT8JrZi9pp4H0
eLJocGgZKZGQRUfxRylNBvHKPGNo+GVdSH7cxgzQS/mGoj1+q5gSV/W+MEJIq9lm
gtckHs0j1LXXsQR2/KH/s312EIWSVfni9pXzxuL4NpUexLdh4dw=
=ytpg
-----END PGP SIGNATURE-----

--fhazolum5rz6spmk--
