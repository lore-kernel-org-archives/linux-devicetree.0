From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC V3 PATCH 6/7] arm64: dts: msm8994 default serial config
Date: Wed, 12 Oct 2016 14:28:20 +0100
Message-ID: <20161012132806.GA21050@remoulade>
References: <1476265054-22511-1-git-send-email-jeremymc@redhat.com>
 <1476265054-22511-7-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1476265054-22511-7-git-send-email-jeremymc@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jeremy McNicoll <jeremymc@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 12, 2016 at 02:37:33AM -0700, Jeremy McNicoll wrote:
> From: Jeremy McNicoll <jmcnicol@redhat.com>
> 
> As per Documentation/devicetree/bindings/chosen.txt so that we
> are not relying on implicit defaults.

Please fold this patch into the patch introducing the dts file.

There's no need for this to be separate.

Thanks,
Mark.

> Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> index 5cff29f..799aec0 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> @@ -27,7 +27,7 @@
>  	};
>  
>  	chosen {
> -		stdout-path = "serial0";
> +		stdout-path = "serial0:115200n8";
>  	};
>  
>  	soc {
> -- 
> 2.6.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
