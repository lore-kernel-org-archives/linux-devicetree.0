From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 3/5] dt-bindings: riscv: convert cpu binding to
 json-schema
Date: Fri, 21 Jun 2019 14:39:42 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1906211438210.16518@viisi.sifive.com>
References: <20190602080126.31075-1-paul.walmsley@sifive.com> <20190602080126.31075-4-paul.walmsley@sifive.com> <CAL_JsqJd6s6ta==AoxmNXdpzWL1RytSwR2P4MOfAFSEJavbt+w@mail.gmail.com> <CAL_JsqL1a-irBa4MaVzak5DrTjxiySuqTJSQOqwzymVa=Uz=gg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqL1a-irBa4MaVzak5DrTjxiySuqTJSQOqwzymVa=Uz=gg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Paul Walmsley <paul@pwsan.com>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 21 Jun 2019, Rob Herring wrote:

> On Mon, Jun 10, 2019 at 3:46 PM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Sun, Jun 2, 2019 at 2:01 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> > >
> > > At Rob's request, we're starting to migrate our DT binding
> > > documentation to json-schema YAML format.  Start by converting our cpu
> > > binding documentation.  While doing so, document more properties and
> > > nodes.  This includes adding binding documentation support for the E51
> > > and U54 CPU cores ("harts") that are present on this SoC. 

[ ... ]

> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> You all have applied this now leaving the binding checks broken. I
> have a fix for one issue validating the schema, but there's a
> dependency on schemas/cpus.yaml which I gave feedback on.

Sorry about that, Rob - will follow up.


- Paul
