From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 7/7] dmaengine: sun6i: Remove obsolete clk
 muxing code
Date: Thu, 11 Sep 2014 23:16:01 +0200
Message-ID: <20140911211601.GO31276@lukather>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
 <1410000448-9999-8-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0et/Au7PJwzVwd4K"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBBFEZCQAKGQE6B4HOVA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410000448-9999-8-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--0et/Au7PJwzVwd4K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 06, 2014 at 06:47:28PM +0800, Chen-Yu Tsai wrote:
> The sun6i DMA controller requires the AHB1 bus clock to be
> clocked from PLL6. This was originally done by the dmaengine
> driver during probe time. The AHB1 clock driver has since been
> unified, so the original code does not work.
>=20
> Remove the clk muxing code, and replace it with DT clk default
> properties.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--0et/Au7PJwzVwd4K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUEhERAAoJEBx+YmzsjxAgkDUQAKUFWYi1m1uxmRv22x6yCuF2
JykWJjoS2+f4Ggnbowzbmb4m2C+g23b1C5nkKlADi/ObLchO7N0hCJ8rjXpok4Og
6/FgkS4DGb8HW+jzzbBqhmTdGl4VkDWLWc7OkYRA3TC0/0XDbdbNLkMqKjMeANz/
p1l2sWMwZGAoUQuPj/WNztjLMFq33jKZSPfne+yM8txVLjusB4/xXF9PSip/yMOq
EUxY7xTW7veCQgBSCkW87M84aePfUM9Pf/xcK0cHaAs2ntKacj5iyshy2oQxjj3h
m01KvTBYj5xiBufmMQyW6L7h8bCB6qFtyb3mIet45Sn2MKJDH0ec1yDENlDA+cAH
NdQDNQejqfByjJAM+KeYdhhrmQCi+zZjSUcoBlpHJDk6Ota8Afet1i+QCPmXLe32
hQZDMvUSMhF6avWj3SIUVFlxA7KSryOuL8/ESqeueRctru3KdWI/bQYvCYwzykK5
l9MN3l/iEzmJ3/5xQWXMYK4eHGGFsvnOpmrVabwYpDMdlAiQMEmffTdpChk+FHTI
MliVex8B8mmRmkUFd8pR1/UKzbZebDl22/eoIh8hDRGWR59U5kPL+vyexQvgt+VB
P1eNLP06RcRIK1cA99+cZRqoEQ0k2lwe8HkTCPAv1mY3qqxmKaPHnfgRIuwE6p4m
RVUZrB+O8n/i1gfQRCZP
=0pRw
-----END PGP SIGNATURE-----

--0et/Au7PJwzVwd4K--
