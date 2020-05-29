Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E42C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 13:43:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 009D7207BC
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 13:43:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FLkftvLP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgE2Nnr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 May 2020 09:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726816AbgE2Nnq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 May 2020 09:43:46 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 669FBC03E969
        for <devicetree@vger.kernel.org>; Fri, 29 May 2020 06:43:45 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id z5so2143740ejb.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2020 06:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tWgHSNB7/VCfINBd4053Z4Bp4XM8aSMiiq5K+JAFOJU=;
        b=FLkftvLPGVoeJxbq2VHT25nIDxHqlrnsichgg+ZcVZeImFzvr5WM6ikvLnws0GBV75
         e0Zn7vsbU4Yvy69PdBhEWe/kHB8gmtLkkXdVlfQq0BaaUZC0RFw1i+DCdnrmHmd3975E
         ikaIJR7tmKW8ZMPMqS6oIY/eWF4Uwu7lNTxoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tWgHSNB7/VCfINBd4053Z4Bp4XM8aSMiiq5K+JAFOJU=;
        b=VHOdXInPwnMtzFHb11g7biatsHkGKjsqZMyRI2fs2IO5Pqd3mXmVfLBd4cO0II4z26
         JM8O2rGZRPKditM3B4oMXnJlHRK9gjkvxmbfVm3XjXp9pNObSCLRnjHSXye87MbyRQWw
         Fuj5NvuAZn4FLF3IPHFcXNO8MKPNkA7+BPWRIE2c6nBd4Zz7A7M7iu+6d/ydvg/kJ6ss
         WxJb1oOwrm+2EkEa4Ilgemhw3UdeC5JJh2XNtBbXLOwGBCHFzsk6JXMhRm2pCwR5segW
         6Tavjg0KZHVJzRAIRnq6TRodV0mmPYB5MA68M1nwS6j0luvmaVCd6SzY0zjJPkYmKElQ
         IDJw==
X-Gm-Message-State: AOAM531xQ70XzyEvqIlkJXTGKE0ZBYivRDP+RfurfIstQu/GZbaIQL8/
        NOuc1ox8BL9ibMpi3EaEMjIOPeeWM/bveA==
X-Google-Smtp-Source: ABdhPJyjxoBs74iQhgTPxE6/slFfgsztOP2Iy0AH29TJvpBiYgO6QhfYCSGYrgfb05q6jQMXgTiivA==
X-Received: by 2002:a17:906:9149:: with SMTP id y9mr2508280ejw.153.1590759823750;
        Fri, 29 May 2020 06:43:43 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id u20sm6892555edy.80.2020.05.29.06.43.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 06:43:42 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id x14so3721603wrp.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2020 06:43:41 -0700 (PDT)
X-Received: by 2002:a05:6000:d:: with SMTP id h13mr8532637wrx.17.1590759821053;
 Fri, 29 May 2020 06:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-2-dongchun.zhu@mediatek.com> <20200526182847.GA92449@bogus>
 <1590569355.8804.448.camel@mhfsdcap03> <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
 <20200527211628.GT7618@paasikivi.fi.intel.com> <1590636882.8804.474.camel@mhfsdcap03>
 <20200528072332.GW7618@paasikivi.fi.intel.com> <1590653082.8804.517.camel@mhfsdcap03>
In-Reply-To: <1590653082.8804.517.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 29 May 2020 15:43:30 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AuHDpQN8xZsWgnAt6m2reAYJbs9nBp0+mBo7_FS81LbQ@mail.gmail.com>
Message-ID: <CAAFQd5AuHDpQN8xZsWgnAt6m2reAYJbs9nBp0+mBo7_FS81LbQ@mail.gmail.com>
Subject: Re: [V9, 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
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

On Thu, May 28, 2020 at 10:06 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Sakari,
>
> On Thu, 2020-05-28 at 10:23 +0300, Sakari Ailus wrote:
> > Hi Dongchun,
> >
> > On Thu, May 28, 2020 at 11:34:42AM +0800, Dongchun Zhu wrote:
> > > Hi Sakari, Rob,
> > >
> > > On Thu, 2020-05-28 at 00:16 +0300, Sakari Ailus wrote:
> > > > Hi Rob, Dongchun,
> > > >
> > > > On Wed, May 27, 2020 at 09:27:22AM -0600, Rob Herring wrote:
> > > > > > > > +    properties:
> > > > > > > > +      endpoint:
> > > > > > > > +        type: object
> > > > > > > > +        additionalProperties: false
> > > > > > > > +
> > > > > > > > +        properties:
> > > > > >
> > > > > > Actually I wonder whether we need to declare 'clock-lanes' here?
> > > > >
> > > > > Yes, if you are using it.
> > > >
> > > > Dongchun, can you confirm the chip has a single data and a single clock
> > > > lane and that it does not support lane reordering?
> > > >
> > >
> > > From the datasheet, 'MIPI inside the OV02A10 provides one single
> > > uni-directional clock lane and one bi-directional data lane solution for
> > > communication links between components inside a mobile device.
> > > The data lane has full support for HS(uni-directional) and
> > > LP(bi-directional) data transfer mode.'
> > >
> > > The sensor doesn't support lane reordering, so 'clock-lanes' property
> > > would not be added in next release.
> > >
> > > > So if there's nothing to convey to the driver, also the data-lanes should
> > > > be removed IMO.
> > > >
> > >
> > > However, 'data-lanes' property may still be required.
> > > It is known that either data-lanes or clock-lanes is an array of
> > > physical data lane indexes. Position of an entry determines the logical
> > > lane number, while the value of an entry indicates physical lane, e.g.,
> > > for 1-lane MIPI CSI-2 bus we could have "data-lanes = <1>;", assuming
> > > the clock lane is on hardware lane 0.
> > >
> > > As mentioned earlier, the OV02A10 sensor supports only 1C1D and does not
> > > support lane reordering, so here we shall use 'data-lanes = <1>' as
> > > there is only a clock lane for OV02A10.
> > >
> > > Reminder:
> > > If 'data-lanes' property is not present, the driver would assume
> > > four-lane operation. This means for one-lane or two-lane operation, this
> > > property must be present and set to the right physical lane indexes.
> > > If the hardware does not support lane reordering, monotonically
> > > incremented values shall be used from 0 or 1 onwards, depending on
> > > whether or not there is also a clock lane.
> >
> > How can the driver use four lanes, considering the device only supports a
> > single lane??
> >
>
> I understood your meaning.
> If we omit the property 'data-lanes', the sensor should work still.
> But then what's the meaning of the existence of 'data-lanes'?
> If this property 'data-lanes' is always optional, then why dt-bindings
> provide the interface?
>
> In the meantime, if omitting 'data-lanes' for one sensor(transmitter)
> that has only one physical data lane, MIPI receiver(e.g., MIPI CSI-2)
> shall enable four-lane configuration, which may increase consumption of
> both power and resource in the process of IIC communication.

Wouldn't the receiver still have the data-lanes property under its
endpoint node, telling it how many lanes and in which order should be
used?

Best regards,
Tomasz
