From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH RFC] arm64: dts: allwinner: a64: teres-i: Enable audio
Date: Thu, 2 May 2019 09:46:56 +0200
Message-ID: <20190502074656.5tw62ngvjxabrw4o@flea>
References: <20190212100929.iqsxu443qrkl6myf@flea>
 <E1gtds8-0000NB-Re@stardust.g4.wien.funkfeuer.at>
 <20190213094442.da2dy6d5bb527nft@flea>
 <E1gtsx9-0000RP-08@stardust.g4.wien.funkfeuer.at>
 <20190213155311.ovkpim3lxwyvuhhj@flea>
 <E1gu4dx-0000Sy-2B@stardust.g4.wien.funkfeuer.at>
 <20190215142029.GB32618@lst.de>
 <E1gv6rh-0000Km-U8@stardust.g4.wien.funkfeuer.at>
 <20190218102442.l3br2h3oqfe2atdv@flea>
 <20190430133232.GA18808@lst.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1550223904987698635=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190430133232.GA18808@lst.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Torsten Duwe <duwe@lst.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, info@olimex.com, Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Harald Geyer <harald@ccbib.org>, ibu@radempa.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1550223904987698635==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ogjf4ravo7ykhs3c"
Content-Disposition: inline


--ogjf4ravo7ykhs3c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 30, 2019 at 03:32:32PM +0200, Torsten Duwe wrote:
> On Mon, Feb 18, 2019 at 11:24:42AM +0100, Maxime Ripard wrote:
> > On Sat, Feb 16, 2019 at 09:47:13PM +0100, Harald Geyer wrote:
> > >
> > > > Would you care to submit a patch version without that GPIO handled?
> > > > I think it's very useful and has the potential to be agreed upon.
> > >
> > > That would enable audio from the internal speakers but select debug
> > > output on the HP jack by default. I would be okay with that, despite
> > > still thinking that audio on the head phones should be the default.
> > >
> > > Maxime and Wens are the maintainers, so it's their call in the end.
> >
> > At this point, I'm not really convinced by the solution in that patch,
> > but I don't have really good ideas either. I think it would be good to
> > discuss this with Mark and Linus Walleij, they will probably have way
> > better solutions than what I can come up with.
>
> Once more my plead to *please* apply the unchallenged parts of this patch!
>
> For reference:
> https://patchwork.kernel.org/patch/10792589/
>
>
> Just leave out the line
>
> +	hpvcc-supply = <&reg_eldo1>; /* TODO: Use only one of these */
> (as clarified by ChenYu)
>
> and the
>
> @@ -131,6 +151,14 @@
>  	status = "okay";
>  };
>
> +&r_pio {
> +	r_debug_select_pin: debug-select {
> [...]
>
> hunk, which the discussion was about. The patch is of good value
> even without it.
>
> IMHO it's a shame this didn't make it into 5.1
>
> Acked-by: Torsten Duwe <duwe@suse.de>

Please resend that patch

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ogjf4ravo7ykhs3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXMqgcAAKCRDj7w1vZxhR
xUkWAP432UpRG05M57jNudXsgptVGodfkKNSF8GCePGGa381ugD+I4nvdzZdYqOA
sTKkTdR+ULGdkJncmivGKljgsi9Y7AA=
=6Eua
-----END PGP SIGNATURE-----

--ogjf4ravo7ykhs3c--


--===============1550223904987698635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1550223904987698635==--
