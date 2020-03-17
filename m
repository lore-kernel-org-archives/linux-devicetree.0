Return-Path: <SRS0=fjOU=5C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427C7C18E5B
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 11:09:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2154320719
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 11:09:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728938AbgCQLJR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Mar 2020 07:09:17 -0400
Received: from mx.socionext.com ([202.248.49.38]:56513 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728198AbgCQLJQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 17 Mar 2020 07:09:16 -0400
Received: from unknown (HELO kinkan-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 17 Mar 2020 20:09:15 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by kinkan-ex.css.socionext.com (Postfix) with ESMTP id F129C18005C;
        Tue, 17 Mar 2020 20:09:15 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 17 Mar 2020 20:09:15 +0900
Received: from yuzu.css.socionext.com (yuzu [172.31.8.45])
        by kinkan.css.socionext.com (Postfix) with ESMTP id BE23B1A0E67;
        Tue, 17 Mar 2020 20:09:15 +0900 (JST)
Received: from [10.213.132.48] (unknown [10.213.132.48])
        by yuzu.css.socionext.com (Postfix) with ESMTP id 5A436120134;
        Tue, 17 Mar 2020 20:09:15 +0900 (JST)
Date:   Tue, 17 Mar 2020 20:09:15 +0900
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 10/10] arm64: dts: uniphier: Stabilize Ethernet RGMII mode of LD20 global and PXs3 ref board
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
In-Reply-To: <CAK7LNAQ98kUHQS33jQL+Kq5E48H75yvYk_qsWxT9ubrP-yRCdg@mail.gmail.com>
References: <1584061096-23686-11-git-send-email-hayashi.kunihiko@socionext.com> <CAK7LNAQ98kUHQS33jQL+Kq5E48H75yvYk_qsWxT9ubrP-yRCdg@mail.gmail.com>
Message-Id: <20200317200914.978A.4A936039@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Becky! ver. 2.70 [ja]
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 16 Mar 2020 21:55:09 +0900 <masahiroy@kernel.org> wrote:

> On Fri, Mar 13, 2020 at 9:58 AM Kunihiko Hayashi
> <hayashi.kunihiko@socionext.com> wrote:
> >
> > The RGMII PHY needs to change drive-strength properties of the Ethernet
> > Tx pins to stabilize the PHY.
> >
> > The devicetree for LD20 global board specifies RMII PHY in the ethernet
> > node as default, however, there is also another board that has RGMII PHY.
> > The devicetree for the board doesn't exist, so the users should change
> > the ethernet properties by outside way.
> 
> Probably, users should change pinctrl_ether_rgmii
> by the same means.

I think that it's reasonable to have a devicetree for another board with
RGMII PHY.

> The change to uniphier-pxs3-ref.dts looks OK to me.

I'll split this patch for uniphier-pxs3-ref.dts.

Thank you,

---
Best Regards,
Kunihiko Hayashi

