From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: sifive: describe sifive-blocks versioning
Date: Fri, 7 Dec 2018 07:55:52 -0600
Message-ID: <CAL_JsqJgt3VxHLcxY54Ojpqz_bLwGSySZ9meowgy6pnLPdXuLQ@mail.gmail.com>
References: <alpine.DEB.2.21.9999.1811211704520.16271@viisi.sifive.com>
 <20181207000104.GA10814@bogus> <alpine.DEB.2.21.9999.1812061645070.29609@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1812061645070.29609@viisi.sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: devicetree@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, Megan Wachs <megan@sifive.com>, Wesley Terpstra <wesley@sifive.com>, Mark Rutland <mark.rutland@arm.com>, linux-riscv@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Walmsley <paul@pwsan.com>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 6, 2018 at 6:46 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
>
>
> On Thu, 6 Dec 2018, Rob Herring wrote:
>
> > On Wed, Nov 21, 2018 at 05:06:56PM -0800, Paul Walmsley wrote:
> > >
> > > For IP blocks that are generated from the public, open-source
> > > sifive-blocks repository, describe the version numbering policy
> > > that its maintainers intend to use, upon request from Rob
> > > Herring <robh@kernel.org>.
> > >
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Palmer Dabbelt <palmer@sifive.com>
> > > Cc: Megan Wachs <megan@sifive.com>
> > > Cc: Wesley Terpstra <wesley@sifive.com>
> > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-riscv@lists.infradead.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> > > Signed-off-by: Paul Walmsley <paul@pwsan.com>
> > > ---
> > >
> > > Hi Rob, please let me know if this document works with your
> > > requirements, or if some changes are needed.  - Paul
> >
> > Looks pretty good to me.
> >
> > >  .../sifive/sifive-blocks-ip-versioning.txt    | 38 +++++++++++++++++++
> > >  1 file changed, 38 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> >
> > Use the path that was suggested.
>
> Could you remind me which one that is?

In this thread: bindings/riscv/sifive/

> > > +
> > > +An example is "sifive,uart0" from:
> > > +
> > > +https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/uart/UART.scala#L43
> >
> > That's nice, but will be out of date as soon as someone adds or removes
> > a line above it. Can you point to a tagged version?
>
> Will do
>
> - Paul
