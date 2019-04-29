From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 2/6] dt-bindings: riscv: sifive: add YAML documentation
 for the SiFive FU540
Date: Mon, 29 Apr 2019 11:13:40 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1904291113140.10713@viisi.sifive.com>
References: <20190411084304.5072-2-paul.walmsley@sifive.com> <20190411084304.5072-3-paul.walmsley@sifive.com> <20190429180846.GA26021@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429180846.GA26021@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
List-Id: devicetree@vger.kernel.org

On Mon, 29 Apr 2019, Rob Herring wrote:

> On Thu, Apr 11, 2019 at 01:43:00AM -0700, Paul Walmsley wrote:
> > Add YAML DT binding documentation for the SiFive FU540 SoC.  This
> > SoC is documented at:
> > 
> >     https://static.dev.sifive.com/FU540-C000-v1.0.pdf
> > 
> > Passes dt-doc-validate, as of yaml-bindings commit 4c79d42e9216.

...

> > ---
> >  .../devicetree/bindings/riscv/sifive.yaml     | 26 +++++++++++++++++++
> >  MAINTAINERS                                   |  9 +++++++
> >  2 files changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/sifive.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/sifive.yaml b/Documentation/devicetree/bindings/riscv/sifive.yaml
> > new file mode 100644
> > index 000000000000..d2808d8d79bb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/sifive.yaml
> > @@ -0,0 +1,26 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/riscv/sifive/sifive.yaml#
> 
> The path here should match the file path. IOW, drop 'sifive/'.

Thanks, will do.

- Paul
