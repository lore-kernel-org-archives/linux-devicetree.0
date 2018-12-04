From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 15/34] dt-bindings: arm: Convert Atmel board/soc
 bindings to json-schema
Date: Tue, 4 Dec 2018 16:48:59 -0600
Message-ID: <CAL_JsqLfZwG6NSs0rq5QYjmOCmYFnMRRA5qz=uT2ER9Q3zLiCw@mail.gmail.com>
References: <20181203213223.16986-1-robh@kernel.org> <20181203213223.16986-16-robh@kernel.org>
 <61c52081-7d6d-4de3-81a6-1cd074ac9adc@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <61c52081-7d6d-4de3-81a6-1cd074ac9adc@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <Nicolas.Ferre@microchip.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, ARM-SoC Maintainers <arm@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 4, 2018 at 2:12 AM <Nicolas.Ferre@microchip.com> wrote:
>
> On 03/12/2018 at 22:32, Rob Herring wrote:
> > Convert Atmel SoC bindings to DT schema format using json-schema.
> >
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
>
> I'm listed here...
>
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> Proper email address here...
>
>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >   .../devicetree/bindings/arm/atmel-at91.txt    |  72 ----------
> >   .../devicetree/bindings/arm/atmel-at91.yaml   | 133 ++++++++++++++++++
> >   2 files changed, 133 insertions(+), 72 deletions(-)
> >   delete mode 100644 Documentation/devicetree/bindings/arm/atmel-at91.txt
> >   create mode 100644 Documentation/devicetree/bindings/arm/atmel-at91.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.txt b/Documentation/devicetree/bindings/arm/atmel-at91.txt
> > deleted file mode 100644
> > index 4bf1b4da7659..000000000000
> > --- a/Documentation/devicetree/bindings/arm/atmel-at91.txt
> > +++ /dev/null
> > @@ -1,72 +0,0 @@
> > -Atmel AT91 device tree bindings.
> > -================================
>
> [..]
>
> > diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> > new file mode 100644
> > index 000000000000..19431f58b906
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> > @@ -0,0 +1,133 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/atmel-at91.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Atmel AT91 device tree bindings.
> > +
> > +maintainers:
> > +  - Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > +  - Ludovic Desroches <ludovic.desroches@atmel.com>
>
> ... and sorry but it's not correct just above ^^^
> - wrong Ludovic's email address
> - wrong Alexander's email address
> - and I'm not part of the game anymore...

Humm, I think get_maintainers.pl says you are as that's where the Cc
list came from. But it could be stale if that changed recently.

>
> So actually our MAINTAINER's entry is up-to-date: please use it.

Sorry, it was generated from git history. Many of cases with
get_maintainers.pl was not correct and ended with me being listed.
Probably should have made the git history a fallback.

Rob
