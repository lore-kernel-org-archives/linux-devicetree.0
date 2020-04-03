Return-Path: <SRS0=qh1l=5T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C567C43331
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 11:07:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 08E1D2073B
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 11:07:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbgDCLHP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Apr 2020 07:07:15 -0400
Received: from mx.socionext.com ([202.248.49.38]:25716 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727792AbgDCLHP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 3 Apr 2020 07:07:15 -0400
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 03 Apr 2020 20:07:13 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by iyokan-ex.css.socionext.com (Postfix) with ESMTP id 966C960057;
        Fri,  3 Apr 2020 20:07:13 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Fri, 3 Apr 2020 20:07:13 +0900
Received: from yuzu.css.socionext.com (yuzu [172.31.8.45])
        by kinkan.css.socionext.com (Postfix) with ESMTP id 4F8381A0E67;
        Fri,  3 Apr 2020 20:07:13 +0900 (JST)
Received: from [10.213.132.48] (unknown [10.213.132.48])
        by yuzu.css.socionext.com (Postfix) with ESMTP id 2DC7112013D;
        Fri,  3 Apr 2020 20:07:13 +0900 (JST)
Date:   Fri, 03 Apr 2020 20:07:13 +0900
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 0/5] Add devicetree features and fixes for UniPhier SoCs
Cc:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
In-Reply-To: <1585878187-8131-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1585878187-8131-1-git-send-email-hayashi.kunihiko@socionext.com>
Message-Id: <20200403200712.7A13.4A936039@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Becky! ver. 2.70 [ja]
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Sorry for the mistake about the following changes because it was confused
with the other mail. Please wait for xdmac node patches to be reviewed until
the dt-bindings fix patch is available.

Thank you,

On Fri, 3 Apr 2020 10:43:02 +0900 <hayashi.kunihiko@socionext.com> wrote:

> This series adds new features that includes XDMAC for each SoC, ethernet
> aliases to inherit MAC address from u-boot, and stabilization for ethernet
> on PXs3 ref board.
> 
> Changes since v3:
> - dt-bindings: Exclude from this series
>   The alternative patch fixed by Yamada-san has been applied.
> - Fix size of xdmac register region
> 
> Changes since v2:
> - dt-bindings: Consolidate register description for xdmac
> - Spread the size of xdmac register region
> 
> Changes since v1:
> - dt-bindings: Remove extension register description for xdmac
> - Remove extension register area from xdmac node
> - Fix commit message for ethernet aliases
> - Remove RGMII setting for LD20 global board
> 
> These patches in v1 have already been applied:
>   ARM: dts: uniphier: Add USB3 controller nodes for Pro5
>   arm64: dts: uniphier: Enable spi node for PXs3 reference board
>   arm64: dts: uniphier: Add nodes of thermal monitor and thermal zone
>     for PXs3
>   ARM: dts: uniphier: Set SCSSI clock and reset IDs for each channel
>   arm64: dts: uniphier: Set SCSSI clock and reset IDs for each channel
> 
> Kunihiko Hayashi (5):
>   ARM: dts: uniphier: Add XDMAC node
>   arm64: dts: uniphier: Add XDMAC node
>   ARM: dts: uniphier: Add ethernet aliases
>   arm64: dts: uniphier: Add ethernet aliases
>   arm64: dts: uniphier: Stabilize Ethernet RGMII mode of PXs3 ref board
> 
>  arch/arm/boot/dts/uniphier-ld6b-ref.dts                |  1 +
>  arch/arm/boot/dts/uniphier-pro4-ace.dts                |  1 +
>  arch/arm/boot/dts/uniphier-pro4-ref.dts                |  1 +
>  arch/arm/boot/dts/uniphier-pro4-sanji.dts              |  1 +
>  arch/arm/boot/dts/uniphier-pro4.dtsi                   |  8 ++++++++
>  arch/arm/boot/dts/uniphier-pro5.dtsi                   |  8 ++++++++
>  arch/arm/boot/dts/uniphier-pxs2-gentil.dts             |  1 +
>  arch/arm/boot/dts/uniphier-pxs2-vodka.dts              |  1 +
>  arch/arm/boot/dts/uniphier-pxs2.dtsi                   |  8 ++++++++
>  arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts |  1 +
>  arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts    |  1 +
>  arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi       |  8 ++++++++
>  arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts |  1 +
>  arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts    |  1 +
>  arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi       |  8 ++++++++
>  arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts    | 18 ++++++++++++++++++
>  arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi       |  8 ++++++++
>  17 files changed, 76 insertions(+)
> 
> -- 
> 2.7.4

---
Best Regards,
Kunihiko Hayashi

