From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: ls1012a: Add FRWY-LS1012A device tree binding
Date: Wed, 24 Oct 2018 19:10:25 -0500
Message-ID: <20181025001025.GA11498@bogus>
References: <20181016074006.10079-1-pramod.kumar_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181016074006.10079-1-pramod.kumar_1@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pramod Kumar <pramod.kumar_1@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Leo Li <leoyang.li@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 16, 2018 at 07:39:35AM +0000, Pramod Kumar wrote:
> LS1012A-FRWY is an ls1012a based SoC board
> Add device tree binding for LS1012A-FRWY board

Subject for bindings should be 'dt-bindings: ...'

> 
> Signed-off-by: Pramod Kumar <pramod.kumar_1@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
> index 8a1baa2b9723..1eda1f79eb43 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.txt
> +++ b/Documentation/devicetree/bindings/arm/fsl.txt
> @@ -155,6 +155,10 @@ LS1012A ARMv8 based FRDM Board
>  Required root node properties:
>      - compatible = "fsl,ls1012a-frdm", "fsl,ls1012a";
>  
> +LS1012A ARMv8 based FRWY Board
> +Required root node properties:
> +    - compatible = "fsl,ls1012a-frwy", "fsl,ls1012a";
> +
>  LS1012A ARMv8 based QDS Board
>  Required root node properties:
>      - compatible = "fsl,ls1012a-qds", "fsl,ls1012a";
> -- 
> 2.17.1
> 
