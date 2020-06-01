Return-Path: <SRS0=Zx7r=7O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A84C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 18:43:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A9DF206A4
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 18:43:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="krEtW7JM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729159AbgFASnQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 1 Jun 2020 14:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731398AbgFASmm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 1 Jun 2020 14:42:42 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E02C2C08C5CB
        for <devicetree@vger.kernel.org>; Mon,  1 Jun 2020 11:24:58 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id q13so8027600edi.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2020 11:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ktf8hdQ0/bBZ1rrqyUokS+zLJv4wCtg8txRgNdj1RPs=;
        b=krEtW7JMlTpPiCKTfkH45ggYkkj3H9lMw3FHZ+1Nxnk3MzT/QKbhGGtK42nirA8MFn
         8G8AE9vCtYO/pcHXfz0lHK5hnvODHlSFgnXWwVwztN5SNCHF6uSpFZSNBGwod3CN8UPc
         7Rxz2QyGs/IN647KyZ76Gh0/KSl4VBY2OXwuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ktf8hdQ0/bBZ1rrqyUokS+zLJv4wCtg8txRgNdj1RPs=;
        b=DhCnrb7z9H3rfp1pmAGMOMt82sAGbCSbnkImcZuOU2YkRnzL4xuV3fuccOGCMkRdju
         Qa7Yd7d17RyEazsFPC7bw1qrGVGAyfN41dJV4efrQU6x5l5XpuRIPs41mTW3geKQesXY
         3jrxlHn7RUsrKz4Rylx02l1RorGEvNphK9R6uCzWAmwVO5cmYLBxG9UZaqJMwbpghAzR
         jIXdRJKSnsqxabLExXbs0mJ/WTGPSFP8goxfyMv96tlgcFvojBKqWE0jBSbArTlbs/+l
         tyomt2HmEF40Fob7WUzbWCKM8ZJnUjQrVSBbxnqiRkn6rbDvGvJjdJZqZINVO29toJjs
         3+tQ==
X-Gm-Message-State: AOAM530KKRpj7AuhqG5oBwEJbLjplTWsls0b1feO0XVk9H0G3TlM16wx
        AjB0iLlAdh96dGSCzrHU1TlUPuQRZNrD7w==
X-Google-Smtp-Source: ABdhPJwAgO9YCaVkB/rctyg8gJ1NEhhPpjsujggoW1ZYl4C16KUwzk7eJwuCl9lBBU2B85yFBMNwxw==
X-Received: by 2002:a05:6402:1cad:: with SMTP id cz13mr23417398edb.56.1591035897327;
        Mon, 01 Jun 2020 11:24:57 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id z20sm305934ejb.68.2020.06.01.11.24.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 11:24:57 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id r9so456580wmh.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2020 11:24:56 -0700 (PDT)
X-Received: by 2002:a1c:b155:: with SMTP id a82mr509536wmf.46.1591035503038;
 Mon, 01 Jun 2020 11:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-2-dongchun.zhu@mediatek.com> <20200526182847.GA92449@bogus>
 <1590569355.8804.448.camel@mhfsdcap03> <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
 <20200527211628.GT7618@paasikivi.fi.intel.com> <1590636882.8804.474.camel@mhfsdcap03>
 <20200528072332.GW7618@paasikivi.fi.intel.com> <1590653082.8804.517.camel@mhfsdcap03>
 <CAAFQd5AuHDpQN8xZsWgnAt6m2reAYJbs9nBp0+mBo7_FS81LbQ@mail.gmail.com> <1590978816.8804.523.camel@mhfsdcap03>
In-Reply-To: <1590978816.8804.523.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 1 Jun 2020 20:18:10 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AY9gejoiwxojvvG0FaVfEAf8gCqOddvo-dxemQWFksVw@mail.gmail.com>
Message-ID: <CAAFQd5AY9gejoiwxojvvG0FaVfEAf8gCqOddvo-dxemQWFksVw@mail.gmail.com>
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

On Mon, Jun 1, 2020 at 4:35 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Fri, 2020-05-29 at 15:43 +0200, Tomasz Figa wrote:
> > On Thu, May 28, 2020 at 10:06 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > >
> > > Hi Sakari,
> > >
> > > On Thu, 2020-05-28 at 10:23 +0300, Sakari Ailus wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Thu, May 28, 2020 at 11:34:42AM +0800, Dongchun Zhu wrote:
> > > > > Hi Sakari, Rob,
> > > > >
> > > > > On Thu, 2020-05-28 at 00:16 +0300, Sakari Ailus wrote:
> > > > > > Hi Rob, Dongchun,
> > > > > >
> > > > > > On Wed, May 27, 2020 at 09:27:22AM -0600, Rob Herring wrote:
> > > > > > > > > > +    properties:
> > > > > > > > > > +      endpoint:
> > > > > > > > > > +        type: object
> > > > > > > > > > +        additionalProperties: false
> > > > > > > > > > +
> > > > > > > > > > +        properties:
> > > > > > > >
> > > > > > > > Actually I wonder whether we need to declare 'clock-lanes' here?
> > > > > > >
> > > > > > > Yes, if you are using it.
> > > > > >
> > > > > > Dongchun, can you confirm the chip has a single data and a single clock
> > > > > > lane and that it does not support lane reordering?
> > > > > >
> > > > >
> > > > > From the datasheet, 'MIPI inside the OV02A10 provides one single
> > > > > uni-directional clock lane and one bi-directional data lane solution for
> > > > > communication links between components inside a mobile device.
> > > > > The data lane has full support for HS(uni-directional) and
> > > > > LP(bi-directional) data transfer mode.'
> > > > >
> > > > > The sensor doesn't support lane reordering, so 'clock-lanes' property
> > > > > would not be added in next release.
> > > > >
> > > > > > So if there's nothing to convey to the driver, also the data-lanes should
> > > > > > be removed IMO.
> > > > > >
> > > > >
> > > > > However, 'data-lanes' property may still be required.
> > > > > It is known that either data-lanes or clock-lanes is an array of
> > > > > physical data lane indexes. Position of an entry determines the logical
> > > > > lane number, while the value of an entry indicates physical lane, e.g.,
> > > > > for 1-lane MIPI CSI-2 bus we could have "data-lanes = <1>;", assuming
> > > > > the clock lane is on hardware lane 0.
> > > > >
> > > > > As mentioned earlier, the OV02A10 sensor supports only 1C1D and does not
> > > > > support lane reordering, so here we shall use 'data-lanes = <1>' as
> > > > > there is only a clock lane for OV02A10.
> > > > >
> > > > > Reminder:
> > > > > If 'data-lanes' property is not present, the driver would assume
> > > > > four-lane operation. This means for one-lane or two-lane operation, this
> > > > > property must be present and set to the right physical lane indexes.
> > > > > If the hardware does not support lane reordering, monotonically
> > > > > incremented values shall be used from 0 or 1 onwards, depending on
> > > > > whether or not there is also a clock lane.
> > > >
> > > > How can the driver use four lanes, considering the device only supports a
> > > > single lane??
> > > >
> > >
> > > I understood your meaning.
> > > If we omit the property 'data-lanes', the sensor should work still.
> > > But then what's the meaning of the existence of 'data-lanes'?
> > > If this property 'data-lanes' is always optional, then why dt-bindings
> > > provide the interface?
> > >
> > > In the meantime, if omitting 'data-lanes' for one sensor(transmitter)
> > > that has only one physical data lane, MIPI receiver(e.g., MIPI CSI-2)
> > > shall enable four-lane configuration, which may increase consumption of
> > > both power and resource in the process of IIC communication.
> >
> > Wouldn't the receiver still have the data-lanes property under its
> > endpoint node, telling it how many lanes and in which order should be
> > used?
> >
>
> The MIPI receiver(RX) shall use
> v4l2_async_notifier_add_fwnode_remote_subdev() API to parse the property
> "data-lanes" under sensor output port.

That's not true. The MIPI receiver driver parses its own port node
corresponding to the sensor. Also quoting the documentation [1]:

"An endpoint subnode of a device contains all properties needed for
_configuration of this device_ for data exchange with other device. In most
cases properties at the peer 'endpoint' nodes will be identical, however they
might need to be different when there is any signal modifications on the bus
between two devices, e.g. there are logic signal inverters on the lines."

In this case, there is such a signal modification if the sensor has a
1-lane bus and the receiver more lines, so the data-lanes properties
would be different on both sides.

[1] https://elixir.bootlin.com/linux/v5.7/source/Documentation/devicetree/bindings/media/video-interfaces.txt

Best regards,
Tomasz
