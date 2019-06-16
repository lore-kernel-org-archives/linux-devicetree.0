From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: riscv: sifive: add YAML documentation
 for the SiFive FU540
Date: Sun, 16 Jun 2019 11:39:32 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1906161137350.26914@viisi.sifive.com>
References: <20190602080500.31700-1-paul.walmsley@sifive.com> <20190602080500.31700-3-paul.walmsley@sifive.com> <CAL_Jsq+Lx+SBZ7_+0tCYJs+oA2zR9c+q2XdmFbEtpWxoLXVibg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+Lx+SBZ7_+0tCYJs+oA2zR9c+q2XdmFbEtpWxoLXVibg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Paul Walmsley <paul@pwsan.com>, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 10 Jun 2019, Rob Herring wrote:

> On Sun, Jun 2, 2019 at 2:05 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> >
> > Add YAML DT binding documentation for the SiFive FU540 SoC. 

...

> > ---
> >  .../devicetree/bindings/riscv/sifive.yaml     | 25 +++++++++++++++++++
> >  MAINTAINERS                                   |  9 +++++++
> >  2 files changed, 34 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/sifive.yaml
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks.

> > diff --git a/Documentation/devicetree/bindings/riscv/sifive.yaml b/Documentation/devicetree/bindings/riscv/sifive.yaml
> > new file mode 100644
> > index 000000000000..ce7ca191789e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/sifive.yaml
> > @@ -0,0 +1,25 @@
> > +# SPDX-License-Identifier: GPL-2.0
> 
> Note that the preference for new bindings (or old ones you have
> ownership of) is to dual license GPL-2.0 and BSD-2-Clause.

Changed to "(GPL-2.0 OR MIT)" - hope that's OK.


- Paul
