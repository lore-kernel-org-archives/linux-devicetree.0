From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt/bindings: mips: Document Ingenic SoCs binding
Date: Mon, 12 Aug 2019 17:43:06 -0600
Message-ID: <20190812234306.GA28064@bogus>
References: <20190722175548.18434-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190722175548.18434-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Mark Rutland <mark.rutland@arm.com>, od@zcrc.me, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 22, 2019 at 01:55:47PM -0400, Paul Cercueil wrote:
> Document the available properties for the root node and the cpu nodes of
> the devicetree for the Ingenic SoCs.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../devicetree/bindings/mips/ingenic-socs.txt      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/ingenic-socs.txt

Please convert this to DT schema.

> diff --git a/Documentation/devicetree/bindings/mips/ingenic-socs.txt b/Documentation/devicetree/bindings/mips/ingenic-socs.txt
> new file mode 100644
> index 000000000000..fea2e6ec10a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/ingenic-socs.txt
> @@ -0,0 +1,14 @@
> +Bindings for Ingenic JZ47xx family of SoCs
> +
> +Required properties for root node:
> +- compatible: One of:
> +  * ingenic,jz4740
> +  * ingenic,jz4725b
> +  * ingenic,jz4770
> +  * ingenic,jz4780
> +
> +Required properties for CPU nodes:
> +- compatible: One of:
> +  * ingenic,xburst-d0
> +  * ingenic,xburst-d1
> +  * ingenic,xburst-e1

Root node and cpu bindings should be separate files. The CPU nodes 
should have much more than just a compatible string.

Rob
