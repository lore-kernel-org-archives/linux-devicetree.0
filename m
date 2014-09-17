From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] dmaengine: sun6i: Add support for
 Allwinner A23 (sun8i) variant
Date: Wed, 17 Sep 2014 17:55:40 +0200
Message-ID: <20140917155540.GJ2166@lukather>
References: <1410616381-30226-1-git-send-email-wens@csie.org>
 <1410616381-30226-3-git-send-email-wens@csie.org>
 <20140916103540.GF9948@lukather>
 <CAGb2v67jokpXHxR26YoCEB2Y_v07oQZXZfPuGJC_wO=r-SRZhg@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Tu8ztk+XgTAiG9Id"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBA7A42QAKGQE22TRGRA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67jokpXHxR26YoCEB2Y_v07oQZXZfPuGJC_wO=r-SRZhg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Tu8ztk+XgTAiG9Id
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2014 at 10:13:27PM +0800, Chen-Yu Tsai wrote:
> >> +     /*
> >> +      * sun8i variant requires us to toggle an undocumented register,
> >> +      * as seen in Allwinner's SDK.
> >
> > The BSP I have has this:
> >
> > static void sunxi_dma_hw_init(struct sunxi_dmadev *dev)
> > {
> >         struct sunxi_dmadev *sunxi_dev =3D dev;
> >
> >         clk_prepare_enable(sunxi_dev->ahb_clk);
> > #ifdef CONFIG_ARCH_SUN8IW3
> >         writel(0x04, sunxi_dev->base + DMA_GATE);
> > #endif
> > }
> >
> > /* All is ok, and open the clock */
> > sunxi_dma_hw_init(sunxi_dev);
> >
> > So I guess we can say that it's not that undocumented :)
>=20
> That's right. I meant undocumented in the user manual.
> I did reference the SDK in the comment, didn't I? :)

So something like

writel(DMA_GATE_ENABLE, base->DMA_GATE_REG) wouldn't be too far off :)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Tu8ztk+XgTAiG9Id
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUGa78AAoJEBx+YmzsjxAgAYoP/iT+1ghRVNp19AojA8I6dkW9
eiDmStZe056B22M7Vw8wnbQFv5Khz44ZoKt25AakUDhpB0WWkWRhRwJ+8oQTmjSF
oq5B7JqP4Z8hBdEy3oxQQtWOEtVEUEUbdcmiBV5ENve2/6RkH3WCQYaGEFVgJY63
GMnHRrEwNM6tt/Ju4xqDN7SPra0fBOiCfMcF46Q9MwuVhM2tCF2sKYxwHCPC+Mur
s3MM9evDnVRUDR2HT9FIUkB1Ee14b0AgXBmsU+7A16AHQ6xkl3ZELlQDvBl85S+p
FG3kTGVA6dsCUITlcBMKbqFEgvgO+Nr7YJwlsz8GxkiSpzpg/fQkHJ6QGjJUZrzt
e1OMg2cwWrUkLmdxI0boR9Uo3vfKtU4Vkr7ed/YMzyoxLTVbmrlGmr/ipHZ+8+rb
xlmCbwDbtleWqisjDBf71SDpDUIQaCrNmnsVbEyb0Oz5Jj7k6hLhBhD2E6TzZrET
pFABoGdSZ5a6MaH7M7gviO3PKpZ/hqoSfNLZbM/g4S/39hdU7ihIZ8+i7ddXaRUQ
+SXZ/OcOW3bCIhl7Aa8XN8/UiumdF1KDvBfc5ZJ2uvo8ufttXB3G38tiGtcQsEam
eLFW+XvZyt0J+9OIu+wPLGz+gSrsYaS7ffiydaPIedZZjnjsZ50rLSRmkl9AjB25
lM9svwtMO544di1mGHsn
=xCUB
-----END PGP SIGNATURE-----

--Tu8ztk+XgTAiG9Id--
