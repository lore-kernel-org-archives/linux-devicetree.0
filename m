Return-Path: <SRS0=58Ja=6S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F717C28CBC
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 01:22:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CCD7206EB
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 01:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588555337;
	bh=O8kCrFICDJ5/5RiUO9wpxKz/8P1JpoNA+6W2FZAb49g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=CD8SpRCa/Er7fNZsvZhi6B0zogmHO4giBnLjrKmkwCNLaY2cnLUBC+utotE0/uAN3
	 NEoBOWTLZPZJyr4LM3zqtp3MOUW3u9+vP8aBBU6L5maFimu/gf6WLTEm3mrTZ2DM7e
	 I1GMcGelYQrqNx3+/SZLxsfQsMYVb3CeUMPWBB68=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726433AbgEDBWR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 3 May 2020 21:22:17 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:18066 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgEDBWQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 3 May 2020 21:22:16 -0400
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0441LxNM016166
        for <devicetree@vger.kernel.org>; Mon, 4 May 2020 10:21:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0441LxNM016166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588555319;
        bh=w6du8zRDwlzzQ3j9xUVVgBtnqj2wcYyHezkuilzoEsA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hmagM2HfWU0iXThMS4jPCgHR7fz2y/v70dZSAdLj4gw44O4S0+BukmW7Bje2Px6ak
         H+MKBETlRY/cdGPH2dJFH6SS7H4EyLdQkJQheNXJka83qClXgfcr53RNGclX8KcTgf
         K4OhY1lQNBFuOdrKqAxJiW5kl6yrWZlu0FJYUbgpk+oQGWoyeX3jpVsuiKZ+xf3jDR
         RWYcrpL0MnN24bV8tJ8jaI0SLiThFoS1/8/XY+6uyKLGHN3u0ho25ZUAoqI0ErizpB
         d4VME0hfYeIU9F5irQTDMTAArbYUy+fCg8e+rprZsUTax8/Q8JPjelfKPZ3u1y9bmN
         RbeBHbsxkjGVg==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id y10so5990471uao.8
        for <devicetree@vger.kernel.org>; Sun, 03 May 2020 18:21:59 -0700 (PDT)
X-Gm-Message-State: AGi0PubyaXZ+RQivKrS0lpPCsGv20QQCK0X+iOtPRQ7YLCu21fhSprYF
        +gLGpDdHEeVhZq0foGBa5lq7ScPivCzB3GQY2eo=
X-Google-Smtp-Source: APiQypLjKkik/oU0uaF0Sa5oHB/Eq0P7Lq/E4EF2AFVTKCbqfJYAJshSIaa81QHlR9nLAp2HvozgBfKSCEqho6ugbp8=
X-Received: by 2002:ab0:cd:: with SMTP id 71mr9187041uaj.109.1588555318441;
 Sun, 03 May 2020 18:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200430222439.0ae1c4fa9572c8487fca96b6@linaro.org>
In-Reply-To: <20200430222439.0ae1c4fa9572c8487fca96b6@linaro.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 4 May 2020 10:21:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS7U-SxEhsdfAr=ioOP0DGksTWhW1hDVA4AN8a6YG-t-w@mail.gmail.com>
Message-ID: <CAK7LNAS7U-SxEhsdfAr=ioOP0DGksTWhW1hDVA4AN8a6YG-t-w@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] dts: uniphier: Add Akebi96 Board support
To:     Masami Hiramatsu <masami.hiramatsu@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Apr 30, 2020 at 10:24 PM Masami Hiramatsu
<masami.hiramatsu@linaro.org> wrote:
>
> Hello,
>
> Here is the 5th version of the patches to add a devicetree for
> Akebi96 board.
>
> This version removes redundant setting of RGMII, fixes some
> parameters for max3420-udc node and add the address to
> framebuffer node name.
>
> The Akebi96 is a certified 96boards which is based on Socionext
> UniPhier LD20 SoC. Most of the part is similar to LD20 reference
> board, but there are some changes.
>
>   - MAX3421 USB-SPI chip on SPI port3 (for USB gadget port.)
>   - Simple frame buffer with 1080p fixed resolution.
>   - I2S port which is connected to aout1b instead of aout1.
>   - 3 serial ports, only serial3 has CTS/RTS.
>   - No NAND, only eMMC on the board.
>   - OP-TEE installed firmware.
>
> See https://www.96boards.org/product/akebi96/ for details.
>
> Thank you,
>
> ---

Both applied.



> Masami Hiramatsu (2):
>       dt-bindings: arm: Add Akebi96 board support
>       arm64: dts: uniphier: Add support for Akebi96
>
>
>  .../bindings/arm/socionext/uniphier.yaml           |    1
>  arch/arm64/boot/dts/socionext/Makefile             |    1
>  .../boot/dts/socionext/uniphier-ld20-akebi96.dts   |  189 ++++++++++++++++++++
>  3 files changed, 191 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts
>
> --
> Masami Hiramatsu <masami.hiramatsu@linaro.org>
>


-- 
Best Regards
Masahiro Yamada
