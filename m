From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2 5/5] dt-bindings: Update the isa string description
Date: Tue, 30 Jul 2019 21:52:01 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1907302124010.15340@viisi.sifive.com>
References: <20190731012418.24565-1-atish.patra@wdc.com>
 <20190731012418.24565-6-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190731012418.24565-6-atish.patra@wdc.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Atish Patra <atish.patra@wdc.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Anup Patel <anup.patel@wdc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Johan Hovold <johan@kernel.org>, Alexios Zavras <alexios.zavras@intel.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, Enrico Weigelt <info@metux.net>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
List-Id: devicetree@vger.kernel.org

On Tue, 30 Jul 2019, Atish Patra wrote:

> The yaml documentation description of isa strings section doesn't
> specify anything about the case sensitiveness of the isa strings.
> The RISC-V specification clearly specifies it to be case insensitive.
> However, Linux kernel supports only lower case isa strings.

The DT binding documentation specifies an interface.  As such the binding 
isn't determined by any particular piece of software.  So justifying the 
binding update by referring to what the Linux kernel currently supports 
isn't that relevant.  If you still really believe that software should be 
required to handle mixed-case DT ISA strings, the right answer would be to 
change the software, as your original patches proposed.  The way you've 
written this patch description, it sounds like you still don't agree with 
the conclusion that a strictly lowercase string is a good approach.

If I've misunderstood your intent here, and you do think that specifying 
an all lowercase string is sufficient, then instead of the patch 
description above, how about something like:

"Since the RISC-V specification states that ISA description strings are 
case-insensitive, there's no functional difference between mixed-case, 
upper-case, and lower-case ISA strings.  Thus, to simplify parsing, 
specify that the letters present of riscv,isa must be all lowercase."

That way it's clear that, per the RISC-V specification, there's no 
functional difference associated with case.

However, if what you're saying is that you still don't like this outcome, 
let me know and I'll write the patch myself.  That way you don't have to 
have your name associated with a change that you don't believe in.

> Update the yaml documentation accordingly to avoid any confusion.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index c899111aa5e3..e22a2b7ebafa 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -46,10 +46,14 @@ properties:
>            - rv64imafdc
>      description:
>        Identifies the specific RISC-V instruction set architecture
> -      supported by the hart.  These are documented in the RISC-V
> +      supported by the hart. These are documented in the RISC-V
>        User-Level ISA document, available from
>        https://riscv.org/specifications/
>  
> +      Linux kernel only supports lower case isa strings. Thus,

In the past, the DT maintainers have pushed back against explicitly 
mentioning the Linux kernel in binding documentation, since the DT 
bindings define an interface that's independent of the underlying software 
implementation.  How about just stating something like "Letters in the 
riscv,isa string must be all lowercase" ?

> +      isa strings must be specified in lower case in device tree
> +      as well.
> +

- Paul
