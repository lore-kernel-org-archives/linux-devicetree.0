Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9ADC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 07:06:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 531A520671
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 07:06:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgEOHGZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 May 2020 03:06:25 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4847 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726429AbgEOHGY (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 May 2020 03:06:24 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id F2B0C63752B1B774BB0;
        Fri, 15 May 2020 15:06:19 +0800 (CST)
Received: from [10.57.101.250] (10.57.101.250) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Fri, 15 May 2020 15:06:18 +0800
Subject: Re: [PATCH] dt-bindings: hisilicon: Add CTI bindings for hi-6220
To:     Mike Leach <mike.leach@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <coresight@lists.linaro.org>
References: <20200415201259.15831-1-mike.leach@linaro.org>
CC:     <mathieu.poirier@linaro.org>, <suzuki.poulose@arm.com>
From:   Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5EBE3F6A.10501@hisilicon.com>
Date:   Fri, 15 May 2020 15:06:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20200415201259.15831-1-mike.leach@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Mike,

On 2020/4/16 4:12, Mike Leach wrote:
> Adds in CTI device tree information for the Hikey620 board.
> 
> Tested on Linux 5.7-rc1.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Tested-by: Leo Yan <leo.yan@linaro.org>

Thanks!
Applied to the hisilicon arm64 dt tree.

Best Regards,
Wei

> ---
>  .../boot/dts/hisilicon/hi6220-coresight.dtsi  | 130 ++++++++++++++++--
>  1 file changed, 122 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
> index 651771a73ed6..27f067e87601 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
> @@ -213,7 +213,7 @@
>  			};
>  		};
>  
> -		etm@f659c000 {
> +		etm0: etm@f659c000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0 0xf659c000 0 0x1000>;
>  
> @@ -232,7 +232,7 @@
>  			};
>  		};
>  
> -		etm@f659d000 {
> +		etm1: etm@f659d000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0 0xf659d000 0 0x1000>;
>  
> @@ -251,7 +251,7 @@
>  			};
>  		};
>  
> -		etm@f659e000 {
> +		etm2: etm@f659e000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0 0xf659e000 0 0x1000>;
>  
> @@ -270,7 +270,7 @@
>  			};
>  		};
>  
> -		etm@f659f000 {
> +		etm3: etm@f659f000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0 0xf659f000 0 0x1000>;
>  
> @@ -289,7 +289,7 @@
>  			};
>  		};
>  
> -		etm@f65dc000 {
> +		etm4: etm@f65dc000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0 0xf65dc000 0 0x1000>;
>  
> @@ -308,7 +308,7 @@
>  			};
>  		};
>  
> -		etm@f65dd000 {
> +		etm5: etm@f65dd000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0 0xf65dd000 0 0x1000>;
>  
> @@ -327,7 +327,7 @@
>  			};
>  		};
>  
> -		etm@f65de000 {
> +		etm6: etm@f65de000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0 0xf65de000 0 0x1000>;
>  
> @@ -346,7 +346,7 @@
>  			};
>  		};
>  
> -		etm@f65df000 {
> +		etm7: etm@f65df000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0 0xf65df000 0 0x1000>;
>  
> @@ -364,5 +364,119 @@
>  				};
>  			};
>  		};
> +
> +		/* System CTIs */
> +		/* CTI 0 - TMC and TPIU connections */
> +		cti@f6403000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0 0xf6403000 0 0x1000>;
> +
> +			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		/* CTI - CPU-0 */
> +		cti@f6598000 {
> +			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +				     "arm,primecell";
> +			reg = <0 0xf6598000 0 0x1000>;
> +
> +			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&cpu0>;
> +			arm,cs-dev-assoc = <&etm0>;
> +		};
> +
> +		/* CTI - CPU-1 */
> +		cti@f6599000 {
> +			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +				     "arm,primecell";
> +			reg = <0 0xf6599000 0 0x1000>;
> +
> +			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&cpu1>;
> +			arm,cs-dev-assoc = <&etm1>;
> +		};
> +
> +		/* CTI - CPU-2 */
> +		cti@f659a000 {
> +			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +				     "arm,primecell";
> +			reg = <0 0xf659a000 0 0x1000>;
> +
> +			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&cpu2>;
> +			arm,cs-dev-assoc = <&etm2>;
> +		};
> +
> +		/* CTI - CPU-3 */
> +		cti@f659b000 {
> +			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +				     "arm,primecell";
> +			reg = <0 0xf659b000 0 0x1000>;
> +
> +			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&cpu3>;
> +			arm,cs-dev-assoc = <&etm3>;
> +		};
> +
> +		/* CTI - CPU-4 */
> +		cti@f65d8000 {
> +			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +				     "arm,primecell";
> +			reg = <0 0xf65d8000 0 0x1000>;
> +
> +			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&cpu4>;
> +			arm,cs-dev-assoc = <&etm4>;
> +		};
> +
> +		/* CTI - CPU-5 */
> +		cti@f65d9000 {
> +			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +				     "arm,primecell";
> +			reg = <0 0xf65d9000 0 0x1000>;
> +
> +			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&cpu5>;
> +			arm,cs-dev-assoc = <&etm5>;
> +		};
> +
> +		/* CTI - CPU-6 */
> +		cti@f65da000 {
> +			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +				     "arm,primecell";
> +			reg = <0 0xf65da000 0 0x1000>;
> +
> +			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&cpu6>;
> +			arm,cs-dev-assoc = <&etm6>;
> +		};
> +
> +		/* CTI - CPU-7 */
> +		cti@f65db000 {
> +			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +				     "arm,primecell";
> +			reg = <0 0xf65db000 0 0x1000>;
> +
> +			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&cpu7>;
> +			arm,cs-dev-assoc = <&etm7>;
> +		};
>  	};
>  };
> 
