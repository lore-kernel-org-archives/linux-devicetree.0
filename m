Return-Path: <SRS0=kXJJ=3D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF12EC33C9E
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 20:10:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 975CE24673
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 20:10:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="U5UrGcnG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgANUKz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jan 2020 15:10:55 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:38924 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgANUKz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jan 2020 15:10:55 -0500
Received: by mail-ed1-f68.google.com with SMTP id t17so13155185eds.6;
        Tue, 14 Jan 2020 12:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9+kTGzipxG+2AUMOBSHrjhkVXKsRlWSVlekuyPDJ2KQ=;
        b=U5UrGcnGMLeF8EkEKnq4SXQA0bZn1K6H76br30DCk6nDl7shLs9apRuVn7paVhhr+J
         gMmnCx0Xyy4SbGAld5Dxx7hKCe3zVde+4D7GGrJUNuk6ou71aa4b0Jg6ZSopSLHmCYgh
         z3ijcao7IeziK6LYdDKe/yJZ59wU1ezjYiR/PZxH3iZ5M9ycOIaoBShnoDIrQDV7pp61
         rd5dofOqfUPsA5L0octRXnxmNVHNyuVUTKmF7HlpEGu3XMsHHloitIl9d7b1cvbccjHH
         AEK6BgTvDmyC2dFB+JvqthCztEkGsWsfUUbUsltQkgU7F6PzRxC7X2a/kK64COrwmRvd
         QEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9+kTGzipxG+2AUMOBSHrjhkVXKsRlWSVlekuyPDJ2KQ=;
        b=Zxq+C6zUlI78Xi6smZ641+LEcM9O1EJX3j1Eckb8BVL6ptOYdPaFHgUjTSt0FKiNEO
         cu4OmXLLew0PQ7op1C4S5qhVNiHTlfMtERFL32IX842JJPIb7A/RXLhbuIio9+jq2C0X
         MLVsWq0pexgx6rSrTSZKE+5RHzK5oqkMrY3XS4nT7lQbpqLj9DDHtBGV77LVHOc/YwMN
         G0dsKeNIZAD0gXLdJUBxATrcdK32ImgJnm/F3NdSYqQ4bV1OsteUKBj7mZZxRQqHSyS5
         y8zmZGceOtZQlYYi5+Fm+OazjHbeIWeErGJw1Rxzj7X82RIwqg6Ds7P0XUCU4F4oVZJY
         u7pQ==
X-Gm-Message-State: APjAAAVKC6HjoO4LqLsLjufU1xPYvVq138SDEz1pKRvwsDAy/VdIgHrZ
        I7G+xAlPqwpZuB4MwmtlCZFlowZgKhhGj2G+we0=
X-Google-Smtp-Source: APXvYqzsf7bCKRilpxan541+ugL4dAfOo0X8vA6AEhA9CtpMo2K4raWrA9d3K0IGQqHU1WDe0EVbnk1ga80LFRHazUc=
X-Received: by 2002:a17:906:f245:: with SMTP id gy5mr23583417ejb.225.1579032653189;
 Tue, 14 Jan 2020 12:10:53 -0800 (PST)
MIME-Version: 1.0
References: <1578634957-54826-1-git-send-email-hanjie.lin@amlogic.com>
 <1578634957-54826-3-git-send-email-hanjie.lin@amlogic.com>
 <CAFBinCCZSBWdKQwmcvponuUu_aiTnDCyRiPqKDgqfNkJQoq06w@mail.gmail.com> <52566105-cbee-01d6-9110-f9954eabe22f@amlogic.com>
In-Reply-To: <52566105-cbee-01d6-9110-f9954eabe22f@amlogic.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Tue, 14 Jan 2020 21:10:41 +0100
Message-ID: <CAFBinCDtPoKQh64VKmqOe=U0BLPE_Ef+scmK3h1uV9hLhT6Q1g@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family
 DWC3 Glue Bindings
To:     Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Yue Wang <yue.wang@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Hanjie,

On Mon, Jan 13, 2020 at 2:23 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
>
>
>
> On 2020/1/12 4:50, Martin Blumenstingl wrote:
> > Hi Hanjie,
> >
> > On Fri, Jan 10, 2020 at 6:43 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
> > [...]
> >> @@ -37,6 +43,11 @@ properties:
> >>
> >>    clocks:
> >>      minItems: 1
> >> +    maxItems: 4
> > the driver parses one clock for G12A/G12B/SM1 and three clocks for A1
> > if there is a fourth clock: do we need to manage it in the driver?
> > (note: dt-bindings always represent the hardware, so if there's a
> > fourth clock which the driver doesn't need then it's perfectly valid
> > to describe it here. a comment which clock this is helps in the
> > code-review process)
> >
>
> Hi Martin,
>
> Sorry for this confusing, I moved xtal_usb_phy clock from glue driver to phy,
> but I missed this binding modification.
> So actually A1 do only need these three clocks and no fourth clock exist, clock
> and clock-names maxItems should be three here for A1.
I see, thank you for clarifying this!

[...]
> Do you mean something like this:
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - amlogic,meson-g12a-usb-ctrl
> +
> +    then:
> +      properties:
> +        clocks:
> +         minItems: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - amlogic,meson-a1-usb-ctrl
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            minItems: 3
> +       clock-names:
> +          items:
> +            - const: usb_ctrl
> +            - const: usb_bus
> +            - const: xtal_usb_ctrl
> +      required:
> +        - clock-names
this looks good to me (but keep in mind that I'm no expert on these
yaml schemas)
I wonder if we are allowed to shorten this by having one clocks
property with minItems: 1 and maxItems: 3 (like you have in the
original patch) and then only have a
amlogic,meson-a1-usb-ctrl-specific "clock-names" property (and make
that mandatory for A1 SoCs)


Martin
