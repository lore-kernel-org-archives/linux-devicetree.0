Return-Path: <SRS0=uzRV=5Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FC5C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 10:29:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F4A620781
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 10:29:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729955AbgCaK27 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 31 Mar 2020 06:28:59 -0400
Received: from mx.socionext.com ([202.248.49.38]:44524 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729925AbgCaK27 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 31 Mar 2020 06:28:59 -0400
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 31 Mar 2020 19:28:57 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by iyokan-ex.css.socionext.com (Postfix) with ESMTP id C3E3F60057;
        Tue, 31 Mar 2020 19:28:57 +0900 (JST)
Received: from 172.31.9.53 (172.31.9.53) by m-FILTER with ESMTP; Tue, 31 Mar 2020 19:28:57 +0900
Received: from yuzu.css.socionext.com (yuzu [172.31.8.45])
        by iyokan.css.socionext.com (Postfix) with ESMTP id 6A380403AF;
        Tue, 31 Mar 2020 19:28:57 +0900 (JST)
Received: from [10.213.132.48] (unknown [10.213.132.48])
        by yuzu.css.socionext.com (Postfix) with ESMTP id 481BA12013D;
        Tue, 31 Mar 2020 19:28:57 +0900 (JST)
Date:   Tue, 31 Mar 2020 19:28:57 +0900
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: dma: uniphier-xdmac: Consolidate register region description
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
In-Reply-To: <CAK7LNARyRcxR0nhPWo9mY=tahGtwY2E8A50X_Tv4VhFfM-WLGQ@mail.gmail.com>
References: <1584955970-8162-2-git-send-email-hayashi.kunihiko@socionext.com> <CAK7LNARyRcxR0nhPWo9mY=tahGtwY2E8A50X_Tv4VhFfM-WLGQ@mail.gmail.com>
Message-Id: <20200331192856.1B77.4A936039@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Becky! ver. 2.70 [ja]
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 30 Mar 2020 19:20:35 +0900 <yamada.masahiro@socionext.com> wrote:

> On Mon, Mar 23, 2020 at 6:33 PM Kunihiko Hayashi
> <hayashi.kunihiko@socionext.com> wrote:
> >
> > The extension register region isn't currently referred from the driver, so
> > this consolidates the extension register region description into the base
> > register region, and spreads the region size in example.
> 
> 
> You should not say this in the commit log.
> 
> The DT binding is hardware description.
> Whether it is used or not in the driver is not a primary reason.

I see. I forgot that this also applies to commit logs.

>
> I recommend you to read this:
> 
> 
> Documentation/devicetree/bindings/writing-bindings.txt:
> 
> - DON'T refer to Linux or "device driver" in bindings. Bindings should be
>   based on what the hardware has, not what an OS and driver currently support.

Thanks for your suggestion.

> 
> > Fixes: b9fb56b6ba8a ("dt-bindings: dmaengine: Add UniPhier external DMA controller bindings")
> > Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> > ---
> >  Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml b/Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml
> > index 86cfb59..830cd88 100644
> > --- a/Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml
> > +++ b/Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml
> > @@ -23,8 +23,7 @@ properties:
> >
> >    reg:
> >      items:
> > -      - description: XDMAC base register region (offset and length)
> > -      - description: XDMAC extension register region (offset and length)
> > +      - description: XDMAC register region (offset and length)
> 
> Now that the reg is a single tuple,
> the "items" is unneeded.

Okay, I'll notice it.

> 
> >    interrupts:
> >      maxItems: 1
> > @@ -54,7 +53,7 @@ examples:
> >    - |
> >      xdmac: dma-controller@5fc10000 {
> >          compatible = "socionext,uniphier-xdmac";
> > -        reg = <0x5fc10000 0x1000>, <0x5fc20000 0x800>;
> > +        reg = <0x5fc10000 0x5100>;
> 
> 
> Checking the datasheet (LD20), this seems still wrong.
> 
> The last register is XDMAID3 : 0x5fc1520c
> 
> So, reg = <0x5fc10000 0x5300>;

Hmm, You're right.
I missed the information somewhere.

> 
> I attached a patch, which I think more correct.
> Please check it, and I will send it to the correct ML.

I checked it. This looks good to me and thanks for your help.
I'll fix the remaining patches next.

Thank you,

---
Best Regards,
Kunihiko Hayashi

