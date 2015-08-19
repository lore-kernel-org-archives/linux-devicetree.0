From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH v4 1/3] ARM: qcom: add SFPB nodes to IPQ806x dts
Date: Wed, 19 Aug 2015 09:35:48 -0700
Message-ID: <20150819163548.GX13472@usrtlx11787.corpusers.net>
References: <1439931860-7473-1-git-send-email-mathieu@codeaurora.org>
 <1439931860-7473-2-git-send-email-mathieu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439931860-7473-2-git-send-email-mathieu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Olivari <mathieu@codeaurora.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "agross@codeaurora.org" <agross@codeaurora.org>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue 18 Aug 14:04 PDT 2015, Mathieu Olivari wrote:

> Add one new node to the ipq806x.dtsi file to declare & register the
> hardware spinlock devices. This mechanism is required to be used by
> other drivers such as SMEM.
> 

Still looks good, but you should have added:

Reviewed-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> Signed-off-by: Mathieu Olivari <mathieu@codeaurora.org>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 9f727d8..8d366ae 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -329,5 +329,16 @@
>  			#reset-cells = <1>;
>  		};
>  
> +		sfpb_mutex_block: syscon@1200600 {
> +			compatible = "syscon";
> +			reg = <0x01200600 0x100>;
> +		};
> +	};
> +
> +	sfpb_mutex: sfpb-mutex {
> +		compatible = "qcom,sfpb-mutex";
> +		syscon = <&sfpb_mutex_block 4 4>;
> +
> +		#hwlock-cells = <1>;
>  	};
>  };
> -- 
> 2.1.4
> 
