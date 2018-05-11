From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: Add compatible string for FRWY-LS1012A
Date: Fri, 11 May 2018 16:14:03 +0800
Message-ID: <20180511081401.GE26863@dragon>
References: <1525760999-6187-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
 <1525760999-6187-2-git-send-email-Bhaskar.Upadhaya@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1525760999-6187-2-git-send-email-Bhaskar.Upadhaya@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>
Cc: oss@buserror.net, devicetree@vger.kernel.org, stuart.yoder@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, May 08, 2018 at 11:59:59AM +0530, Bhaskar Upadhaya wrote:
> Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.txt | 4 ++++

Bindings should be copied to DT maintainer for ACK.  Also, bindings
patch should go before the one using the bindings.

Shawn

>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
> index cdb9dd7..0517440 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.txt
> +++ b/Documentation/devicetree/bindings/arm/fsl.txt
> @@ -147,6 +147,10 @@ LS1012A ARMv8 based RDB Board
>  Required root node properties:
>      - compatible = "fsl,ls1012a-rdb", "fsl,ls1012a";
>  
> +LS1012A ARMv8 based FRWY Board
> +Required root node properties:
> +    - compatible = "fsl,frwy-ls1012a", "fsl,ls1012a";
> +
>  LS1012A ARMv8 based FRDM Board
>  Required root node properties:
>      - compatible = "fsl,ls1012a-frdm", "fsl,ls1012a";
> -- 
> 1.9.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
