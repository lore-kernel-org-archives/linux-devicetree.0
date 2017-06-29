From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH v4 5/6] ARM: sun7i: Convert to CCU
Date: Thu, 29 Jun 2017 13:49:05 +0200
Message-ID: <20170629114905.hr6icycjcn2fekfd@flea>
References: <cover.24b2b13ec5a68552e186ba1637f1328363c3886e.1498422562.git-series.plaes@plaes.org>
 <ac9cc7f0a67d3e9e5edd0d5eb21cc60820c2b457.1498422562.git-series.plaes@plaes.org>
 <a08cbe0d-dad4-7d0c-9845-452e0d6e3f03@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ggpms2er24kjfgoa"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a08cbe0d-dad4-7d0c-9845-452e0d6e3f03-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ggpms2er24kjfgoa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2017 at 11:57:05AM +0100, Andre Przywara wrote:
> Hi,
>=20
> On 25/06/17 21:45, Priit Laes wrote:
> > Convert sun7i-a20.dtsi to new CCU driver.
>=20
> I know that some people hat^Wget annoyed by me asking this, but anyway:
>=20
> Why do we actually need this?
>=20
> This ultimately makes the DT incompatible with older kernels (as
> actually shipped by distros today).
>
> So if we for instance use UEFI boot or otherwise just use "one golden
> DT" to drive all kernels (like using the DT from U-Boot), we now don't
> have one good DT that fits all.

What is broken exactly?

> This is really a showstopper for boards which ship a DT in firmware
> (in SPI flash, for instance, or on some eMMC).
>
> So:
> - Do we actually need to change the .dtsi? The old .dtsi should still wor=
k.

It does.

> - Is there anything that the new and fancy clocks gives us over the
> existing clocks? If yes, that should be a  stated in the commit message
> or cover letter.

Yes, support for all the clocks used in the SoC, and not a single
fraction of them (which will reduce the number of additions of new
bindings and drivers, which will in turn make the DT have less
changes, which will make it far more easier for distros and / or
firmwares to ship an immutable DT).

> - Why do we change the clocks for those older SoCs in the first place?
> Can't we just keep on using what worked for years?

Please tell me where the displays clocks, CSI or HDMI clocks are in
the old code.

> I think we really can't remove the old code anyway.

We don't.

> The new clock driver moves information from the DT into the kernel. That
> means it is no longer available for a DT consumer and the SoC details
> (which clocks is located where, for instance), have to be replicated to
> other DT users (U-Boot, *BSD, you-name-it). We already came across this
> issue when looking at converting U-Boot over to use DT clocks.
> Also it ultimately requires kernel changes for each new SoC, even if it
> only differs in some detail which could be perfectly modelled in DT
> (think of H3 vs. H5).

Doing otherwise would also assume that you have a perfect
understanding of all the clocks interactions, relationship and
computations from day one, which is something the old code proved that
it was unreasonable.

The new binding also makes it easier to add SCPI that you're
interested in iirc, where you basically just have to change the CCU
compatible, and be done with it as long as you use the same IDs.

It also lowers the barrier of entry for people that would want to
write new drivers, since the first thing you'd need to do otherwise
would be to create a clock driver for that, which is yet another thing
to learn.

The reduced duplication is also neat and reduces the number of similar
bugs in each and every clock, even though it's not related to clocks.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ggpms2er24kjfgoa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZVOkxAAoJEBx+YmzsjxAgG3gP/ii4+t+51WQCK/0FLH3Sk5I8
GHgei9WjlPcKYG2XLx7sHwlCe9zXQsaySnKbgnmjDu+OYhqEYxsyYLygjVBt5/Ji
+aM8OPT+LiNndib1ZvTa0ogF1gpJxd0oUA/s/lHQPaKsS3UjTnnf6lt1O1nKeFU/
O9ykl/OF8Sq2sUSmONwh1K/YHZZAASBbKlZKrjR/AbDNhVZmeUubwYoKg/6v8usM
sTZJgxLbg0iViTxbLK5tn7R4/uGEOl/X3ttQtTKJVBu5uuSfRuWSvGr9jtzRh5j9
BZoe8C0d6HSWwkHaDHInGW6Wphw61hy4tC3ZircFWo7F+SUVEK1EM6dHVEbsK9nP
17Kf1ejMbJLR02FeZW2Vy28AmtEj5UHMVLi8shfNFGJwnV7073Kydq+HTBgmC1X9
Dzx1lEcVb3EiZ8v0Mp5ER7Y7QWUmRu1AAuGyUwL3kQvKvMFgiS3JsvsFOsYuvZwr
TkCKCM6ySYix0dp2W3CVU6sz7WOUfBHEZgNDKs7iLJJ2vGtjp0Bw3gm+OMz+vx26
5YrOn9t76iLyBVfKZ/NgbqIsREsN8egpqtAgg14YKWJFDCtS7T/E0VTE8zRDKxSl
Ry26pv1onaBRJb17lSCPdZobY91UtcZnEzFwT/fZQL9j2FcuMaKRTkSzwT4P1Jak
hqaEZu4wbnrdgJFSJWsm
=yqPY
-----END PGP SIGNATURE-----

--ggpms2er24kjfgoa--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
