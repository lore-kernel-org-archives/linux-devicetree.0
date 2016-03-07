From: Scott Wood <scott.wood@nxp.com>
Subject: Re: [PATCH v3 1/2] Documentation: DT: Add entry for Freescale
 LS1043a-QDS board
Date: Mon, 7 Mar 2016 17:23:17 +0000
Message-ID: <DB5PR0401MB1928313A537226265C54764291B10@DB5PR0401MB1928.eurprd04.prod.outlook.com>
References: <1457350232-12749-1-git-send-email-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Zhiqiang Hou <zhiqiang.hou@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: Shaohui Xie <shaohui.xie@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>
List-Id: devicetree@vger.kernel.org

On 03/07/2016 05:39 AM, Zhiqiang Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> v3:
>  - No change.
> 
>  Documentation/devicetree/bindings/arm/fsl.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
> index 752a685..f504fdf 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.txt
> +++ b/Documentation/devicetree/bindings/arm/fsl.txt
> @@ -134,6 +134,7 @@ Freescale ARMv8 based Layerscape SoC family Device Tree Bindings
>  LS1043A ARMv8 based RDB Board
>  Required root node properties:
>      - compatible = "fsl,ls1043a-rdb", "fsl,ls1043a";
> +    - compatible = "fsl,ls1043a-qds", "fsl,ls1043a";

"fsl,ls1043a-qds" is required for the "LS1043A ARMv8 based RDB Board"?

-Scott
