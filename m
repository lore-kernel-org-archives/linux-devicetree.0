Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7544AC43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 07:38:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A8842084F
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 07:38:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJt5I+jw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbfKLHip (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 02:38:45 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39593 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbfKLHip (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 Nov 2019 02:38:45 -0500
Received: by mail-ot1-f65.google.com with SMTP id z9so358278otq.6
        for <devicetree@vger.kernel.org>; Mon, 11 Nov 2019 23:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=LYwXn2wDJ/t906ceQ84HTpG6OQ0aMpCTjyUpk+qqT9Q=;
        b=dJt5I+jwVZhkK0y/I3bKHdNpPlveRMW+JVFfpsUVkwgx4iQhuImWgMlsTyUe3+rx1Z
         OHyAwBDF5GqFxY6Ym40g3r7xnT+JDSIgbLhZvzyzLjcJXuFR5/lBBU90Wkd/COqqg/Aa
         VInUbxcH4q+N7ZoaLlMr1KTPpJvfgQRU04d2xWrSxsxo2SbRuieKJigYo/4dEacll9qX
         E47i1THS/DgWCjThyaOcnhfIIr0F1u1lgVWGW8U02Fgq2hSSYhWaRW6AqxUQKVPtoFaF
         yL5098idTxHUoF6kaU9aQKG42M1vUYcXpafAE+Vol9P5JtpNdX61AsjfnCKGScnrHDAq
         JTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=LYwXn2wDJ/t906ceQ84HTpG6OQ0aMpCTjyUpk+qqT9Q=;
        b=aUEmgO+1JMO8N9nG7O/7nAepf3R9Nz0fn4eWgEYsQsAmv0g8Uz0uxAv3UN+/4CGDqo
         BEqaokqlvTR6vtaxylbeYsBZ1fGEHkqemOSqJ7/Bsszu5DkQRrPYFNP5mLKeshATFPjO
         AnqjyJZUGM76o6buZ3WAQZud66j/ki8zz+gvJIoFT86aKQYZyTxbt6hNITALOHW4jGE8
         M7OxW4ozFERQrYWEUyhtrlDDBUtKuk7cT2dJugE3AbXPHS2APaHVLZ++1HOC9M8mAaey
         pNuJJqCJ/4t8R2Zny0tyuwgF/moWx7UuuprA0levDhbfKbmz0g0ijWKWUgjkDGMAx5dm
         3uyw==
X-Gm-Message-State: APjAAAU+6+1gYjkaKNxpLDjMaSMwJWWtKvejQqE581EJlaEcvL/mGqPv
        e+Be4yvAGaiUSsU+MCe9CkRLpD3F2lRTUqPXa4VuyA==
X-Google-Smtp-Source: APXvYqxai8BzwvjzK/jdGkp5vdi4N2wR8OwpCZJs9mV8OHZisCAlPNHUhLhlNHiUNV9XfQBpv5mV5UCQKMNuviqIztQ=
X-Received: by 2002:a9d:4b86:: with SMTP id k6mr23252891otf.353.1573544324493;
 Mon, 11 Nov 2019 23:38:44 -0800 (PST)
MIME-Version: 1.0
References: <20191112011521.3155504-1-anarsoul@gmail.com>
In-Reply-To: <20191112011521.3155504-1-anarsoul@gmail.com>
From:   Vasily Khoruzhick <anarsoul@gmail.com>
Date:   Mon, 11 Nov 2019 23:38:18 -0800
Message-ID: <CA+E=qVc+yzVj7dyp9jpeuif5K3dVMEDSiCTG-zSuzLt0intMsw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: rockpro64: fix ES8316 i2c address
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Akash Gajjar <Akash_Gajjar@mentor.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        devicetree <devicetree@vger.kernel.org>,
        arm-linux <linux-arm-kernel@lists.infradead.org>,
        linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Nov 11, 2019 at 5:15 PM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> According to Rockpro64 schematics [1] CE pin of ES8316 is wired
> to ground, so codec address should be 0x10.
>
> [1] http://files.pine64.org/doc/rockpro64/rockpro64_v21-SCH.pdf

Please don't merge it yet, it appears that on Katsuhiro's board codec
is at address 0x11.

> Fixes: 6860769ea771 ("arm64: dts: rockchip: add analog audio nodes on rk3399-rockpro64")
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
> index 7f4b2eba31d4..18bbe548839b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
> @@ -477,9 +477,9 @@
>         i2c-scl-falling-time-ns = <15>;
>         status = "okay";
>
> -       es8316: codec@11 {
> +       es8316: codec@10 {
>                 compatible = "everest,es8316";
> -               reg = <0x11>;
> +               reg = <0x10>;
>                 clocks = <&cru SCLK_I2S_8CH_OUT>;
>                 clock-names = "mclk";
>                 #sound-dai-cells = <0>;
> --
> 2.23.0
>
