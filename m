From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: riscv: sifive: add YAML documentation
 for the SiFive FU540
Date: Mon, 29 Apr 2019 13:08:46 -0500
Message-ID: <20190429180846.GA26021@bogus>
References: <20190411084304.5072-2-paul.walmsley@sifive.com>
 <20190411084304.5072-3-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190411084304.5072-3-paul.walmsley@sifive.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 11, 2019 at 01:43:00AM -0700, Paul Walmsley wrote:
> Add YAML DT binding documentation for the SiFive FU540 SoC.  This
> SoC is documented at:
> 
>     https://static.dev.sifive.com/FU540-C000-v1.0.pdf
> 
> Passes dt-doc-validate, as of yaml-bindings commit 4c79d42e9216.
> 
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  .../devicetree/bindings/riscv/sifive.yaml     | 26 +++++++++++++++++++
>  MAINTAINERS                                   |  9 +++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sifive.yaml
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sifive.yaml b/Documentation/devicetree/bindings/riscv/sifive.yaml
> new file mode 100644
> index 000000000000..d2808d8d79bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/sifive.yaml
> @@ -0,0 +1,26 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/sifive/sifive.yaml#

The path here should match the file path. IOW, drop 'sifive/'.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive SoC-based boards
> +
> +maintainers:
> +  - Paul Walmsley <paul.walmsley@sifive.com>
> +  - Palmer Dabbelt <palmer@sifive.com>
> +
> +description:
> +  SiFive SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    items:
> +      - enum:
> +          - sifive,freedom-unleashed-a00-fu540
> +          - sifive,freedom-unleashed-a00
> +      - const: sifive,fu540-c000
> +      - const: sifive,fu540
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3ec37f17f90e..c02bf352a8c6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14138,6 +14138,15 @@ S:	Supported
>  K:	sifive
>  N:	sifive
>  
> +SIFIVE FU540 SYSTEM-ON-CHIP
> +M:	Paul Walmsley <paul.walmsley@sifive.com>
> +M:	Palmer Dabbelt <palmer@sifive.com>
> +L:	linux-riscv@lists.infradead.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pjw/sifive.git
> +S:	Supported
> +K:	fu540
> +N:	fu540
> +
>  SILEAD TOUCHSCREEN DRIVER
>  M:	Hans de Goede <hdegoede@redhat.com>
>  L:	linux-input@vger.kernel.org
> -- 
> 2.20.1
> 
