From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-binding: hwrng: add NPCM RNG documentation
Date: Tue, 10 Sep 2019 13:42:50 +0100
Message-ID: <20190910124250.2i5muqjt5c35kvgb@holly.lan>
References: <20190909123840.154745-1-tmaimon77@gmail.com>
 <20190909123840.154745-2-tmaimon77@gmail.com>
 <20190910102505.vgyomi575ldrk2lq@holly.lan>
 <CAP6Zq1igPJ5PvaA2YaC-=ngQOnatt4PFJj-QzaJCueDf6KA19A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAP6Zq1igPJ5PvaA2YaC-=ngQOnatt4PFJj-QzaJCueDf6KA19A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: mpm@selenic.com, herbert@gondor.apana.org.au, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, sumit.garg@linaro.org, jens.wiklander@linaro.org, vkoul@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Joel Stanley <joel@jms.id.au>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-crypto@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2019 at 02:55:44PM +0300, Tomer Maimon wrote:
> Hi Daniel,
> 
> Sorry but I have probably miss it, thanks a lot for your comment
> 
> On Tue, 10 Sep 2019 at 13:25, Daniel Thompson <daniel.thompson@linaro.org>
> wrote:
> 
> > On Mon, Sep 09, 2019 at 03:38:39PM +0300, Tomer Maimon wrote:
> > > Added device tree binding documentation for Nuvoton BMC
> > > NPCM Random Number Generator (RNG).
> > >
> > > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > > ---
> > >  .../bindings/rng/nuvoton,npcm-rng.txt           | 17 +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> > >  create mode 100644
> > Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> > b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> > > new file mode 100644
> > > index 000000000000..a697b4425fb3
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> > > @@ -0,0 +1,17 @@
> > > +NPCM SoC Random Number Generator
> > > +
> > > +Required properties:
> > > +- compatible  : "nuvoton,npcm750-rng" for the NPCM7XX BMC.
> > > +- reg         : Specifies physical base address and size of the
> > registers.
> > > +
> > > +Optional property:
> > > +- quality : estimated number of bits of true entropy per 1024 bits
> > > +                     read from the rng.
> > > +                     If this property is not defined, it defaults to
> > 1000.
> >
> > There are pending unreplied review comments about this property (my own
> > as it happens):
> > https://patchwork.kernel.org/patch/11119371/
> >
> > No, there isn't different SoCs.
> we had checked the quality of the hwrng and the results we got are set as
> default.
> we been asked from one of our client to have a dynamic quality, they will
> like to be more strict when using the hwrng.
> is it problematic to add it?

It's a slightly grey area but in general the role of devicetree is to
describe the hardware. This parameter is not doing that.

If you view the quality assessment of this RNG to be a user preference
it is better set the quality to zero which is what the vast majority of
hwrng devices do. When the driver sets the quality to zero then the
kernel does not stir the entropy pool automatically... instead it
relies on the userspace rngd to do that. If the user wants the kernel
to stir the pool automatically then the quality can be set using the
default_quality kernel parameter.


Daniel.

> 
> Having a controllable quality implies that the numeric quality of the
> peripheral changes when it is stamped out on different SoCs (otherwise
> the driver can confidently set the quality without needing any hint
> from the DT). Is that really true here?
> 
> 
> > Daniel.
> >
> > > +
> > > +Example:
> > > +
> > > +rng: rng@f000b000 {
> > > +     compatible = "nuvoton,npcm750-rng";
> > > +     reg = <0xf000b000 0x8>;
> > > +};
> > > --
> > > 2.18.0
> > >
> >
