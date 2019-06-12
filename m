From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: arm: stm32: Convert STM32 SoC
 bindings to DT schema
Date: Wed, 12 Jun 2019 13:17:20 +0530
Message-ID: <20190612074720.GA5513@Mani-XPS-13-9360>
References: <20190531063849.26142-1-manivannan.sadhasivam@linaro.org>
 <20190531063849.26142-3-manivannan.sadhasivam@linaro.org>
 <CAL_Jsq+N7NA7m+dp+zpwFeZLM6B+OwRrqZdzKkJp2TRWi_e3Mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+N7NA7m+dp+zpwFeZLM6B+OwRrqZdzKkJp2TRWi_e3Mw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-stm32@st-md-mailman.stormreply.com, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, loic pallardy <loic.pallardy@st.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Mon, Jun 10, 2019 at 03:57:43PM -0600, Rob Herring wrote:
> On Fri, May 31, 2019 at 12:39 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > This commit converts STM32 SoC bindings to DT schema using jsonschema.
> >
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  .../devicetree/bindings/arm/stm32/stm32.yaml  | 29 +++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> 
> Converting implies removal of something. The schema looks fine though.
> 

Ah, sorry. I forgot to delete the .txt file. Will do it in next revision.

Thanks,
Mani

> >
> > diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> > new file mode 100644
> > index 000000000000..f53dc0f2d7b3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> > @@ -0,0 +1,29 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/stm32/stm32.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: STMicroelectronics STM32 Platforms Device Tree Bindings
> > +
> > +maintainers:
> > +  - Alexandre Torgue <alexandre.torgue@st.com>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: st,stm32f429
> > +
> > +      - items:
> > +          - const: st,stm32f469
> > +
> > +      - items:
> > +          - const: st,stm32f746
> > +
> > +      - items:
> > +          - const: st,stm32h743
> > +
> > +      - items:
> > +          - const: st,stm32mp157
> > +...
> > --
> > 2.17.1
> >
