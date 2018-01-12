From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: Re: [PATCH] arm64: dts: angler: add pstore-ramoops support
Date: Thu, 11 Jan 2018 18:33:55 -0800
Message-ID: <20180112023354.GA16005@mini-rhel.redhat.com>
References: <1514446709-19347-1-git-send-email-zhuoweizhang@yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1514446709-19347-1-git-send-email-zhuoweizhang@yahoo.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: zhuoweizhang@yahoo.com
Cc: jeremymc@redhat.com, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 28, 2017 at 02:38:29AM -0500, zhuoweizhang@yahoo.com wrote:
> From: Zhuowei Zhang <zhuoweizhang@yahoo.com>
> 
> Support pstore-ramoops for retrieving kernel oops and panics after reboot.
> 
> The address and configs are taken from the downstream kernel's device tree.
> 
> Signed-off-by: Zhuowei Zhang <zhuoweizhang@yahoo.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> index dfa08f5..9ce3a6e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> @@ -37,4 +37,19 @@
>  			pinctrl-1 = <&blsp1_uart2_sleep>;
>  		};
>  	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		ramoops@1fe00000 {
> +			compatible = "ramoops";
> +			reg = <0 0x1fe00000 0 0x00200000>;

Downstream doesn't use 0x0 to denote 0.  I am fine with this, if 
someone has a concern or issue with it we can change it before merging.


> +			console-size = <0x100000>;
> +			record-size = <0x10000>;
> +			ftrace-size = <0x10000>;
> +			pmsg-size = <0x80000>;

We could pad this with leading 0's but I find this much easier
to read.

> +		};
> +	};
>  };

Thank you very much for taking the time to send this.  


Acked-by: Jeremy McNicoll <jeremymc@redhat.com>
