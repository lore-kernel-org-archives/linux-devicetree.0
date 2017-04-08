From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: hisilicon: add bindings for
 hi3798cv200 SoC and Poplar board
Date: Sat, 8 Apr 2017 14:46:58 +0800
Message-ID: <58E88762.6060000@hisilicon.com>
References: <1490769009-12552-1-git-send-email-xuejiancheng@hisilicon.com>
 <1490769009-12552-2-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1490769009-12552-2-git-send-email-xuejiancheng@hisilicon.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jiancheng Xue <xuejiancheng@hisilicon.com>, robh+dt@kernel.org, arnd@arndb.de, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yanhaifeng@hisilicon.com, peter.griffin@linaro.org, elder@linaro.org, hermit.wangheming@hisilicon.com, afaerber@suse.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Jiancheng,

On 2017/3/29 14:30, Jiancheng Xue wrote:
> Add bindings for HiSilicon hi3798cv200 SoC and Poplar Board.
>
> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
> Reviewed-by: Alex Elder <elder@linaro.org>
> Acked-by: Peter Griffin <peter.griffin@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
Thanks!
Applied both to the hisilicon arm64 dt tree but added hi3798cv200 soc
binding to avoid the patch checking warning.

Best Regards,
Wei
> ---
>   Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
> index f1c1e21..1fd3dd7 100644
> --- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
> +++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
> @@ -4,6 +4,10 @@ Hi3660 SoC
>   Required root node properties:
>   	- compatible = "hisilicon,hi3660";
>   
> +Hi3798cv200 Poplar Board
> +Required root node properties:
> +	- compatible = "hisilicon,hi3798cv200-poplar", "hisilicon,hi3798cv200";
> +
>   Hi4511 Board
>   Required root node properties:
>   	- compatible = "hisilicon,hi3620-hi4511";
