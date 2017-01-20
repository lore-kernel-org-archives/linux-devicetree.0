From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [V2 1/2] document: dt: add binding for Hi3660 SoC
Date: Fri, 20 Jan 2017 14:56:26 +0000
Message-ID: <5882251A.8030100@hisilicon.com>
References: <1484034915-48879-1-git-send-email-puck.chen@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484034915-48879-1-git-send-email-puck.chen@hisilicon.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen Feng <puck.chen@hisilicon.com>, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: dan.zhao@hisilicon.com, xuyiping@hisilicon.com, puck.chen@foxmail.com, suzhuangluan@hisilicon.com, saberlily.xia@hisilicon.com, qijiwen@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi Chen Feng,

On 2017/1/10 7:55, Chen Feng wrote:
> Add binding for hisilicon Hi3660 SoC and HiKey960 Board.
> 
> Signed-off-by: Chen Feng <puck.chen@hisilicon.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied both to the hisilicon SoC tree
with minimal changes about the format.
Thanks!

Best Regards,
Wei

>  Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
> index 7df79a7..6de2398 100644
> --- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
> +++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
> @@ -8,6 +8,10 @@ Hi6220 SoC
>  Required root node properties:
>  	- compatible = "hisilicon,hi6220";
>  
> +Hi3660 SoC
> +Required root node properties:
> +	- compatible = "hisilicon,hi3660";
> +
>  HiKey Board
>  Required root node properties:
>  	- compatible = "hisilicon,hi6220-hikey", "hisilicon,hi6220";
> 
