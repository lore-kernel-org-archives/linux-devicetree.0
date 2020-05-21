Return-Path: <SRS0=MDPI=7D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8D4C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 19:00:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB81320759
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 19:00:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ctQ6SI0E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729580AbgEUTAO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 May 2020 15:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729555AbgEUTAN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 May 2020 15:00:13 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 457DBC061A0E
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 12:00:13 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id s19so7391873edt.12
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 12:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UqwEmbeOGGl5axCIs5ejLFLJkH/v9z3WmODPpOgQhPw=;
        b=ctQ6SI0E7ok+GU+8Ex3LjacXwtrRve+ePuCEcSI/JDcGOh6Bp1+Pw/A6KoAtjV59F2
         z+5NwYvl+gbitSQKeu7ZlBFIhO5ZeBNaIg/x6qgzUh/ARMapWSn6guWiuKv17MDKIHa4
         hpfKR6y5Gzk//on7cJenwGp+e9HRXublre33g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UqwEmbeOGGl5axCIs5ejLFLJkH/v9z3WmODPpOgQhPw=;
        b=oFqKf/yYq/dOpzyM2VJkLXl1cl0XfftmcsTzoy3EpMA+OInFarx9IKPYyd2tygleUL
         2HQVAfFqielBS6hcRCOc7HPQ75UB39AKhqfBpnaGczrTF6uitJfWiP70pHHAiuT8Z3F0
         OTJsS9ET79Em2ygRFbDU+0CUMuP6OA6sV9cOUzsD4q9dmennDrBaTO64eEk4wNDo7f8u
         F+D/Gzo2XbNzUtE4E/gAod1LjgV0Yek85Q3Njb7Bk5+7Vycq2Bq1kED52IF7YDytiv1f
         5ERv14yNAifgErn8RgDzFu3XSZjPzEKEHTYoEgDu6UoqUjc3KsCDPYBJT53yVH/RtnIu
         n9OA==
X-Gm-Message-State: AOAM531EdrwmFjiTvL0wBibp5KRP04eEJeorips9inM5ojz0sndR/Ls5
        PmjtEYjXHMo6mTcMe4kUmcZgTuyyapbODg==
X-Google-Smtp-Source: ABdhPJy1rQW1ncTNaihxB6hKZNCwggcyDGssC0t+Ab8tGlUHfF4Z2ZcLu1aFGSlpNfHWnGPBDrKpJA==
X-Received: by 2002:a50:d0d7:: with SMTP id g23mr90565edf.163.1590087611642;
        Thu, 21 May 2020 12:00:11 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id a13sm5042112eds.6.2020.05.21.12.00.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 12:00:10 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id i15so7689064wrx.10
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 12:00:10 -0700 (PDT)
X-Received: by 2002:a05:6000:ce:: with SMTP id q14mr42592wrx.105.1590087609172;
 Thu, 21 May 2020 12:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
 <20200509080627.23222-2-dongchun.zhu@mediatek.com> <20200511160207.GA32476@bogus>
 <1589251221.8804.289.camel@mhfsdcap03>
In-Reply-To: <1589251221.8804.289.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 21 May 2020 20:59:56 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DgrDwPEpdN9ErJWsHbMDpo2s_u3pwsqtpNwVk4g3_CdQ@mail.gmail.com>
Message-ID: <CAAFQd5DgrDwPEpdN9ErJWsHbMDpo2s_u3pwsqtpNwVk4g3_CdQ@mail.gmail.com>
Subject: Re: [V8, 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= 
        <shengnan.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Dongchun, Rob,

On Tue, May 12, 2020 at 4:41 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Rob,
>
> Thanks for the review.
>
> On Mon, 2020-05-11 at 11:02 -0500, Rob Herring wrote:
> > On Sat, May 09, 2020 at 04:06:26PM +0800, Dongchun Zhu wrote:
[snip]
> > > +            port {
> > > +                wcam_out: endpoint {
> > > +                    remote-endpoint = <&mipi_in_wcam>;
> > > +                    data-lanes = <1>;
> >
> > This doesn't match the schema which says this should be 4 entries.
> >
>
> Property "data-lanes" shows the number of lanes that sensor supports.
> If this property is omitted, four-lane operation is assumed.
> For OV02A10, it is one-lane operation, so the property is supposed to be
> set to <1>.
>

To clarify on this, the ov02a10 sensor supports only 1 lane. It's not
a driver limitation.

Best regards,
Tomasz
