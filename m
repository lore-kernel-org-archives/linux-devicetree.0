From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/7] clk: sunxi: unify sun6i AHB1 clock with
 proper PLL6 pre-divider
Date: Fri, 26 Sep 2014 10:28:14 +0200
Message-ID: <20140926082814.GP15315@lukather>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
 <1410000448-9999-4-git-send-email-wens@csie.org>
 <20140911210211.GM31276@lukather>
 <CAGb2v66L36nsoucSgLY8pV8f=wjKTvtjJby43Z=Ct+NiRonptQ@mail.gmail.com>
 <20140913102603.GZ31276@lukather>
 <20140925230340.19023.22674@quantum>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yFtM4vvgVM46ytb2"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBC6ISSQQKGQERPMQ7ZA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140925230340.19023.22674@quantum>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--yFtM4vvgVM46ytb2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2014 at 04:03:40PM -0700, Mike Turquette wrote:
> Quoting Maxime Ripard (2014-09-13 03:26:03)
> > On Fri, Sep 12, 2014 at 11:16:26AM +0800, Chen-Yu Tsai wrote:
> > > Hi,
> > >=20
> > > On Fri, Sep 12, 2014 at 5:02 AM, Maxime Ripard
> > > <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > > > Hi,
> > > >
> > > > On Sat, Sep 06, 2014 at 06:47:24PM +0800, Chen-Yu Tsai wrote:
> > > >> This patch unifies the sun6i AHB1 clock, originally supported
> > > >> with separate mux and divider clks. It also adds support for
> > > >> the pre-divider on the PLL6 input, thus allowing the clock to
> > > >> be muxed to PLL6 with proper clock rate calculation.
> > > >>
> > > >> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > > >
> > > > It looks fine, but I'd rather see this in a separate file, especial=
ly
> > > > since we don't seem to have any order dependency.
> > >=20
> > > Sorry, just to be clear, separate file under clk/sunxi?
> >=20
> > Yes
> >=20
> > > This cannot be in a separate file, as it shares a spinlock with apb1
> > > divider. They share the same register.
> > >=20
> > > We could move apb1 out though. But i would prefer to do that when
> > > we split out all the clocks into individual OF_CLK_DECLAREs.
> >=20
> > Ah right, my bad :)
> >=20
> > My plan on the long term is to kill clk-sunxi as a place where all the
> > clocks are defined, and only leave the "policy" there, for example the
> > clock protection code (even if that should probably be removed too,
> > together with clkdev), the various rates / parenting enforcements,
> > etc.
>=20
> Interesting! Where are you planning to store the clock data?

Which data?=20

I guess, for the rate boundaries, the DT would be the right place,
wether a clock should be protected can be derived from its
compatible. And for the rate to enforce, maybe a clock-frequency
property in the DT too, or directly in the driver, I haven't really
thought about that part at the moment to be honest :)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--yFtM4vvgVM46ytb2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUJSOeAAoJEBx+YmzsjxAgYpEQAKmXeZA80Fb9x+aZiwZBN9TD
1fSH7KtuOr9HKLanUNSdRdbUde6+9LRKBVsHAidP0cbeLiEXTzjkxfCf2hHCCqaG
nyTfubemooU9VM5ot3YWejGyerL3gxwHUz+61LPaVqUO6yp9sDkL5nNvYCm8h0E8
4gEAyjkQ1dkWOc/zd0WFsOQUg2Kq36etwFaCSgQzvLYHDvz5vne19zIBuw0wsbKn
NR9qoE6azaM/YCpmBGZKkDhqVp3/hpoHIApNoEjKplPMRoa3S3rAayzZ3PKoI8m4
AMOu+8APzgYvQpdynRqA9YnoNZk7AXsAynugdYWTLlaxj4pMMhOKUNJ6ZqNhj1rb
rQqoft6munFBMF1Lli05Mcl6BrTVx5ZowrQypVZGeIAGG9c9AxYVmJ+S62tI9NHZ
Vpx1UhoywrHLvfsFDh8pi4vXOvQ1yzQ+jp1J2gIR3a0ZRbupYpUD8thpQI/xAaKn
xuzLqRPnH9EDIf1ar5C2njoj24dvOinQdo0qg1j8OgrTzSr3Zc7AwGoJbLGbR2lQ
TxY3WxATzObQfbSD5F1V3+4YLQnA7g+jrq6PYll0v8dGtMA81BQqv1MgL6tSqqSX
3MXYwdeSGGw7ftqyXfUnGizwIuJ6hq/SoMperwr5mou+9HxKhJk3TFpIXRZ7R70N
tqgVtHW0VNbTlY2MMw/e
=/ol0
-----END PGP SIGNATURE-----

--yFtM4vvgVM46ytb2--
