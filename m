Return-Path: <SRS0=1yYv=ZB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C240C43331
	for <linux-devicetree@archiver.kernel.org>; Sat,  9 Nov 2019 15:51:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 169C520578
	for <linux-devicetree@archiver.kernel.org>; Sat,  9 Nov 2019 15:51:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbfKIPvp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 9 Nov 2019 10:51:45 -0500
Received: from mailoutvs39.siol.net ([185.57.226.230]:40976 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726026AbfKIPvp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 9 Nov 2019 10:51:45 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTP id 26EA4522776;
        Sat,  9 Nov 2019 16:51:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id sENraahnSVkF; Sat,  9 Nov 2019 16:51:42 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTPS id D20A2522784;
        Sat,  9 Nov 2019 16:51:42 +0100 (CET)
Received: from jernej-laptop.localnet (cpe-86-58-102-7.static.triera.net [86.58.102.7])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Zimbra) with ESMTPA id 7E09B52272F;
        Sat,  9 Nov 2019 16:51:39 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Andre Heider <a.heider@gmail.com>
Cc:     mripard@kernel.org, wens@csie.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: orange-pi-3: Enable IR receiver
Date:   Sat, 09 Nov 2019 16:51:39 +0100
Message-ID: <1875943.ZifhFTZG3p@jernej-laptop>
In-Reply-To: <20191109113436.17979-1-a.heider@gmail.com>
References: <20191109113436.17979-1-a.heider@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi!

Dne sobota, 09. november 2019 ob 12:34:36 CET je Andre Heider napisal(a):
> Orange Pi 3 has an on-board IR receiver, enable it.
> 
> Signed-off-by: Andre Heider <a.heider@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@siol.net>

Thanks!

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts index
> eb379cd402ac..d3e30a67587c 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> @@ -263,6 +263,10 @@
>  	};
>  };
> 
> +&r_ir {
> +	status = "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_ph_pins>;




