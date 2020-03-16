Return-Path: <SRS0=Nmyu=5B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE10BC0044D
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 10:43:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6EB9B20663
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 10:43:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730661AbgCPKnd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Mar 2020 06:43:33 -0400
Received: from mx.socionext.com ([202.248.49.38]:42881 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730582AbgCPKnc (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 16 Mar 2020 06:43:32 -0400
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 16 Mar 2020 19:43:31 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by iyokan-ex.css.socionext.com (Postfix) with ESMTP id 5E0A76002C;
        Mon, 16 Mar 2020 19:43:31 +0900 (JST)
Received: from 172.31.9.53 (172.31.9.53) by m-FILTER with ESMTP; Mon, 16 Mar 2020 19:43:31 +0900
Received: from yuzu.css.socionext.com (yuzu [172.31.8.45])
        by iyokan.css.socionext.com (Postfix) with ESMTP id C95E540350;
        Mon, 16 Mar 2020 19:43:30 +0900 (JST)
Received: from [10.213.132.48] (unknown [10.213.132.48])
        by yuzu.css.socionext.com (Postfix) with ESMTP id A467A12013D;
        Mon, 16 Mar 2020 19:43:30 +0900 (JST)
Date:   Mon, 16 Mar 2020 19:43:30 +0900
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 01/10] ARM: dts: uniphier: Add XDMAC node
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
In-Reply-To: <CAK7LNASCOhZ5BMWWCA1zKep-sXra1pBBTxjsDp816k8Ph1m1Pw@mail.gmail.com>
References: <1584061096-23686-2-git-send-email-hayashi.kunihiko@socionext.com> <CAK7LNASCOhZ5BMWWCA1zKep-sXra1pBBTxjsDp816k8Ph1m1Pw@mail.gmail.com>
Message-Id: <20200316194330.B482.4A936039@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Becky! ver. 2.70 [ja]
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, 14 Mar 2020 11:14:09 +0900 <yamada.masahiro@socionext.com> wrote:

> On Fri, Mar 13, 2020 at 9:58 AM Kunihiko Hayashi
> <hayashi.kunihiko@socionext.com> wrote:
> >
> > Add external DMA controller support implemented in UniPhier SoCs.
> > This supports for Pro4, Pro5 and PXs2.
> >
> > Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> > ---
> >  arch/arm/boot/dts/uniphier-pro4.dtsi | 8 ++++++++
> >  arch/arm/boot/dts/uniphier-pro5.dtsi | 8 ++++++++
> >  arch/arm/boot/dts/uniphier-pxs2.dtsi | 8 ++++++++
> >  3 files changed, 24 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/uniphier-pro4.dtsi b/arch/arm/boot/dts/uniphier-pro4.dtsi
> > index 2ec04d7..a1bfe0f 100644
> > --- a/arch/arm/boot/dts/uniphier-pro4.dtsi
> > +++ b/arch/arm/boot/dts/uniphier-pro4.dtsi
> > @@ -426,6 +426,14 @@
> >                         };
> >                 };
> >
> > +               xdmac: dma-controller@5fc10000 {
> > +                       compatible = "socionext,uniphier-xdmac";
> > +                       reg = <0x5fc10000 0x1000>, <0x5fc20000 0x800>;
> 
> 
> 
> This is odd.
> <0x5fc20000 0x800> causes reg overwrap with
> aidet@5fc20000 below.

Thank you for pointing out.

Indeed, the address is wrong. I'll fix it.
And I'll also fix the example of dt-bindings.

Thank you,

---
Best Regards,
Kunihiko Hayashi

