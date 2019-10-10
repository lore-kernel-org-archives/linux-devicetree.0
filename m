From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2] dt-bindings: riscv: Fix CPU schema errors
Date: Wed, 9 Oct 2019 17:08:43 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1910091657240.11044@viisi.sifive.com>
References: <20191009234648.2271-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191009234648.2271-1-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>
List-Id: devicetree@vger.kernel.org

On Wed, 9 Oct 2019, Rob Herring wrote:

> Fix the errors in the RiscV CPU DT schema:
> 
> Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: 'timebase-frequency' is a required property
> Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@1: 'timebase-frequency' is a required property
> Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: compatible:0: 'riscv' is not one of ['sifive,rocket0', 'sifive,e5', 'sifive,e51', 'sifive,u54-mc', 'sifive,u54', 'sifive,u5']
> Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: compatible: ['riscv'] is too short
> Documentation/devicetree/bindings/riscv/cpus.example.dt.yaml: cpu@0: 'timebase-frequency' is a required property
> 
> The DT spec allows for 'timebase-frequency' to be in 'cpu' or 'cpus' node
> and RiscV is doing nothing special with it, so just drop the definition
> here and don't make it required.

The RISC-V kernel code does in fact parse it and use it, and we currently 
rely on it being under /cpus:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/riscv/kernel/time.c#n19

The RISC-V user ISA specification also constrains the timebase-frequency 
to be the same across all CPUs, in section 10.1:

  https://github.com/riscv/riscv-isa-manual/releases/download/draft-20190608-f467e5d/riscv-spec.pdf

So the right thing is to require 'timebase-frequency' at /cpus, and forbid 
it in the individual CPU nodes. 

> 
> Fixes: 4fd669a8c487 ("dt-bindings: riscv: convert cpu binding to json-schema")
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/riscv/cpus.yaml       | 28 ++++++++-----------
>  1 file changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index b261a3015f84..925b531767bf 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -24,15 +24,17 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - sifive,rocket0
> -          - sifive,e5
> -          - sifive,e51
> -          - sifive,u54-mc
> -          - sifive,u54
> -          - sifive,u5
> -      - const: riscv
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sifive,rocket0
> +              - sifive,e5
> +              - sifive,e51
> +              - sifive,u54-mc
> +              - sifive,u54
> +              - sifive,u5
> +          - const: riscv
> +      - const: riscv    # Simulator only
>      description:
>        Identifies that the hart uses the RISC-V instruction set
>        and identifies the type of the hart.
> @@ -66,13 +68,6 @@ properties:
>        insensitive, letters in the riscv,isa string must be all
>        lowercase to simplify parsing.
>  
> -  timebase-frequency:
> -    type: integer
> -    minimum: 1
> -    description:
> -      Specifies the clock frequency of the system timer in Hz.
> -      This value is common to all harts on a single system image.
> -
>    interrupt-controller:
>      type: object
>      description: Describes the CPU's local interrupt controller
> @@ -93,7 +88,6 @@ properties:
>  
>  required:
>    - riscv,isa
> -  - timebase-frequency
>    - interrupt-controller
>  
>  examples:
> -- 
> 2.20.1
> 
> 


- Paul
