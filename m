From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH V2 1/2] dt-bindings: reset: imx7: Add support for i.MX8MM
Date: Thu, 04 Jul 2019 11:41:45 +0200
Message-ID: <1562233305.6641.8.camel@pengutronix.de>
References: <20190704092600.38015-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190704092600.38015-1-Anson.Huang@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson.Huang@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, ping.bai@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Thu, 2019-07-04 at 17:25 +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> i.MX8MM can reuse i.MX8MQ's reset driver, update the compatible
> property and related info to support i.MX8MM.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> New patch.
> ---
>  Documentation/devicetree/bindings/reset/fsl,imx7-src.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt b/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
> index 13e0951..bc24c45 100644
> --- a/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
> +++ b/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
> @@ -7,7 +7,7 @@ controller binding usage.
>  Required properties:
>  - compatible:
>  	- For i.MX7 SoCs should be "fsl,imx7d-src", "syscon"
> -	- For i.MX8MQ SoCs should be "fsl,imx8mq-src", "syscon"
> +	- For i.MX8MQ/i.MX8MM SoCs should be "fsl,imx8mq-src", "syscon"

Please still add the "fsl,imx8mm-src" for i.MX8MM, just in case a
significant difference is discovered later.

regards
Philipp
