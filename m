From: Avi Fishman <avifishman70@gmail.com>
Subject: Re: [PATCH v1 1/2] dt-binding: hwrng: add NPCM RNG documentation
Date: Sun, 18 Aug 2019 10:26:17 +0300
Message-ID: <CAKKbWA607qZ+LODfYi7yUWOQ3DV4Wxi4VUGkW=waSzzRbHp+OA@mail.gmail.com>
References: <20190722150241.345609-1-tmaimon77@gmail.com> <20190722150241.345609-2-tmaimon77@gmail.com>
 <20190812233623.GA24924@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812233623.GA24924@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>, mpm@selenic.com, herbert@gondor.apana.org.au, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, sumit.garg@linaro.org, jens.wiklander@linaro.org, vkoul@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Joel Stanley <joel@jms.id.au>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-crypto@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 2:36 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jul 22, 2019 at 06:02:40PM +0300, Tomer Maimon wrote:
> > Added device tree binding documentation for Nuvoton BMC
> > NPCM Random Number Generator (RNG).
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../bindings/rng/nuvoton,npcm-rng.txt           | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> >
> > diff --git a/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> > new file mode 100644
> > index 000000000000..a697b4425fb3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> > @@ -0,0 +1,17 @@
> > +NPCM SoC Random Number Generator
> > +
> > +Required properties:
> > +- compatible  : "nuvoton,npcm750-rng" for the NPCM7XX BMC.
> > +- reg         : Specifies physical base address and size of the registers.
> > +
> > +Optional property:
> > +- quality : estimated number of bits of true entropy per 1024 bits
> > +                     read from the rng.
> > +                     If this property is not defined, it defaults to 1000.
>
> This would need a vendor prefix, however, I think it should be implied
> by the compatible string. It is fixed per SoC, right?

Tomer is on vacation, so I answer instead:
This value is the same for all our SoC flavor that contains this RNG HW.


-- 
Regards,
Avi
