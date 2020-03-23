Return-Path: <SRS0=2gCm=5I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D06CFC1975A
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 02:26:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A45CA2074D
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 02:26:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgCWC0U (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Mar 2020 22:26:20 -0400
Received: from mx.socionext.com ([202.248.49.38]:58450 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726946AbgCWC0T (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 22 Mar 2020 22:26:19 -0400
Received: from unknown (HELO kinkan-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 23 Mar 2020 11:26:17 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by kinkan-ex.css.socionext.com (Postfix) with ESMTP id C16FC180BCB;
        Mon, 23 Mar 2020 11:26:17 +0900 (JST)
Received: from 172.31.9.53 (172.31.9.53) by m-FILTER with ESMTP; Mon, 23 Mar 2020 11:26:17 +0900
Received: from yuzu.css.socionext.com (yuzu [172.31.8.45])
        by iyokan.css.socionext.com (Postfix) with ESMTP id 4C5014034F;
        Mon, 23 Mar 2020 11:26:17 +0900 (JST)
Received: from [10.213.132.48] (unknown [10.213.132.48])
        by yuzu.css.socionext.com (Postfix) with ESMTP id 2B05112013D;
        Mon, 23 Mar 2020 11:26:17 +0900 (JST)
Date:   Mon, 23 Mar 2020 11:26:17 +0900
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: dma: uniphier-xdmac: Remove extension register region description
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
In-Reply-To: <CAK7LNASmZRszPB-o4pzeu0aQM4_cQBkRxwFM2T4_onHA4-1r8w@mail.gmail.com>
References: <1584604252-13172-2-git-send-email-hayashi.kunihiko@socionext.com> <CAK7LNASmZRszPB-o4pzeu0aQM4_cQBkRxwFM2T4_onHA4-1r8w@mail.gmail.com>
Message-Id: <20200323112616.E512.4A936039@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Becky! ver. 2.70 [ja]
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 19 Mar 2020 23:18:29 +0900 <masahiroy@kernel.org> wrote:

> On Thu, Mar 19, 2020 at 4:51 PM Kunihiko Hayashi
> <hayashi.kunihiko@socionext.com> wrote:
> >
> > The address of the extension register region in example is incorrect,
> > however, this extension register region is optional
> 
> 
> On which SoC is it optional?
> 
> In your previous DT submission, every reg was,
> like this:
> 
> reg = <0x5fc10000 0x1000>, <0x5fc20000 0x800>;
> 
> 
> 
> and you meant
> 
> reg = <0x5fc10000 0x1000>, <0x5fc12000 0x800>;
> 
> ?

Yes. 'Optional' might not be appropriate because all SoCs has the region.

> > and isn't currently
> > referred from the driver, so the description of the region should be
> > suppressed until referred by the driver.
> 
> This sounds like you plan to get it back
> as you extend the driver.

Right, however, it isn't desiable that the description of the region is
changed by extending the driver.

> I checked the datasheet. This controller has more registers,
> so you split the reg into small chunks, the final form will look scary:
> 
> reg = <0x5fc10000 0x1000>, <0x5fc12000 0x800>,
>       <0x5fc14000 0x100>,  <0x5fc15000 0x100>;
> 
> 
> My question is why you did not use a single reg tuple
> that covers the whole registers.
> 
> Is any other hardware reg interleaved in between?

No, there is no other hardware reg between each region.

Surely it seems pointless to divide all tuples individually.
I'll rewrite it to cover entire xdmac reg region.

Thank you,

---
Best Regards,
Kunihiko Hayashi

