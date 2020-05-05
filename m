Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AE2C47247
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 13:31:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4834220746
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 13:31:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GpDV33m9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbgEENbW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 09:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729051AbgEENbR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 May 2020 09:31:17 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2294BC061A0F
        for <devicetree@vger.kernel.org>; Tue,  5 May 2020 06:31:17 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b2so1618257ljp.4
        for <devicetree@vger.kernel.org>; Tue, 05 May 2020 06:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iyIfZkYPS9M4auvW6h31t2pDFbAPlltvGdvUpf8+y6s=;
        b=GpDV33m9OSNcuyhoVsY1DzN1WJVXwBvsQzGImWQKbBl7G1Ok/h0FWE93M/g+o34hEz
         jGRNIKP6e4YcXDEFzN49pEhwGTIWlbKs7Pjd7mXyWGqcz8LfpdZlONhsq5GlDqAl7/K2
         H1hSjo2nf99o07pSf2OdvrzDJ09hDQOT1pLABRPzfSWSf4wG1rvC4fIydLeWX+Chd7t6
         kAqAkHf3IbR5UvQ9jmYAc16dUZhUjw7VVUna36AjLjqHkz1HUnInDXBKHSF9l0THkL17
         It99itvpb0xtTT69BVrjANEnLBeeVm2Al/+W4ulyRWPBC+V7N1Em6QrpNMmC4eEmOg5M
         ytXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iyIfZkYPS9M4auvW6h31t2pDFbAPlltvGdvUpf8+y6s=;
        b=ts7hmfs22tQQiJ5Ms6t+JBPk8kZ6BaaCPeNxRWE+Hb0Xut0KEEXSA/2eFPKarxHGTW
         DDtVXPDp4hlFkQaguzbCKmcA4NmNR3tvYsyrx9MwJ7rExWytmGiYX9FFmmg7xGgn8xTc
         sjxbFUSGVe/6mFRpvQAd9FwaUjANkKOcO1kJLGu/8D9DdYMcrfn0AqyjLh5fJ0bOJ0Xu
         BALbtbbpk9kwQYfR5qkhf42k05Y8I2Yz7V7Hxgg5ivxl3UWHG67KjdAf6NtkdBX510/d
         uiIj+mHS/OzpI5M9pW6iWMnhjkWvqpdhdFwB9zv7Gk2ZU0RKowY+sd4FclMO9bv2nV+5
         ET1g==
X-Gm-Message-State: AGi0PubCqxMbSZlS9A7B/EVmGY0yFU+U9oHQff8a/EWSRrRe69rEKVj/
        6Zo5RMWiKUfr4B1FjsmJd1p4OSLf7IzAJocd2HCuqQ==
X-Google-Smtp-Source: APiQypL5A7EGS952Im/T/fW2Ho6QLjbkrTeTEEXR6SQpUkH9EnSEIqtWgBh8X7krtW1GL1uzbdDUxxhdJV3oDK7Fjjo=
X-Received: by 2002:a05:651c:107a:: with SMTP id y26mr1903487ljm.80.1588685475521;
 Tue, 05 May 2020 06:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200501205011.14899-1-grygorii.strashko@ti.com>
 <20200501205011.14899-4-grygorii.strashko@ti.com> <CADYN=9L+RtruRYKah0Bomh7UaPGQ==N9trd0ZoVQ3GTc-VY8Dg@mail.gmail.com>
 <1bf51157-9fee-1948-f9ff-116799d12731@ti.com> <CADYN=9LfqLLmKNHPfXEiQbaX8ELF78BL-vWUcX-VP3aQ86csNg@mail.gmail.com>
 <CADYN=9LDCE2sQca12D4ow3BkaxXi1_bnc4Apu7pP4vnA=5AOKA@mail.gmail.com> <5f338763-b35b-e2b4-7f15-df3a5bcbb799@ti.com>
In-Reply-To: <5f338763-b35b-e2b4-7f15-df3a5bcbb799@ti.com>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Tue, 5 May 2020 15:31:04 +0200
Message-ID: <CADYN=9Kdoc5WRHMpseFAXpL1wQymUGnSHfEU0b-i2Uz-GShmCA@mail.gmail.com>
Subject: Re: [PATCH net-next 3/7] net: ethernet: ti: am65-cpsw-nuss: enable
 packet timestamping support
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Richard Cochran <richardcochran@gmail.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Networking <netdev@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Clay McClure <clay@daemons.net>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 5 May 2020 at 14:20, Grygorii Strashko <grygorii.strashko@ti.com> wrote:
>
> Hi Anders,

Hi Grygorii,

>
> On 05/05/2020 14:59, Anders Roxell wrote:
> > On Tue, 5 May 2020 at 13:16, Anders Roxell <anders.roxell@linaro.org> wrote:
> >> On Tue, 5 May 2020 at 13:05, Grygorii Strashko <grygorii.strashko@ti.com> wrote:
> >>> On 05/05/2020 13:17, Anders Roxell wrote:
> >>>> On Fri, 1 May 2020 at 22:50, Grygorii Strashko <grygorii.strashko@ti.com> wrote:
> >>>>>
> >>>>> The MCU CPSW Common Platform Time Sync (CPTS) provides possibility to
> >>>>> timestamp TX PTP packets and all RX packets.
> >>>>>
> >>>>> This enables corresponding support in TI AM65x/J721E MCU CPSW driver.
> >>>>>
> >>>>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> >>>>> ---
> >>>>>    drivers/net/ethernet/ti/Kconfig             |   1 +
> >>>>>    drivers/net/ethernet/ti/am65-cpsw-ethtool.c |  24 ++-
> >>>>>    drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 172 ++++++++++++++++++++
> >>>>>    drivers/net/ethernet/ti/am65-cpsw-nuss.h    |   6 +-
> >>>>>    4 files changed, 201 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/net/ethernet/ti/Kconfig b/drivers/net/ethernet/ti/Kconfig
> >>>>> index 1f4e5b6dc686..2c7bd1ccaaec 100644
> >>>>> --- a/drivers/net/ethernet/ti/Kconfig
> >>>>> +++ b/drivers/net/ethernet/ti/Kconfig
> >>>>> @@ -100,6 +100,7 @@ config TI_K3_AM65_CPSW_NUSS
> >>>>>           depends on ARCH_K3 && OF && TI_K3_UDMA_GLUE_LAYER
> >>>>>           select TI_DAVINCI_MDIO
> >>>>>           imply PHY_TI_GMII_SEL
> >>>>> +       imply TI_AM65_CPTS
> >>>>
> >>>> Should this be TI_K3_AM65_CPTS ?
> >
> > instead of 'imply TI_K3_AM65_CPTS' don't you want to do this:
> > 'depends on TI_K3_AM65_CPTS || !TI_K3_AM65_CPTS'
> >
> >
>
> Right, I'll try. It seems your defconfig is produced by randconfig as
> I can't get broken cfg TI_AM65_CPTS=m and TI_K3_AM65_CPSW_NUSS=y
> with neither one below:
>
>   make ARCH=arm64 O=k3-arm64 defconfig
>   make ARCH=arm64 O=k3-arm64 allnoconfig
>   make ARCH=arm64 O=k3-arm64 allyesconfig
>   make ARCH=arm64 O=k3-arm64 allmodconfig
>   make ARCH=arm64 O=k3-arm64 alldefconfig
>   make ARCH=arm64 O=k3-arm64 yes2modconfig
>   make ARCH=arm64 O=k3-arm64 mod2yesconfig

I'm so sorry, I forgot to tell you that I do my allmodconfig like this:

make ARCH=arm64 KCONFIG_ALLCONFIG=arch/arm64/configs/defconfig
O=k3-arm64 allmodconfig

Then I'm sure I should get a bootable kernel since that uses the
defconfig as a base...

Cheers,
Anders

>
> Related legacy TI CPTS threads:
>   https://lkml.org/lkml/2020/5/2/344
>   https://lkml.org/lkml/2020/5/1/1348
>
> I'd try summarize goal
>   TI_K3_AM65_CPSW_NUSS  TI_AM65_CPTS
>   Y                     Y/N
>   M                     Y/M/N
>   N                     Y/M/N
>
>
> --
> Best regards,
> grygorii
