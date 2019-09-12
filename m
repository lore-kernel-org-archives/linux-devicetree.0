From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 3/9] dt-bindings: crypto: Add DT bindings
 documentation for sun8i-ce Crypto Engine
Date: Thu, 12 Sep 2019 21:26:27 +0100
Message-ID: <CAGb2v678WGQm5PNy8GhOTpz+fYeLP3k0dnR0F00yyZpSRcA4yA@mail.gmail.com>
References: <20190906184551.17858-1-clabbe.montjoie@gmail.com>
 <20190906184551.17858-4-clabbe.montjoie@gmail.com> <20190907040116.lib532o2eqt4qnvv@flea>
 <20190911183158.GA8264@Red> <20190912093737.s6iu63sdncij2qib@localhost.localdomain>
Reply-To: wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBA6U5LVQKGQE7UNPPNY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190912093737.s6iu63sdncij2qib-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-crypto-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 12, 2019 at 10:37 AM Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> Hi Corentin,
>
> On Wed, Sep 11, 2019 at 08:31:58PM +0200, Corentin Labbe wrote:
> > On Sat, Sep 07, 2019 at 07:01:16AM +0300, Maxime Ripard wrote:
> > > On Fri, Sep 06, 2019 at 08:45:45PM +0200, Corentin Labbe wrote:
> > > > This patch adds documentation for Device-Tree bindings for the
> > > > Crypto Engine cryptographic accelerator driver.
> > > >
> > > > Signed-off-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > ---
> > > >  .../bindings/crypto/allwinner,sun8i-ce.yaml   | 84 +++++++++++++++++++
> > > >  1 file changed, 84 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml b/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
> > [...]
> > > > +else:
> > > > +  clocks:
> > > > +    items:
> > > > +      - description: Bus clock
> > > > +      - description: Module clock
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: ahb
> > > > +      - const: mod
> > > > +
> > > > +  resets:
> > > > +    maxItems: 1
> > > > +
> > > > +  reset-names:
> > > > +    const: ahb
> > >
> > > This prevents the usage of the additionalProperties property, which
> > > you should really use.
> > >
> > > What you can do instead is moving the clocks and clock-names
> > > description under properties, with a minItems of 2 and a maxItems of
> > > 3. Then you can restrict the length of that property to either 2 or 3
> > > depending on the case here.
> > >
> >
> > Hello
> >
> > I fail to do this.
> > I do the following (keeped only clock stuff)
> > properties:
> >
> >   clocks:
> >     items:
> >       - description: Bus clock
> >       - description: Module clock
> >       - description: MBus clock
>
> Add minItems: 2  and maxItems: 3 at the same level than items
>
> >
> >   clock-names:
> >     items:
> >       - const: ahb
> >       - const: mod
> >       - const: mbus
>
> And here as well
>
> Something I missed earlier though was that we've tried to unify as
> much as possible the ahb / apb / axi clocks around the bus name, it
> would be great if you could do it.

I think we also want to standardize "mbus" as "dram"?

ChenYu

> >
> > if:
> >   properties:
> >     compatible:
> >       items:
> >         const: allwinner,sun50i-h6-crypto
> > then:
> >   properties:
> >       clocks:
> >         minItems: 3
> >         maxItems: 3
> >       clock-names:
> >         minItems: 3
> >         maxItems: 3
>
> You don't need to duplicate the min and maxItems here
>
> Maxime
