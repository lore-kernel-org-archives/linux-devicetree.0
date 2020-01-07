Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01933C32771
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 01:20:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CBF1A2073D
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 01:20:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbgAGBUh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 20:20:37 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:8228 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727250AbgAGBUh (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 6 Jan 2020 20:20:37 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id C86536436AE1489FE599;
        Tue,  7 Jan 2020 09:20:34 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Tue, 7 Jan 2020
 09:20:30 +0800
Subject: Re: [PATCH] arm64: dts: hi3798cv200-poplar: add linux,rc-map-name for
 IR
To:     Shawn Guo <shawn.guo@linaro.org>
References: <20191226083844.2729-1-shawn.guo@linaro.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
From:   Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E13DCDE.1090305@hisilicon.com>
Date:   Tue, 7 Jan 2020 09:20:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20191226083844.2729-1-shawn.guo@linaro.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Shawn,

On 2019/12/26 16:38, Shawn Guo wrote:
> It adds remote control map name for IR device, so that key event can be
> reported.
>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Thanks!
Applied to the hisilicon arm64 dt tree.

Best Regards,
Wei

> ---
>   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts b/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
> index c563d3eb2d98..7d370dac4c85 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
> @@ -170,6 +170,7 @@
>   };
>   
>   &ir {
> +	linux,rc-map-name = "rc-hisi-poplar";
>   	status = "okay";
>   };
>   


