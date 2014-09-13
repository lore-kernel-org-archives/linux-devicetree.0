From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/7] clk: sunxi: unify sun6i AHB1 clock with
 proper PLL6 pre-divider
Date: Sat, 13 Sep 2014 12:26:03 +0200
Message-ID: <20140913102603.GZ31276@lukather>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
 <1410000448-9999-4-git-send-email-wens@csie.org>
 <20140911210211.GM31276@lukather>
 <CAGb2v66L36nsoucSgLY8pV8f=wjKTvtjJby43Z=Ct+NiRonptQ@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dex7YdYhTh9daYX7"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBK5Z2CQAKGQEBNZN2NI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66L36nsoucSgLY8pV8f=wjKTvtjJby43Z=Ct+NiRonptQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Dex7YdYhTh9daYX7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2014 at 11:16:26AM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Fri, Sep 12, 2014 at 5:02 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Hi,
> >
> > On Sat, Sep 06, 2014 at 06:47:24PM +0800, Chen-Yu Tsai wrote:
> >> This patch unifies the sun6i AHB1 clock, originally supported
> >> with separate mux and divider clks. It also adds support for
> >> the pre-divider on the PLL6 input, thus allowing the clock to
> >> be muxed to PLL6 with proper clock rate calculation.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >
> > It looks fine, but I'd rather see this in a separate file, especially
> > since we don't seem to have any order dependency.
>=20
> Sorry, just to be clear, separate file under clk/sunxi?

Yes

> This cannot be in a separate file, as it shares a spinlock with apb1
> divider. They share the same register.
>=20
> We could move apb1 out though. But i would prefer to do that when
> we split out all the clocks into individual OF_CLK_DECLAREs.

Ah right, my bad :)

My plan on the long term is to kill clk-sunxi as a place where all the
clocks are defined, and only leave the "policy" there, for example the
clock protection code (even if that should probably be removed too,
together with clkdev), the various rates / parenting enforcements,
etc.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Dex7YdYhTh9daYX7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUFBu7AAoJEBx+YmzsjxAgZ4sP/iB0Q85amN/5DMF+FHnwyhUJ
836h1G7yMUOSMknugHfk96c+eaYwsADkewU2Nr8ixJ4daHGLWAkjS3bqqTA5P7N/
ntpJVaLQ0jLjtsji1XTFbzinON3dzwaiMd2uBxYiJNtNaeYlZC+Z0e39Sg3LFQNQ
ezAie+DK0dDYW15GrXgjzYrVcMJisyb0g7Hz00erDj+4/wLTRYAiTzs0b2K8ST2n
jYBmpBCMRgDxLZgZZpXlbAuNWp97CZH/Sg4w2TUy13vDRwIm9PhmCT9TYXleCyTU
JAGJdtYUl5TR/Pq3+ESQHg4CGYS0SDaqsbVpPtv0mTOVdThul2Ip+kalT/OB3KyB
O21QaonCfyutRuTlpENBAYj4ym1q0BdnmX09pwsgRUnyBerUbHv7mRJlYmEG0VdZ
hWwbce2BMcHc8zllYYOJc1JKHDeLUXGl7cv4mnhu11ZLC+w9LwhjDDquPkzDUwV6
qryYXZ5iIkxW9KBiNod/bOZ/B7vy9IMTfDbV0jUWFWutcHw34b92Ewxk4ECCJXbJ
2EdxuvX3boVbLXdR/6Hlir/aW6jz/xO7dUqbVK31yu+ub3IO3WXovrG3ctkOG49t
9KQV/Vlx47ff8iB6JIQ1OaIlMdXqwoxYRTurSTUUokVlE8semG2Ovu9zG8AoEy6K
xNSXQAdxaforeYjs0Whn
=r4Ze
-----END PGP SIGNATURE-----

--Dex7YdYhTh9daYX7--
