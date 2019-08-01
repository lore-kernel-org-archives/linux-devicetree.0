From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 5/5] dt-bindings: Update the riscv,isa string description
Date: Thu, 1 Aug 2019 09:50:37 -0600
Message-ID: <CAL_JsqLqxN1+fvrdD24Ho6s7gB+pGy-0sZaL-jJqkYZ2yC4JEA@mail.gmail.com>
References: <20190801005843.10343-1-atish.patra@wdc.com> <20190801005843.10343-6-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190801005843.10343-6-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Allison Randal <allison@lohutok.net>, Anup Patel <anup.patel@wdc.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, Enrico Weigelt <info@metux.net>, Gary Guo <gary@garyguo.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 31, 2019 at 6:58 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> Since the RISC-V specification states that ISA description strings are
> case-insensitive, there's no functional difference between mixed-case,
> upper-case, and lower-case ISA strings. Thus, to simplify parsing,
> specify that the letters present in "riscv,isa" must be all lowercase.
>
> Suggested-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index c899111aa5e3..4f0acb00185a 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -46,10 +46,12 @@ properties:
>            - rv64imafdc
>      description:
>        Identifies the specific RISC-V instruction set architecture
> -      supported by the hart.  These are documented in the RISC-V
> +      supported by the hart. These are documented in the RISC-V
>        User-Level ISA document, available from
>        https://riscv.org/specifications/
>
> +      Letters in the riscv,isa string must be all lowercase.
> +

The schemas are case sensitive this looks pretty pointless without the
context of the commit msg. Can you prefix with 'While the
specification is case insensitive, "

For some background, FDT generally always has been case sensitive too
(dtc won't merge/override nodes/properties with differing case). It's
really only some older true OF systems that were case insensitive. The
kernel had a mixture of case sensitive and insensitive comparisons
somewhat depending on the arch and whether of_prop_cmp/of_node_cmp or
str*cmp functions were used. There's been a lot of clean-up and now
most comparisons are case sensitive with only Sparc having some
deviation.

Rob
