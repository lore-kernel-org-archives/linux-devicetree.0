Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F19CC433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 02:41:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B669206E9
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 02:41:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgGUClz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jul 2020 22:41:55 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:7801 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725862AbgGUCly (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 Jul 2020 22:41:54 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 640FC4F13BADEE4B7CCF;
        Tue, 21 Jul 2020 10:41:52 +0800 (CST)
Received: from [10.57.101.250] (10.57.101.250) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Tue, 21 Jul 2020 10:41:49 +0800
Subject: Re: [PATCH v3 2/4] arm64: dts: hisilicon: hikey: fixes to comply with
 adi,adv7533 DT binding
To:     =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
        <laurent.pinchart@ideasonboard.com>
References: <20200601063308.13045-1-ricardo.canuelo@collabora.com>
 <20200601063308.13045-3-ricardo.canuelo@collabora.com>
CC:     <kernel@collabora.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <michal.simek@xilinx.com>, <mcoquelin.stm32@gmail.com>,
        <marex@denx.de>
From:   Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5F1655ED.60703@hisilicon.com>
Date:   Tue, 21 Jul 2020 10:41:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20200601063308.13045-3-ricardo.canuelo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Ricardo,

On 2020/6/1 14:33, Ricardo Cañuelo wrote:
> hi3660-hikey960.dts:
>   Define a 'ports' node for 'adv7533: adv7533@39' and the
>   'adi,dsi-lanes' property to make it compliant with the adi,adv7533 DT
>   binding.
> 
>   This fills the requirements to meet the binding requirements,
>   remote endpoints are not defined.
> 
> hi6220-hikey.dts:
>   Change property name s/pd-gpio/pd-gpios, gpio properties should be
>   plural. This is just a cosmetic change.
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!
Applied this patch only to the hisilicon arm64 dt tree since
it does not depend on the new yaml format binding.

Best Regards,
Wei

> ---
>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 11 +++++++++++
>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts    |  2 +-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> index e035cf195b19..8c4bfbaf3a80 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> @@ -530,6 +530,17 @@
>  		status = "ok";
>  		compatible = "adi,adv7533";
>  		reg = <0x39>;
> +		adi,dsi-lanes = <4>;
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			port@0 {
> +				reg = <0>;
> +			};
> +			port@1 {
> +				reg = <1>;
> +			};
> +		};
>  	};
>  };
>  
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> index c14205cd6bf5..3e47150c05ec 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> @@ -516,7 +516,7 @@
>  		reg = <0x39>;
>  		interrupt-parent = <&gpio1>;
>  		interrupts = <1 2>;
> -		pd-gpio = <&gpio0 4 0>;
> +		pd-gpios = <&gpio0 4 0>;
>  		adi,dsi-lanes = <4>;
>  		#sound-dai-cells = <0>;
>  
> 
