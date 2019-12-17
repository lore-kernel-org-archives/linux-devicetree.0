Return-Path: <SRS0=r3bb=2H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3161C2D0CD
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 14:14:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA0B02176D
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 14:14:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728807AbfLQOOm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Dec 2019 09:14:42 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:52989 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728695AbfLQOOm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Dec 2019 09:14:42 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 4239A3C057F;
        Tue, 17 Dec 2019 15:14:40 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id a5abf8uTubOv; Tue, 17 Dec 2019 15:14:35 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 0A8123C00BB;
        Tue, 17 Dec 2019 15:14:35 +0100 (CET)
Received: from vmlxhi-102.adit-jv.com (10.72.93.66) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Tue, 17 Dec
 2019 15:14:34 +0100
Date:   Tue, 17 Dec 2019 15:14:34 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: renesas: r8a77961: Add I2C nodes
Message-ID: <20191217141434.GC27250@vmlxhi-102.adit-jv.com>
References: <20191216124740.16647-1-geert+renesas@glider.be>
 <20191216124740.16647-6-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191216124740.16647-6-geert+renesas@glider.be>
X-Originating-IP: [10.72.93.66]
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Geert,

On Mon, Dec 16, 2019 at 01:47:39PM +0100, Geert Uytterhoeven wrote:
> Add device nodes for the I2C and IIC Controllers on the Renesas R-Car
> M3-W+ (r8a77961) SoC, including DMA properties linking them to the DMA
> controllers.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - No changes.
> 
> Test procedure (MAX9611 ADC, BR24T01 EEPROM):
>   1. "grep . /sys/bus/iio/devices/iio:device[01]/in*",
>   2. "hd /sys/devices/platform/soc/e60b0000.i2c/i2c-?/?-0050/eeprom".
> ---
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 117 +++++++++++++++++++++-
>  1 file changed, 114 insertions(+), 3 deletions(-)

FWIW, I notice changed i2c indexes in dmesg depending if I include the
i2c aliases visible in below commits:

fcb008a75702c9 ("arm64: dts: r8a7796: add I2C support")
32bc0c51be7c9d ("arm64: renesas: r8a7795: add I2C support")

Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>

-- 
Best Regards,
Eugeniu
