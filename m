Return-Path: <SRS0=ADtQ=6D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C8AC38A29
	for <linux-devicetree@archiver.kernel.org>; Sun, 19 Apr 2020 23:37:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E5FD21D82
	for <linux-devicetree@archiver.kernel.org>; Sun, 19 Apr 2020 23:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587339476;
	bh=aMUkvwJNs+z/YszzNTxWCYyq/+KFAGTZL8L5H5wB620=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=S0yvXUJ2ZEsf51DXwI6ufoBp8ycC7Fv4jdMaD38o315//oSzgPvFnlgKZ5r8BrKYS
	 s/hAMRAaUwwLK5IHcn3Rcr14SrpVFNJ1yHUL1N4PbEjji8jfsX6WMKpykbpgjQ/MGs
	 TP/SYEag0926k1aqEiqFO1+OFChBIL4rcN8A1E1w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgDSXhz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 19 Apr 2020 19:37:55 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:53794 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgDSXhz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 19 Apr 2020 19:37:55 -0400
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 03JNbPqD015952
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 08:37:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 03JNbPqD015952
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587339446;
        bh=dHYGVONabMvO/3fqJjmu1iNx4sX1iSSOhrK7hBoC0d4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1Y/mC5cSjOjqpukIifxbTf4ZOTcc734y27lhe7F2NzM36fZFJNO0D7agMAvuSwpCX
         BFx9GIno81+7F2FSAqXAf5Up7VqMsgzRhQcGMsvK7137nhos01L27ddnUofyD/W+LW
         +zhzEsRN/Tx0+quOwiG4IWfShstp0Qg4ZAIefSe5cveGyeq3FmZkTRNi4CV3wOxnGy
         mW8NfL8/EFEdFZpPw/BxE+GETTz8Xsnmprf5SEhhJe3pGpc2HSR6bFFgkhuk2IKKuw
         1yUDzADU3hJWO6mIex3waXce/qj5s9DzNnoiSr7qXcMjIFZGqyReZBGZ4EtOijTxUj
         jIXNV4pO3KzDg==
X-Nifty-SrcIP: [209.85.222.41]
Received: by mail-ua1-f41.google.com with SMTP id t8so2960077uap.3
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2020 16:37:25 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ07jthx4aonliOq+IyiJhMZ9N+Wssp+fFlA8jsjmZf/xCikoIO
        FitdK26u7YlIyMH1VPPJW7Pymr7/f1viiwlu+AY=
X-Google-Smtp-Source: APiQypL0f0ARsXfF2YkjuYbE9XS4JBo15E5+kATj6zO54fUCVpSM6MMduRAVPmYIV9I9A/D6qXx46hxUksmaysNJl78=
X-Received: by 2002:ab0:7298:: with SMTP id w24mr6091311uao.95.1587339444497;
 Sun, 19 Apr 2020 16:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <158614147708.29424.2884940487411120526.stgit@localhost> <CAA93ih2ineuFYzA_uhGwmzsznDKacEG=7rK1beWsCkrnR0opuA@mail.gmail.com>
In-Reply-To: <CAA93ih2ineuFYzA_uhGwmzsznDKacEG=7rK1beWsCkrnR0opuA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 20 Apr 2020 08:36:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR9tdhqkKft5j59_Z=sJj_wVJBwRysFpShO1HXck7-idw@mail.gmail.com>
Message-ID: <CAK7LNAR9tdhqkKft5j59_Z=sJj_wVJBwRysFpShO1HXck7-idw@mail.gmail.com>
Subject: Re: [PATCH 0/2] dts: uniphier: Add Akebi96 Board support
To:     Masami Hiramatsu <masami.hiramatsu@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hiramatsu-san


On Fri, Apr 17, 2020 at 2:31 PM Masami Hiramatsu
<masami.hiramatsu@linaro.org> wrote:
>
> Hello Yamada-san,
>
> Could you review this series?


Where did you post your series?

I see this ping mail in
https://lore.kernel.org/linux-arm-kernel/?q=3DAkebi96

But, I do not see the original post.

Could you point me to the patchwork URL, please?

Once I find the patch location, it is easy to handle.
Since I do not have this board, I will just queue it up with no evaluation.

Thanks.



>
> Thank you,
>
> 2020=E5=B9=B44=E6=9C=886=E6=97=A5(=E6=9C=88) 11:52 Masami Hiramatsu <masa=
mi.hiramatsu@linaro.org>:
> >
> > Hello,
> >
> > Here is a couple of patches to add a devicetree for Akebi96 board.
> > The Akebi96 is a certified 96boards which is based on Socionext
> > UniPhier LD20 SoC. Most of the part is similar to LD20 reference
> > board, but there are some changes.
> >
> >   - MAX3421 USB-SPI chip on SPI port3 (for USB gadget port.)
> >   - Simple frame buffer with 1080p fixed resolution.
> >   - I2S port which is connected to aout1b instead of aout1.
> >   - 3 serial ports, only serial3 has CTS/RTS.
> >   - No NAND, only eMMC on the board.
> >   - OP-TEE support.
> >
> > See https://www.96boards.org/product/akebi96/ for details.
> >
> > Thank you,
> >
> > ---
> >
> > Masami Hiramatsu (2):
> >       dt-bindings: arm: Add Akebi96 board support
> >       arm64: dts: uniphier: Add support for Akebi96
> >
> >
> >  .../bindings/arm/socionext/uniphier.yaml           |    1
> >  arch/arm64/boot/dts/socionext/Makefile             |    1
> >  .../boot/dts/socionext/uniphier-ld20-akebi96.dts   |  200 ++++++++++++=
++++++++
> >  arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi   |    2
> >  4 files changed, 203 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96=
.dts
> >
> > --
> > Masami Hiramatsu <masami.hiramatsu@linaro.org>
> >
>
>
> --
> Masami Hiramatsu



--
Best Regards
Masahiro Yamada
