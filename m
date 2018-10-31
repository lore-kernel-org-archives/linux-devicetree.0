From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: Add compatible string for LS1028A-QDS
Date: Wed, 31 Oct 2018 14:58:11 +0800
Message-ID: <20181031065809.GH10386@tiger>
References: <1539760132-3386-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
 <1539760132-3386-2-git-send-email-Bhaskar.Upadhaya@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1539760132-3386-2-git-send-email-Bhaskar.Upadhaya@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sudhanshu Gupta <sudhanshu.gupta@nxp.com>, Harninder Rai <harninder.rai@nxp.com>, Rajesh Bhagat <rajesh.bhagat@nxp.com>, Leo Li <leoyang.li@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 17, 2018 at 11:49:48AM +0000, Bhaskar Upadhaya wrote:
> Signed-off-by: Sudhanshu Gupta <sudhanshu.gupta@nxp.com>
> Signed-off-by: Rai Harninder <harninder.rai@nxp.com>
> Signed-off-by: Rajesh Bhagat <rajesh.bhagat@nxp.com>
> Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

The bindings patch should generally go before rather than after the one
using it in a series.

Shawn

> ---
>  Documentation/devicetree/bindings/arm/fsl.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
> index ea08bf2..3e44804 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.txt
> +++ b/Documentation/devicetree/bindings/arm/fsl.txt
> @@ -163,6 +163,18 @@ LS1012A ARMv8 based QDS Board
>  Required root node properties:
>      - compatible = "fsl,ls1012a-qds", "fsl,ls1012a";
>  
> +LS1028A SoC
> +Required root node properties:
> +    - compatible = "fsl,ls1028a";
> +
> +LS1028A ARMv8 based RDB Board
> +Required root node properties:
> +    - compatible = "fsl,ls1028a-rdb", "fsl,ls1028a"
> +
> +LS1028A ARMv8 based QDS Board
> +Required root node properties:
> +    - compatible = "fsl,ls1028a-qds", "fsl,ls1028a";
> +
>  LS1043A SoC
>  Required root node properties:
>      - compatible = "fsl,ls1043a";
> -- 
> 1.9.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
