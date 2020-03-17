Return-Path: <SRS0=fjOU=5C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B64C10F29
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 11:16:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 174B6205ED
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 11:16:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728189AbgCQLJH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Mar 2020 07:09:07 -0400
Received: from mx.socionext.com ([202.248.49.38]:56506 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728902AbgCQLJE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 17 Mar 2020 07:09:04 -0400
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 17 Mar 2020 20:09:02 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by iyokan-ex.css.socionext.com (Postfix) with ESMTP id 1835D60057;
        Tue, 17 Mar 2020 20:09:03 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 17 Mar 2020 20:09:03 +0900
Received: from yuzu.css.socionext.com (yuzu [172.31.8.45])
        by kinkan.css.socionext.com (Postfix) with ESMTP id CEF851A0E67;
        Tue, 17 Mar 2020 20:09:02 +0900 (JST)
Received: from [10.213.132.48] (unknown [10.213.132.48])
        by yuzu.css.socionext.com (Postfix) with ESMTP id AC3E6120134;
        Tue, 17 Mar 2020 20:09:02 +0900 (JST)
Date:   Tue, 17 Mar 2020 20:09:02 +0900
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 01/10] ARM: dts: uniphier: Add XDMAC node
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
In-Reply-To: <CAK7LNATmxhLn6fg8+5RAKcw+_-75SDN0dG=E1e8H2yrYU3p5Eg@mail.gmail.com>
References: <20200316194330.B482.4A936039@socionext.com> <CAK7LNATmxhLn6fg8+5RAKcw+_-75SDN0dG=E1e8H2yrYU3p5Eg@mail.gmail.com>
Message-Id: <20200317200902.9788.4A936039@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Becky! ver. 2.70 [ja]
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 16 Mar 2020 21:06:40 +0900 <masahiroy@kernel.org> wrote:

> On Mon, Mar 16, 2020 at 7:43 PM Kunihiko Hayashi
> <hayashi.kunihiko@socionext.com> wrote:
> >
> > On Sat, 14 Mar 2020 11:14:09 +0900 <yamada.masahiro@socionext.com> wrote:
> >
> > > On Fri, Mar 13, 2020 at 9:58 AM Kunihiko Hayashi
> > > <hayashi.kunihiko@socionext.com> wrote:
> > > >
> > > > Add external DMA controller support implemented in UniPhier SoCs.
> > > > This supports for Pro4, Pro5 and PXs2.
> > > >
> > > > Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> > > > ---
> > > >  arch/arm/boot/dts/uniphier-pro4.dtsi | 8 ++++++++
> > > >  arch/arm/boot/dts/uniphier-pro5.dtsi | 8 ++++++++
> > > >  arch/arm/boot/dts/uniphier-pxs2.dtsi | 8 ++++++++
> > > >  3 files changed, 24 insertions(+)
> > > >
> > > > diff --git a/arch/arm/boot/dts/uniphier-pro4.dtsi b/arch/arm/boot/dts/uniphier-pro4.dtsi
> > > > index 2ec04d7..a1bfe0f 100644
> > > > --- a/arch/arm/boot/dts/uniphier-pro4.dtsi
> > > > +++ b/arch/arm/boot/dts/uniphier-pro4.dtsi
> > > > @@ -426,6 +426,14 @@
> > > >                         };
> > > >                 };
> > > >
> > > > +               xdmac: dma-controller@5fc10000 {
> > > > +                       compatible = "socionext,uniphier-xdmac";
> > > > +                       reg = <0x5fc10000 0x1000>, <0x5fc20000 0x800>;
> > >
> > >
> > >
> > > This is odd.
> > > <0x5fc20000 0x800> causes reg overwrap with
> > > aidet@5fc20000 below.
> >
> > Thank you for pointing out.
> >
> > Indeed, the address is wrong. I'll fix it.
> > And I'll also fix the example of dt-bindings.
> >
> > Thank you,
> 
> 
> 
> You did not notice the over-wrap
> because the second region is not used
> from the driver.
> 
> Why did you define the unused region?

There is an extention register area for xdmac, however, the current driver
doesn't have any features using this area.

The description of the area will be suppressed until some features that uses
the area are implemented.

Thank you,

---
Best Regards,
Kunihiko Hayashi

