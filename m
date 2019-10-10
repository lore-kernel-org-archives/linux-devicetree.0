From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: riscv: Fix CPU schema errors
Date: Thu, 10 Oct 2019 07:44:43 -0500
Message-ID: <CAL_JsqK==+6QPrx3NDobYfWQwRg9m-t0LZgL=KzqfhAfbu+xTg@mail.gmail.com>
References: <20191009234648.2271-1-robh@kernel.org>
 <alpine.DEB.2.21.9999.1910091657240.11044@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <alpine.DEB.2.21.9999.1910091657240.11044@viisi.sifive.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 9, 2019 at 7:08 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> On Wed, 9 Oct 2019, Rob Herring wrote:
>
> > Fix the errors in the RiscV CPU DT schema:
> >
> > Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: 'timebase-frequency' is a required property
> > Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@1: 'timebase-frequency' is a required property
> > Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: compatible:0: 'riscv' is not one of ['sifive,rocket0', 'sifive,e5', 'sifive,e51', 'sifive,u54-mc', 'sifive,u54', 'sifive,u5']
> > Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: compatible: ['riscv'] is too short
> > Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: 'timebase-frequency' is a required property
> >
> > The DT spec allows for 'timebase-frequency' to be in 'cpu' or 'cpus' node
> > and RiscV is doing nothing special with it, so just drop the definition
> > here and don't make it required.
>
> The RISC-V kernel code does in fact parse it and use it, and we currently
> rely on it being under /cpus:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/riscv/kernel/time.c#n19
>
> The RISC-V user ISA specification also constrains the timebase-frequency
> to be the same across all CPUs, in section 10.1:
>
>   https://github.com/riscv/riscv-isa-manual/releases/download/draft-20190608-f467e5d/riscv-spec.pdf
>
> So the right thing is to require 'timebase-frequency' at /cpus, and forbid
> it in the individual CPU nodes.

Yes, but this schema only deals with 'cpu' nodes and we can't check
/cpus here. We'd need to write another schema matching on a child cpu
node having a RiscV compatible.

I can change this to 'timebase-frequency: false' to ban it here. That
doesn't add too much as any undefined name is still allowed such as
'timbase-frequency'. There's a way to address this in json-schema
draft8 with 'unevaluatedProperties', but that's not ready yet.

Rob
