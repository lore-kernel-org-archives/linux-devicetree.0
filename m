From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] ARM: dt-bindings: Add vendor prefix for Facebook
Date: Thu, 27 Sep 2018 06:34:23 -0500
Message-ID: <CAL_JsqLvJDatz1oJG3CPY1LcFmqbRwdOeZ0-=Mpbbpq0jfmEwg@mail.gmail.com>
References: <20180919164712.4030353-1-vijaykhemka@fb.com> <20180926230026.GA26508@bogus>
 <CACPK8XctuiN8yphXFUmwXnpphb5LP2i8Cje_HAdsBwMWSvpsdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACPK8XctuiN8yphXFUmwXnpphb5LP2i8Cje_HAdsBwMWSvpsdA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Vijay Khemka <vijaykhemka@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 26, 2018 at 10:14 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 27 Sep 2018 at 03:01, Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, 19 Sep 2018 09:47:10 -0700, Vijay Khemka wrote:
> > > Initial introduction of Facebook TiogaPass family equipped with
> > > Aspeed 2500 BMC SoC. TiogaPass is a x86 server development kit
> > > with a ASPEED ast2500 BMC manufactured by Facebook.
> > >
> > > This adds an entry of Facebook in Documentation for vendor prefix
> > >
> > > Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> > > ---
> > >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Rob, can you take this through the dt tree? I've already merged
> Vijay's device tree through the arm soc tree, and don't plan on
> sending another pull req for 4.20 at this stage.

Sure, now applied.

Rob
