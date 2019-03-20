From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: fsl: add compatible for i.MX7S generic
 board
Date: Wed, 20 Mar 2019 17:13:29 +0800
Message-ID: <20190320091327.GJ4980@dragon>
References: <20190304165630.18225-1-bruno.thomsen@gmail.com>
 <20190304165630.18225-3-bruno.thomsen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190304165630.18225-3-bruno.thomsen@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: markus.niebel@tq-group.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 04, 2019 at 05:56:26PM +0100, Bruno Thomsen wrote:
> This patch adds missing compatible for i.MX7Solo boards.
> 
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.txt | 4 ++++

It's gone.  Please patch Documentation/devicetree/bindings/arm/fsl.yaml
instead.

Shawn

>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
> index 7fbc42484001..c90058b621bc 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.txt
> +++ b/Documentation/devicetree/bindings/arm/fsl.txt
> @@ -127,6 +127,10 @@ i.MX6q generic board
>  Required root node properties:
>      - compatible = "fsl,imx6q";
>  
> +i.MX7S generic board
> +Required root node properties:
> +    - compatible = "fsl,imx7s";
> +
>  i.MX7ULP generic board
>  Required root node properties:
>      - compatible = "fsl,imx7ulp";
> -- 
> 2.20.1
> 
