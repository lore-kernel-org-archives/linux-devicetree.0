From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH v3 2/3] ARM: qcom: add SMEM device node to IPQ806x dts
Date: Tue, 18 Aug 2015 11:11:38 -0700
Message-ID: <20150818181138.GV13472@usrtlx11787.corpusers.net>
References: <1439855266-26242-1-git-send-email-mathieu@codeaurora.org>
 <1439855266-26242-3-git-send-email-mathieu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439855266-26242-3-git-send-email-mathieu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Olivari <mathieu@codeaurora.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "agross@codeaurora.org" <agross@codeaurora.org>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon 17 Aug 16:47 PDT 2015, Mathieu Olivari wrote:

> SMEM is used on IPQ806x to store various board related information such
> as boot device and flash partition layout. We'll declare it as a device
> so we can make use of it thanks to the new SMEM soc driver.
> 
> Signed-off-by: Mathieu Olivari <mathieu@codeaurora.org>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 8d366ae..85dbccf 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -55,7 +55,7 @@
>  			no-map;
>  		};
>  
> -		smem@41000000 {
> +		smem: smem@41000000 {

I would preferred if you used a name like "smem_region", although I
don't think we will use the phandle name "smem" for anything else...

>  			reg = <0x41000000 0x200000>;
>  			no-map;
>  		};
> @@ -341,4 +341,10 @@
>  
>  		#hwlock-cells = <1>;
>  	};
> +
> +	smem {
> +		compatible = "qcom,smem";
> +		memory-region = <&smem>;
> +		hwlocks = <&sfpb_mutex 3>;
> +	};
>  };

Acked-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Regards,
Bjorn
