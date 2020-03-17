Return-Path: <SRS0=fjOU=5C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0320C3F2CE
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 11:09:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D34C020736
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 11:09:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728578AbgCQLJN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Mar 2020 07:09:13 -0400
Received: from mx.socionext.com ([202.248.49.38]:56511 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726428AbgCQLJN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 17 Mar 2020 07:09:13 -0400
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 17 Mar 2020 20:09:12 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by iyokan-ex.css.socionext.com (Postfix) with ESMTP id 56F3B60057;
        Tue, 17 Mar 2020 20:09:12 +0900 (JST)
Received: from 172.31.9.53 (172.31.9.53) by m-FILTER with ESMTP; Tue, 17 Mar 2020 20:09:12 +0900
Received: from yuzu.css.socionext.com (yuzu [172.31.8.45])
        by iyokan.css.socionext.com (Postfix) with ESMTP id D553040357;
        Tue, 17 Mar 2020 20:09:11 +0900 (JST)
Received: from [10.213.132.48] (unknown [10.213.132.48])
        by yuzu.css.socionext.com (Postfix) with ESMTP id B5B4E120134;
        Tue, 17 Mar 2020 20:09:11 +0900 (JST)
Date:   Tue, 17 Mar 2020 20:09:11 +0900
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 06/10] ARM: dts: uniphier: Add ethernet aliases
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
In-Reply-To: <CAK7LNAR+73FGUC7NAaPM_5uyjccuxDXokmKaY2KJpxqskdyuVg@mail.gmail.com>
References: <1584061096-23686-7-git-send-email-hayashi.kunihiko@socionext.com> <CAK7LNAR+73FGUC7NAaPM_5uyjccuxDXokmKaY2KJpxqskdyuVg@mail.gmail.com>
Message-Id: <20200317200911.9789.4A936039@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Becky! ver. 2.70 [ja]
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 16 Mar 2020 21:31:02 +0900 <masahiroy@kernel.org> wrote:

> On Fri, Mar 13, 2020 at 9:58 AM Kunihiko Hayashi
> <hayashi.kunihiko@socionext.com> wrote:
> >
> > Add an aliases property for ethernet to determine device name assignments.
> 
> 
> There is no call-site of of_alias_get_*() for this device.
> 
> Why don't you describe the reason correctly?

I thought that defining aliases automatically assigned the device name,
but I found the driver needed to manage the aliases.

In case of booting up the kernel from U-boot, the ethernet alias of
the devicetree is referred by U-boot, and mac-address in an aliased
ethernet node inherits that of U-boot.

I'll correctly rewriten the reason next.

Thank you,

---
Best Regards,
Kunihiko Hayashi

