Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA54C54FCF
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 11:42:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 979AC214AF
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 11:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587382979;
	bh=uiGDNn21ZzO0ngRUvSHDTG9522PC8OVG9j/n2nD43Vo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=jU4J6VdW0w2itUSyq0Tf8h+BhK0ky66VtEwVFIiptPT4r7mWgRlMfzLDjKxW9Y3gP
	 MbN5jB11lmrghSGNsA9na+kCHq9roQyCfH7rD/abXtHvfSnKxSx2hVViFYWWYhjb2y
	 bmMnJk3Diyopslo4FYdNgDWVxsrcsAfsalxvqF8U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgDTLm7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 07:42:59 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:41597 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgDTLm6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Apr 2020 07:42:58 -0400
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 03KBgUqa024901
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 20:42:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 03KBgUqa024901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587382951;
        bh=wpHlG59NrpmylHg++7oVcwvUegStYdRpAQFZPV/R1iM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZKqHLe2wK+l0LBzCFG7uF32lXn42CntUbr01uWqBu+/+UFqF2DIPeRfWw1ZVI7uK7
         D7rTf32mhAAjeib/wZsGwM7a2Zk2YkxdcRDPjm0FTChe8BQxq6pJEfMFqB78OmatkO
         YtBfWhxhUbtRvOL+WADozp7ulFwSDBEczdHl6khQ1ENZp3ZNdeYh6mN8TvrSfsYaWS
         y6kKPNtCTLD6OIXHBZ5ROBT8Ddg5DVh5+Ntrg4DtcoMcwhxfnFGXTUwfPrvzd2iYpA
         GMFm/gfHiozC3aP7I2bFdLm2kaXFPEAwcvJcsWXLyjV9gLASmXovP7SRZNGY75hX62
         ML22gTZOa8rVQ==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id y185so5723125vsy.8
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 04:42:31 -0700 (PDT)
X-Gm-Message-State: AGi0Pub5vrULz99H0Xwam/dj2FQlhS4eCGXtR9irhRtUBjyH0aEXxoTE
        aFZRB6SNYdejSgjIKFy2eYibTFB/dKNAbi+mCgE=
X-Google-Smtp-Source: APiQypLGcXw1QZowAFEn8/HXUY3sqwFcCNVgXq9MCi1nmyDCjNpOdp6pgxeiM2T89p0QI/GbM8UTSZ+u4xsrrcq76iE=
X-Received: by 2002:a67:e94d:: with SMTP id p13mr8172980vso.215.1587382949616;
 Mon, 20 Apr 2020 04:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <158737719165.27947.6617937231903079086.stgit@localhost>
 <20200420190749.b508c7e6d60a8203360178ec@linaro.org> <CAK7LNAQtTPLdKN8cz842gvoS36GVQvk2ztahGp8XWoW3C8BzQg@mail.gmail.com>
In-Reply-To: <CAK7LNAQtTPLdKN8cz842gvoS36GVQvk2ztahGp8XWoW3C8BzQg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 20 Apr 2020 20:41:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNATJy=J-GLJL7O5oaMWk5C46ATmxL6FgorNwn+541=HeFg@mail.gmail.com>
Message-ID: <CAK7LNATJy=J-GLJL7O5oaMWk5C46ATmxL6FgorNwn+541=HeFg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: uniphier: Add support for Akebi96
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

Hiramatsu-san,

On Mon, Apr 20, 2020 at 8:15 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Mon, Apr 20, 2020 at 7:08 PM Masami Hiramatsu
> <masami.hiramatsu@linaro.org> wrote:
> >
> > Add the device tree for Akebi96. Akebi96 is a 96boards certified
> > development board based on UniPhir LD20.
> > ( https://www.96boards.org/product/akebi96/ )
> >
> > This board has;
> > - MAX3421 USB-SPI chip on SPI port3 (for USB gadget port)
> > - Simple frame buffer with 1080p fixed resolution.
> > - I2S port which is connected to aout1b instead of aout1.
> > - 3 serial ports, only serial3 has CTS/RTS.
> > - No NAND, only eMMC on the board.
> > - OP-TEE support.
>
>



> Lastly, is the pin-setting "aout1", "aout1b" correct ?


I am not sure if I understood this code correctly, but
there are two ports "aout1" and "aout1b"
outputting the same audio, is this correct?



-- 
Best Regards
Masahiro Yamada
