From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: sifive: describe sifive-blocks versioning
Date: Fri, 7 Dec 2018 09:19:14 -0600
Message-ID: <CABGGisyc-nLZkxtJAr5-BT4ziJO1AW6MU-4ChgBV73No67y0PA@mail.gmail.com>
References: <alpine.DEB.2.21.9999.1811211704520.16271@viisi.sifive.com>
 <20181207000104.GA10814@bogus> <alpine.DEB.2.21.9999.1812061645070.29609@viisi.sifive.com>
 <CAL_JsqJgt3VxHLcxY54Ojpqz_bLwGSySZ9meowgy6pnLPdXuLQ@mail.gmail.com> <alpine.DEB.2.21.9999.1812070624180.16511@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1812070624180.16511@viisi.sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: paul.walmsley@sifive.com
Cc: devicetree@vger.kernel.org, palmer@sifive.com, megan@sifive.com, wesley@sifive.com, Mark Rutland <mark.rutland@arm.com>, linux-riscv@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, paul@pwsan.com
List-Id: devicetree@vger.kernel.org

On Fri, Dec 7, 2018 at 8:31 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
>
> On Fri, 7 Dec 2018, Rob Herring wrote:
>
> > On Thu, Dec 6, 2018 at 6:46 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> > > On Thu, 6 Dec 2018, Rob Herring wrote:
> > > > On Wed, Nov 21, 2018 at 05:06:56PM -0800, Paul Walmsley wrote:
> > > >
> > > > >  .../sifive/sifive-blocks-ip-versioning.txt    | 38 +++++++++++++++++++
> > > > >  1 file changed, 38 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> > > >
> > > > Use the path that was suggested.
> > >
> > > Could you remind me which one that is?
> >
> > In this thread: bindings/riscv/sifive/
>
> SiFive also produces ARM-based SoCs.  Some of those ARM SoCs may use these
> IP blocks from sifive-blocks as well.  As far as I know, there's nothing
> RISC-V-specific about most of these IP blocks.  (As an example, there's
> nothing CPU architecture-specific about a UART.)

Fair enough. As-is is fine.

Rob
