Return-Path: <SRS0=7YFh=7B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C47C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 20:38:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45873207C4
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 20:38:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OWwWqJvj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbgESUik (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 16:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgESUij (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 May 2020 16:38:39 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 612B9C08C5C2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 13:38:39 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id k4so435169uaq.10
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 13:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tW6EW4cSWh55qYp1WeU6PQVnxEHSMZHc8fHW3A+VMb8=;
        b=OWwWqJvjeWW5njlNWGf2uPt037V4dYIPW2MnkBt9ha+MFBeJ2Zh5pekuhMEvAdkK/d
         d9voue+0cyZCDGJ2CAFCUlJ2VxKdotHK1mYnwFQc4n0ITdCEcJ5NyFGYyDEUMs2eW0Oz
         6mWKRFm0oOYPh+S/Cmr+e2voxCarx5IHw3Vi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tW6EW4cSWh55qYp1WeU6PQVnxEHSMZHc8fHW3A+VMb8=;
        b=nm78qXXTr8SY2FuFIPbmZPVaPW21DN8qF3eIg5XdteCA3IMblTbtVOfku0fk0xgvg9
         1f46sCYImC3iOWdS2/7dHtzZbSWit+TMjT+3JcwzgyU4B6bvESXH2t/+HYGgLdSUVD4R
         T4fCto8JY0AQdywPSLIxUjG4s4lSuDmCXalruQcFyrM9KPHa2Xxce0s33mZSYL0wwxi/
         ijNzWS/SL7flvkUVxNlw7qGdIOP6DrY/wBna7HR7RCWwRpPMai/amR+RewSNnTQfdURo
         U0dn73fji3janXWQZ+jsKm8mBtOnRrYgsh6V+YXmVvXHpW7kv1PhfWCx4l4jUj/eY/xw
         gguA==
X-Gm-Message-State: AOAM531Zth97l/WvrdXSBBp5Nzh6e8YbJNQyjQvQQ56gPdPEzpm7PL/Z
        LTeOu1G/UJz21b8p9B7xlF+DnEVayc0=
X-Google-Smtp-Source: ABdhPJxdea9CxnxQsrtTBkq/VfRqBDWZ+ZKmzjEFGIJjOYxSE518cHyPBNwgozcBHR1mDjQ1KtViJA==
X-Received: by 2002:a9f:3244:: with SMTP id y4mr1061350uad.49.1589920718277;
        Tue, 19 May 2020 13:38:38 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id k16sm95417vsp.12.2020.05.19.13.38.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 13:38:37 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id k4so435132uaq.10
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 13:38:37 -0700 (PDT)
X-Received: by 2002:ab0:b13:: with SMTP id b19mr1046847uak.91.1589920717000;
 Tue, 19 May 2020 13:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <1589914405-6674-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1589914405-6674-1-git-send-email-pillair@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 19 May 2020 13:38:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VEDDm1cHQNLVitMLxMYvGA-pON+mdBj6SGn46yhw0jVQ@mail.gmail.com>
Message-ID: <CAD=FV=VEDDm1cHQNLVitMLxMYvGA-pON+mdBj6SGn46yhw0jVQ@mail.gmail.com>
Subject: Re: [PATCH v10] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module
 device node
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Tue, May 19, 2020 at 11:53 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> +               wifi: wifi@18800000 {
> +                       compatible = "qcom,wcn3990-wifi";
> +                       reg = <0 0x18800000 0 0x800000>;
> +                       reg-names = "membase";
> +                       iommus = <&apps_smmu 0xc0 0x1>;
> +                       interrupts =
> +                               <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH /* CE0 */ >,
> +                               <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH /* CE1 */ >,
> +                               <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH /* CE2 */ >,
> +                               <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH /* CE3 */ >,
> +                               <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH /* CE4 */ >,
> +                               <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH /* CE5 */ >,
> +                               <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH /* CE6 */ >,
> +                               <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH /* CE7 */ >,
> +                               <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH /* CE8 */ >,
> +                               <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH /* CE9 */ >,
> +                               <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH /* CE10 */>,
> +                               <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH /* CE11 */>;
> +                       memory-region = <&wlan_fw_mem>;
> +                       status = "disabled";
> +               };
> +
>                 config_noc: interconnect@1500000 {
>                         compatible = "qcom,sc7180-config-noc";
>                         reg = <0 0x01500000 0 0x28000>;

For completeness sake, I'll also point out that the WiFi node is also
sorted incorrectly.  0x18800000 comes after 0x01500000.


-Doug
