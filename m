Return-Path: <SRS0=Nmyu=5B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F84C0044D
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 12:55:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B33020658
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 12:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584363353;
	bh=2HQwa7nwNFrEoeIhVSQz+z9hPaegOb5WhBxknPBYxLU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=ne2eI+/FxW6fJsRXiE2bF5N/enLfN9WkRfNtA5bM2T82HM0r3u3D+C0ejNzXnUviD
	 8uhjtDUoLCsgW5Rt+gsASQRtI3yidSdIdLt/HjlgJDkijJLwShCAOiNkGytgkbzyjy
	 iQEMiGQtggEJYAikjDr4Ua/R79DoB7o1RDksk1EE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731063AbgCPMzw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Mar 2020 08:55:52 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:34102 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731056AbgCPMzw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Mar 2020 08:55:52 -0400
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 02GCtj17010775
        for <devicetree@vger.kernel.org>; Mon, 16 Mar 2020 21:55:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 02GCtj17010775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1584363346;
        bh=2HQwa7nwNFrEoeIhVSQz+z9hPaegOb5WhBxknPBYxLU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=No96Wbyqqkf3oxZoxUKEsFANRPMHct/0RSVDnoVy4Xc+6L9nPItIhOFo9xAeMD47h
         utrxewZ6toi37TMD2rqdmzUu1QXTMWaXW2xxLGBNy3fXINYD+KAd3yAhGJsBlh6snB
         CAhi7nQTwcdWrnHr54PgxPd149VDmOkYVQto6ruTiU9mYOVKEJBU4ws+ZWtmoflzsZ
         kRca3oJRmcC6F6wCQ4Dvon34Su0Kv2Vm14x3lu8i1LLmTIbJTTfuVec/Q53Shj2yMO
         4dCwtH67oGQLY4/fdztCBwBDYHTVvVWpBOP2apIqT2OQE96DVD4bi3x1F4xHpCaIKO
         5kyCwUpSN/pGQ==
X-Nifty-SrcIP: [209.85.222.49]
Received: by mail-ua1-f49.google.com with SMTP id a33so6439713uad.11
        for <devicetree@vger.kernel.org>; Mon, 16 Mar 2020 05:55:46 -0700 (PDT)
X-Gm-Message-State: ANhLgQ34bv/ZcBH3qQW8ZQav/4Ii/k7UnNVaVJ1h0tXsWrtMQAEpybx6
        zQp8AuZzqTWNQmvWvy5WA9EpfL4XKToZJ3d3RqY=
X-Google-Smtp-Source: ADFU+vu3J2cRyDb6ek6J1P/y4nL1obn2Se7a010pRaJsc0IwGE/IEI6eKiVqsyEA+CwYoVvWuiwVJorthFmddZ79YEE=
X-Received: by 2002:a9f:28c5:: with SMTP id d63mr8234963uad.25.1584363345215;
 Mon, 16 Mar 2020 05:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <1584061096-23686-1-git-send-email-hayashi.kunihiko@socionext.com> <1584061096-23686-11-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1584061096-23686-11-git-send-email-hayashi.kunihiko@socionext.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 16 Mar 2020 21:55:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ98kUHQS33jQL+Kq5E48H75yvYk_qsWxT9ubrP-yRCdg@mail.gmail.com>
Message-ID: <CAK7LNAQ98kUHQS33jQL+Kq5E48H75yvYk_qsWxT9ubrP-yRCdg@mail.gmail.com>
Subject: Re: [PATCH 10/10] arm64: dts: uniphier: Stabilize Ethernet RGMII mode
 of LD20 global and PXs3 ref board
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Mar 13, 2020 at 9:58 AM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> The RGMII PHY needs to change drive-strength properties of the Ethernet
> Tx pins to stabilize the PHY.
>
> The devicetree for LD20 global board specifies RMII PHY in the ethernet
> node as default, however, there is also another board that has RGMII PHY.
> The devicetree for the board doesn't exist, so the users should change
> the ethernet properties by outside way.

Probably, users should change pinctrl_ether_rgmii
by the same means.


The change to uniphier-pxs3-ref.dts looks OK to me.

--
Best Regards

Masahiro Yamada
