From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 1/7] clk: sunxi: Remove calls to clk_put
Date: Tue, 25 Mar 2014 08:50:59 +0100
Message-ID: <20140325075059.GL5416@lukather>
References: <1394723659-4995-1-git-send-email-maxime.ripard@free-electrons.com>
 <1394723659-4995-2-git-send-email-maxime.ripard@free-electrons.com>
 <20140324215120.32624.63543@quantum>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ggdAeHltlv4tpqCr"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBUP7YSMQKGQESH6FOJY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140324215120.32624.63543@quantum>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ggdAeHltlv4tpqCr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Mon, Mar 24, 2014 at 02:51:20PM -0700, Mike Turquette wrote:
> Quoting Maxime Ripard (2014-03-13 08:14:13)
> > Callers of clk_put must disable the clock first. This also means that a=
s long
> > as the clock is enabled the driver should hold a reference to that cloc=
k.
> > Hence, the call to clk_put here are bogus and should be removed.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> Looks good to me. There is a balanced clk_put in the module remove
> function?

Actually, this is not part of any module, it's part of the function
called through CLK_OF_DECLARE, so there's never a remove function for
this code.

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ggdAeHltlv4tpqCr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTMTVjAAoJEBx+YmzsjxAgWkoP/0BFxgIOorhBQum/NS367wak
6yjebqAwuGWclWlqyLf3d8h6x7Z+x1SCpQtXxunZyLfL0lM7gT1XL7i/JVHkVD6K
pce0Rx3YbVtrj6Xw+Mk6BJHfrC9W3g8bSGSxABEtOl30UQ0dP8Ko+JXiD4vo+zwz
CxjGcyyWPNkKf/ZQF1pPBAfMuOv6E1K+0q2JB2nviggyOIttOXAf2/fozDwaW0lF
r5uhKQGhiaHbwvQfFn+HiXBZDn/3TlLikIQk41B4r++uE5csa4Lle+vJek0CkLcZ
1fqTZyCHq6aWRWicdACOA2tLYtgZsX+4ZlJ4rF2UTtOF6DqDAJVvRJMhy0U2fuzx
/cL9mfi3ILcTaWGfvgdy/omhsqBw1Js+btsG0dX8EzqedtU+cuUt0P6l0HFz/wbt
7cUyosoGAXAy13iW8KHLrjMeydR/vf+7cHUxHhY2/mbyoSaL8orrh0O/gkmxmH3A
zKJX/y/kuFvorbcRf+64WlXRb3ZVPQxjwGYKcKKCsrjwBjDmaACl8vjsrYAtnXfr
8azp/SMolKa7HLTsIFhvYBiSBnDcjpHj6cqE/968BGy23vD82fW3KA8Tl/TGarvh
1FWLJkEIbcC28xYofSmtM8rCnigsFWvUHVwxZyxt6Uxt9pppFMfB1BeonyXA6fsQ
mUYf7scUM6fiHv1GbrlL
=N5NY
-----END PGP SIGNATURE-----

--ggdAeHltlv4tpqCr--
