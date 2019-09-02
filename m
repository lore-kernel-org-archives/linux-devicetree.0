From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 11/13] dt-bindings: mips: Add loongson cpus & boards
Date: Mon, 2 Sep 2019 15:50:47 +0100
Message-ID: <CAL_Jsq+VmFi6r1-WOa9RJ4vfqsZLqcn5HMbv1oyQjhtJ8Qd8Lw@mail.gmail.com>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
 <20190827085302.5197-12-jiaxun.yang@flygoat.com> <CAL_JsqL6htVye-LSBWw1WwRy9xH=zwuH6gurscwoCWj9Te_hAg@mail.gmail.com>
 <d94eff2b-76ec-5cd2-512d-5ee0406a1bb9@flygoat.com> <20190827204105.7nyt4pi7lvxse5ij@pburton-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827204105.7nyt4pi7lvxse5ij@pburton-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@mips.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, Huacai Chen <chenhc@lemote.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.co>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 27, 2019 at 9:41 PM Paul Burton <paul.burton@mips.com> wrote:
>
> Hi guys,
>
> On Tue, Aug 27, 2019 at 10:18:46PM +0800, Jiaxun Yang wrote:
> > On 2019/8/27 =E4=B8=8B=E5=8D=888:45, Rob Herring wrote:
> > > On Tue, Aug 27, 2019 at 3:55 AM Jiaxun Yang <jiaxun.yang@flygoat.com>=
 wrote:
> > > > diff --git a/Documentation/devicetree/bindings/mips/loongson/cpus.y=
aml b/Documentation/devicetree/bindings/mips/loongson/cpus.yaml
> > > > new file mode 100644
> > > > index 000000000000..410d896a0078
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/mips/loongson/cpus.yaml
> > > > @@ -0,0 +1,38 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > Dual license for new bindings please:
> > >
> > > (GPL-2.0-only OR BSD-2-Clause)
> > >
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/mips/loongson/cpus.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Loongson CPUs bindings
> > > > +
> > > > +maintainers:
> > > > +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> > > > +
> > > > +description: |+
> > > > +  The device tree allows to describe the layout of CPUs in a syste=
m through
> > > > +  the "cpus" node, which in turn contains a number of subnodes (ie=
 "cpu")
> > > > +  defining properties for every cpu.
> > > > +
> > > > +  Bindings for CPU nodes follow the Devicetree Specification, avai=
lable from:
> > > > +
> > > > +  https://www.devicetree.org/specifications/
> > > > +
> > > > +properties:
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +    description: |
> > > > +      Physical ID of a CPU, Can be read from CP0 EBase.CPUNum.
> > > Is this definition specific to Loongson CPUs or all MIPS?
> >
> > Currently it's specific to Loongson CPU only, as other processors may u=
sing
> > different method to express CPU map.
> >
> > Different from Arm, MIPS family of processors seems less uniform and ha=
ve
> > their own designs.
> >
> > For this point, we'd better ask Paul's opinion.
>
> In general on MIPS we detect CPU properties at runtime from coprocessor
> 0 registers & similar sources of information, so there's not really a
> need to specify anything about the CPU in devicetree.

We thought the same thing initially for Arm... Mostly what is in DT is
not what is discoverable. Are clock speeds, power domains, low power
states, etc. all discoverable?

> For example here
> you say yourself that the value for this property can be read from
> EBase.CPUNum - so why specify it in DT?

To map DT nodes to cores?

Rob
