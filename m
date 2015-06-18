From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 6/6] ARM: sun8i: dts: Add Ippo-q8h v1.2
 with A33 and 1024x600 lcd support
Date: Thu, 18 Jun 2015 19:52:16 +0200
Message-ID: <20150618175216.GS11732@lukather>
References: <1432997706-20172-1-git-send-email-hdegoede@redhat.com>
 <1432997706-20172-7-git-send-email-hdegoede@redhat.com>
 <20150602081459.GO23777@lukather>
 <556D6955.8030708@redhat.com>
 <20150603094535.GI23777@lukather>
 <556EE104.3090803@redhat.com>
 <20150613135002.GP19653@lukather>
 <85E62D2D-5387-433B-A944-7F2145459F08@konsulko.com>
 <20150616175512.GJ11732@lukather>
 <55811ED9.9090503@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OlucDFihBVSxvK/7"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB5ULRSWAKGQEXGLL5OY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55811ED9.9090503-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--OlucDFihBVSxvK/7
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2015 at 09:16:41AM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 16-06-15 19:55, Maxime Ripard wrote:
> >Hi Pantelis,
> >
> >On Sun, Jun 14, 2015 at 09:16:21PM +0300, Pantelis Antoniou wrote:
> >>>I think we need to discuss this with Pantelis and what is his feeling
> >>>about this.
> >>>
> >>>Pantelis, to sum things up, we have a case of a tablet that comes with
> >>>the exact same board, but coming in two flavours with two differents
> >>>screen resolutions. It looks like a great case for your DT quirks
> >>>work, but we have no way of runtime detecting the difference between
> >>>the two variants. What do you think about this? Should we go with
> >>>using the DT quirks or is this simply out of scope?
> >>>
> >>>There's not so much example of similar cases in the kernel, and none
> >>>of them use quirks so far (obviously) but they all boil down to either
> >>>the solution you were suggesting in that patch or adding the alternate
> >>>configuration as a comment.
> >>>
> >>>I don't think the latter would work for you, and I agree with that, so
> >>>I guess that depending on what Pantelis says, either we go with a
> >>>better solution using the quirks, or we end up using what you
> >>>suggested (with a nitpick though, I'd prefer if you used the display
> >>>standard instead of the resolution, which would make it xga I guess?)
> >>>
> >>
> >>First of all, the quirks interface is at an RFC stage (new name
> >>suggested is =E2=80=98variants=E2=80=99); getting that out of the way t=
his seems
> >>like what it is designed to do.
> >>
> >>The idea of the DT quirks is to drastically cut down on the number
> >>of different DTs required, each different for each board with minute
> >>differences from one another.
> >
> >We're on the same page then :)
> >
> >>In your case you have boards that have no way to be probed about
> >>what they =E2=80=98are=E2=80=99, but that=E2=80=99s no big problem. You=
 can easily pass the
> >>board variant in the kernel command line and use that to select the
> >>quirk to apply.
> >
> >Hans actually pointed out that this would just move the logic
> >somewhere else, but not remove it. In our case, that would mean U-Boot
> >(Hans being the U-Boot maintainer for the SoCs that are used in this
> >particular board).
> >
> >That would still require us to have a different configuration and to
> >add some logic to pass that extra parameter to the kernel. I'd be glad
> >to have less stuff in the kernel, but I can understand that he doesn't
> >want more stuff either.
> >
> >>In fact the original patchset does contain a command line quirk for
> >>enabling and disabling the onboard emmc & hdmi of the beaglebone
> >>black for capes that need to use those signals.
> >
> >Ah. I somehow overlooked that when reading it.
> >
> >>Saying that, if you=E2=80=99re in a hurry I=E2=80=99d say go with a dif=
ferent DTSs
> >>for now, since that=E2=80=99s going to go in a near kernel cycle; DT qu=
irks
> >>will be discussed at plumber=E2=80=99s in a couple of months, and then =
we=E2=80=99ll
> >>if it will go in and in what form.
> >
> >Ok. I won't be here this year, but if you could raise the topic of how
> >to handle "non-discoverable boards" then, it would be great.
> >
> >Hans, I guess we can go for your suggestion then: apply a "generic" DT
> >for the board right now, we're going to need it anyway. Then, when
> >will have real display support, depending on the current state of the
> >discussion for the quirks, we will either merge a different DT
> >including the generic one, or if the quirks have something that work
> >for both of us then, use the quirks. Sounds good?
>=20
> Sounds good to me, will you make the changes while merging, or shall
> I do a new version of the patch ?

I'll apply and fix.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--OlucDFihBVSxvK/7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVgwVQAAoJEBx+YmzsjxAgImQQAJHYPXtIk8k+HcK2OylKBsPK
aX/W2tTXc7MG74yOpI/9jkzfELqM4/b59UG3bgwI2DyDo5J8A73ZJ27g5UUFrt7t
Jcy0KRKuR+W88T1OssBykpNPeRtGM5b+Zy30s+Ua0fP0rNsKn5yLRfz02sR7o1iR
La1z608KZZggMjyf66UdQeavlDOqnbrLgZ1kfaOynFQRahkjQbmzT/36kyWYKZr2
7pFQjvr8/pacEbpEWhw+/3MzdtXU+PLFKRpNatC8ZhH+KBDtCeo8UYn8IR41oupv
YFeYiwBVig7nMgoa8KEoLxzdYsgz3LZJREIrJ/moVxp7LjhMqbcuG7+4nZjTyVlR
1yjVIBPt7KrlyrT1l3RYv/eQjNKEkAyuSJh9AyP0hASThNMnX1MSuFDm2ibxt2f5
Wb8vi2PQ0GTUP/apUDnAa+HxiI1zAZM53fa16UX2CJuhfivVPFmEeXl1kJMn8Uqz
/TmNDeBdqWPoqHNjuxIhsls0qyin+j9FEM2JpkZv5gdbzCNiADZUzmILLR5lC+ax
mPY8D1vA7pLG0mpSOxGUGKv2SZcWGE5HLIN9yU9l0AoX35j+Zg48Qs+u4MOWW3DM
JE7Dh5ioAcPX+d9/UnZNXv8c1mokGxtpkBo6Z3N7aT2In5eCHNki5oVqZTFfyX1j
5oxAKQYDGyFzv/B09k6o
=mxVA
-----END PGP SIGNATURE-----

--OlucDFihBVSxvK/7--
