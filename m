From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add pxe1610 as a trivial device
Date: Tue, 23 Jul 2019 08:52:39 -0600
Message-ID: <CAL_Jsq+Kw0TFW_v54Y2QHcChqpNDYhFyCSO5Cj-be9yLSCq-Pw@mail.gmail.com>
References: <20190723002052.2878847-1-vijaykhemka@fb.com> <CAL_Jsq+uAjK6+xzkyOhcH96tZuqv7i6Nz5_nhUQkZ2adt2gutA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+uAjK6+xzkyOhcH96tZuqv7i6Nz5_nhUQkZ2adt2gutA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Jiri Kosina <trivial@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Herbert Xu <herbert@gondor.apana.org.au>, Patrick Venture <venture@google.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Anson Huang <anson.huang@nxp.com>, Jeremy Gebben <jgebben@sweptlaser.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, sdasari@fb.com
List-Id: devicetree@vger.kernel.org

On Tue, Jul 23, 2019 at 8:50 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Mon, Jul 22, 2019 at 6:46 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
> >
> > The pxe1610 is a voltage regulator from Infineon. It also supports
> > other VRs pxe1110 and pxm1310 from Infineon.

What happened to the other compatibles? S/w doesn't need to know the
differences?

> >
> > Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> > ---
> >  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> > index 2e742d399e87..1be648828a31 100644
> > --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> > +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> > @@ -99,6 +99,8 @@ properties:
> >              # Infineon IR38064 Voltage Regulator
> >            - infineon,ir38064
> >              # Infineon SLB9635 (Soft-) I2C TPM (old protocol, max 100khz)
> > +          - infineon,pxe1610
> > +            # Infineon PXE1610, PXE1110 and PXM1310 Voltage Regulators
>
> The comment goes above the entry.
>
> >            - infineon,slb9635tt
> >              # Infineon SLB9645 I2C TPM (new protocol, max 400khz)
> >            - infineon,slb9645tt
> > --
> > 2.17.1
> >
