Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACE0C33CA2
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 11:37:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F005B206F0
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 11:37:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbgAHLhX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 06:37:23 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:34408 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726098AbgAHLhX (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 8 Jan 2020 06:37:23 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 8599411B6155C6BB9C78;
        Wed,  8 Jan 2020 19:37:21 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Wed, 8 Jan 2020
 19:37:18 +0800
Subject: Re: [PATCH] arm64: dts: hi3798cv200: correct PCIe 'bus-range' setting
To:     Shawn Guo <shawn.guo@linaro.org>
References: <20200107122908.18025-1-shawn.guo@linaro.org>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
From:   Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E15BEEE.2040100@hisilicon.com>
Date:   Wed, 8 Jan 2020 19:37:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20200107122908.18025-1-shawn.guo@linaro.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Shawn,

On 2020/1/7 20:29, Shawn Guo wrote:
> The PCIe 'bus-range' setting is incorrect and causing the following
> message during boot.
>
> pci_bus 0000:01: busn_res: can not insert [bus 01-ff] under [bus 00-0f] (conflicts with (null) [bus 00-0f])
>
> Correct it to get rid of the message.
>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Thanks!
Applied to the hisilicon arm64 dt tree.

Best Regards,
Wei

> ---
>   arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> index 0a30aaae6bf2..4d1a3d1fc31c 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> @@ -569,7 +569,7 @@
>   			#address-cells = <3>;
>   			#size-cells = <2>;
>   			device_type = "pci";
> -			bus-range = <0 15>;
> +			bus-range = <0x00 0xff>;
>   			num-lanes = <1>;
>   			ranges = <0x81000000 0x0 0x00000000 0x4f00000 0x0 0x100000
>   				  0x82000000 0x0 0x3000000 0x3000000 0x0 0x01f00000>;


