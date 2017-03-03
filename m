From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: imx-ocotp: add compatible string for
 i.MX7D/S
Date: Fri, 3 Mar 2017 10:12:29 +0000
Message-ID: <a3f9ebba-6dfe-c7a3-fabf-1f5ac69ecafc@linaro.org>
References: <1488350454-23860-1-git-send-email-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488350454-23860-1-git-send-email-peng.fan@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peng Fan <peng.fan@nxp.com>, shawnguo@kernel.org, maxime.ripard@free-electrons.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, van.freenix@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 01/03/17 06:40, Peng Fan wrote:
> Add compatible string for i.MX7D/S
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
>  Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 1 +
>  1 file changed, 1 insertion(+)
>
Thanks for the patch, I will queue both nvmem driver changes and 
bindings changes, via Greg's chars-misc tree.
But the DT changes have to go via arm-soc tree.

Thanks,
srini
> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> index 966a72e..bbde2e4 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> @@ -9,6 +9,7 @@ Required properties:
>  	"fsl,imx6sl-ocotp" (i.MX6SL), or
>  	"fsl,imx6sx-ocotp" (i.MX6SX),
>  	"fsl,imx6ul-ocotp" (i.MX6UL),
> +	"fsl,imx7d-ocotp" (i.MX7D/S),
>  	followed by "syscon".
>  - reg: Should contain the register base and length.
>  - clocks: Should contain a phandle pointing to the gated peripheral clock.
>
