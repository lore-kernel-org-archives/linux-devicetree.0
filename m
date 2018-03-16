From: Abhishek Sahu <absahu@codeaurora.org>
Subject: Re: [PATCH v2 03/13] ARM: dts: ipq4019: Change the max opp frequency
Date: Fri, 16 Mar 2018 15:49:29 +0530
Message-ID: <77ec3dbe81448b43eb22297731bc5c96@codeaurora.org>
References: <1521193101-4586-1-git-send-email-sricharan@codeaurora.org>
 <1521193101-4586-4-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1521193101-4586-4-git-send-email-sricharan@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sricharan R <sricharan@codeaurora.org>
Cc: mark.rutland@arm.com, robh@kernel.org, devicetree@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, linux@armlinux.org.uk, bjorn.andersson@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, linux-soc@vger.kernel.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2018-03-16 15:08, Sricharan R wrote:
> The max opp frequency is 716MHZ. So update that.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>

  Reviewed-by: Abhishek Sahu <absahu@codeaurora.org>

> ---
>  arch/arm/boot/dts/qcom-ipq4019.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> index e38fffa..2ee71c2 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> @@ -47,7 +47,7 @@
>  				48000	1100000
>  				200000	1100000
>  				500000	1100000
> -				666000	1100000
> +				716000  1100000
>  			>;
>  			clock-latency = <256000>;
>  		};
