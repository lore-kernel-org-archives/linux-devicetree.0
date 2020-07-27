Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338FFC432C3
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 23:29:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B998208E4
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 23:29:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="G67kQUuz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgG0X3X (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 19:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728072AbgG0XYK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 19:24:10 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C457C061794
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 16:24:10 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id d6so4943921ejr.5
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 16:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xM16+9OA99w5ephlgTCRjglWjEgS63bz9o3IOYOIm7o=;
        b=G67kQUuzwV7dl3s16MC+j2fuhezMpsBd2exYO+tzgfET2snhYH+FkjeUFeLZR9cirQ
         JKeZPFf8qtc3jgd+mmL5LAGnP2DI0osoBCFYJvOmnpEQ+zJaTfluGFQeKdXfCnNieBTV
         JKeI9WWXrwv0nxq4iSQsWpqkz+GTksekaRAxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xM16+9OA99w5ephlgTCRjglWjEgS63bz9o3IOYOIm7o=;
        b=EapEaIRhIR8KKEi1VwY8ztZOEOMbBOi4i6sRfLd2gSmxzO+D4qlhIvk2NJO+8MCxcY
         buHjJDl0ABk4Hl5ruDXlwv2Odh/Js7eUwgIjZWMci/AgZlTir+Ei/k4kMDBq8biMvbmB
         h6GfJSAaRIriwNG2KFHi6LYTQJTEyurUGScTa7J7s4aXE0crN6uwk41f2TYlduDKXq1P
         ob+rHl+6NP/2A7MDMLfdRfGm+iTAKjURJtxRmFtDqy2Hm52uHex2zoILq3erjE1dVSLJ
         VXu4CFt5WAaXoZZxNffz/bzB3HjPdQZFioGfx7fNWurhP2IuHbu+74TuXJnbCrtfVr5E
         edzQ==
X-Gm-Message-State: AOAM532mI6+YPX71o4gTo+dmo4aTiH1+SRiQEKRymtkEuCYNiKAuBBe+
        DZzExj+h7DdnGiMArA+ei9X115PLIT25RalAKC0azm4F
X-Google-Smtp-Source: ABdhPJzyOb8ESvQxhvskEahOmhZh6GwF/GEvlsPoC5gw9Q1D0ff2BxB5quVqDdPt1sAFUjqKfqzwZ91PLxLA88DRkPY=
X-Received: by 2002:a17:906:3984:: with SMTP id h4mr24471568eje.254.1595892249009;
 Mon, 27 Jul 2020 16:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <125895BF-8477-4107-9A80-47A5128D296C@linux.vnet.ibm.com>
In-Reply-To: <125895BF-8477-4107-9A80-47A5128D296C@linux.vnet.ibm.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 27 Jul 2020 23:23:56 +0000
Message-ID: <CACPK8Xc+nAj3bL0Uz6qCdPZiL3h0MCaLQEB1qyYaqbVC9XedrQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rainier: Add leds that are off 9551 on Operator Panel
To:     vishwanatha subbanna <vishwa@linux.vnet.ibm.com>
Cc:     OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Eddie James <eajames@linux.ibm.com>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 27 Jul 2020 at 12:41, vishwanatha subbanna
<vishwa@linux.vnet.ibm.com> wrote:
>
>
> These are LEDs that are controlled by 9551
>
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> ---
> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 82 ++++++++++++++++++++++++++++
> 1 file changed, 82 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 0b5c6cc..ecbce50 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -69,6 +69,38 @@
>                 };
>         };
>
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               /* System ID LED that is at front on Op Panel */
> +               front-sys-id0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* System Attention Indicator ID LED that is at front on Op Panel */
> +               front-check-log0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca1 1 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* Enclosure Fault LED that is at front on Op Panel */
> +               front-enc-fault1 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca1 2 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* System PowerOn LED that is at front on Op Panel */
> +               front-sys-pwron0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca1 3 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> };

This patch is malformed. It looks like you've pasted it into your
mailer, which makes it easy to break the patch. Instead I recommend
using git-send-email to send your patches as it avoids this issue.


>
> &gpio0 {
> @@ -514,6 +546,56 @@
>                 };
>         };
>
> +       pca1: pca9551@60 {
> +               compatible = "nxp,pca9551";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio@0 {
> +                       reg = <0>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@1 {
> +                       reg = <1>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +
>         dps: dps310@76 {
>                 compatible = "infineon,dps310";
>                 reg = <0x76>;
> --
> 1.8.3.1
>
>
>
