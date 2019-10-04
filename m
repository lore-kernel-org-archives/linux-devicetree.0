From: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 03/11] dt-bindings: crypto: Add DT
 bindings documentation for sun8i-ce Crypto Engine
Date: Fri, 4 Oct 2019 19:53:07 +0200
Message-ID: <20191004175307.GB11208@Red>
References: <20191001184141.27956-1-clabbe.montjoie@gmail.com>
 <20191001184141.27956-4-clabbe.montjoie@gmail.com>
 <20191002055458.zo2vdbxodj3ch53g@gilmour>
Reply-To: clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7YLCN32UNBBCEO33WAKGQEKDHGPQA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20191002055458.zo2vdbxodj3ch53g@gilmour>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-crypto-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 02, 2019 at 07:54:58AM +0200, Maxime Ripard wrote:
> On Tue, Oct 01, 2019 at 08:41:33PM +0200, Corentin Labbe wrote:
> > This patch adds documentation for Device-Tree bindings for the
> > Crypto Engine cryptographic accelerator driver.
> >
> > Signed-off-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  .../bindings/crypto/allwinner,sun8i-ce.yaml   | 92 +++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml b/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
> > new file mode 100644
> > index 000000000000..9bd26a2eff33
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
> > @@ -0,0 +1,92 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/crypto/allwinner,sun8i-ce.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner Crypto Engine driver
> > +
> > +maintainers:
> > +  - Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - allwinner,sun8i-h3-crypto
> > +      - allwinner,sun8i-r40-crypto
> > +      - allwinner,sun50i-a64-crypto
> > +      - allwinner,sun50i-h5-crypto
> > +      - allwinner,sun50i-h6-crypto
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Bus clock
> > +      - description: Module clock
> > +      - description: MBus clock
> > +    minItems: 2
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bus
> > +      - const: mod
> > +      - const: ram
> > +    minItems: 2
> > +    maxItems: 3
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  reset-names:
> > +    const: bus
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      items:
> > +        const: allwinner,sun50i-h6-crypto
> > +then:
> > +  properties:
> > +      clocks:
> > +        minItems: 3
> > +      clock-names:
> > +        minItems: 3
> > +else:
> > +  properties:
> > +      clocks:
> > +        maxItems: 2
> > +      clock-names:
> > +        maxItems: 2
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +
> > +additionalProperties: true
> 
> I guess you meant false here?
> 

Yes. i wil fix that.

Regards
