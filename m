From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 3/9] dt-bindings: crypto: Add DT bindings documentation
 for sun8i-ce Crypto Engine
Date: Thu, 12 Sep 2019 22:33:01 +0200
Message-ID: <20190912203301.is4ubixhk64dl5t7@localhost.localdomain>
References: <20190906184551.17858-1-clabbe.montjoie@gmail.com>
 <20190906184551.17858-4-clabbe.montjoie@gmail.com>
 <20190907040116.lib532o2eqt4qnvv@flea>
 <20190911183158.GA8264@Red>
 <20190912093737.s6iu63sdncij2qib@localhost.localdomain>
 <CAGb2v678WGQm5PNy8GhOTpz+fYeLP3k0dnR0F00yyZpSRcA4yA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v678WGQm5PNy8GhOTpz+fYeLP3k0dnR0F00yyZpSRcA4yA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, David Miller <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-crypto@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 12, 2019 at 09:26:27PM +0100, Chen-Yu Tsai wrote:
> > >
> > >   clock-names:
> > >     items:
> > >       - const: ahb
> > >       - const: mod
> > >       - const: mbus
> >
> > And here as well
> >
> > Something I missed earlier though was that we've tried to unify as
> > much as possible the ahb / apb / axi clocks around the bus name, it
> > would be great if you could do it.
>=20
> I think we also want to standardize "mbus" as "dram"?

Do we? The only user so far seems to be sun9i-de, while mbus has more
users. I don't really care though, both mbus and dram are pretty
generic to me. What makes you prefer dram over mbus?

Maxime
