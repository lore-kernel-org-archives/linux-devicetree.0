Return-Path: <SRS0=VloT=6N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5D0C83000
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 15:12:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 274D62074A
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 15:12:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks-com.20150623.gappssmtp.com header.i=@gateworks-com.20150623.gappssmtp.com header.b="dkPv3tWo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgD2PMQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Apr 2020 11:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbgD2PMQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Apr 2020 11:12:16 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17477C03C1AE
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 08:12:16 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id m13so1962145otf.6
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 08:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5Dw9z3skpovx5U+Kokok0Gl+LhbKi7TC3S8cZHyqEUI=;
        b=dkPv3tWoN9rA8+Bpd+XhqvQdAVTKC5limvdKzHBCx1BarPDm57/tI78fBE7uL+DU13
         O+AdIpD3a43by+BV6dogoQY6jcRVPQzgoHMQ2/ZyLQ89a8AqDasMiHo+R7jnddEjMysW
         weDMB8rrapD3D21eqEKS/uTdXAsIUn3UizXUdAER0MkK+RQUQbyR0rmkcFB3iXfF5JjO
         V4aIZK19mtcUR+rO0sv76y5Tch4CtoYxls2o2TsK222FmVZ4jIxFjdOotGiM8ByBi9XE
         /HIbF/OzTvGtilnlXBZAlg9tzAenf1Iy9nSCfhDsZztkn6+d0LG5oWPsr4xbTHLYq7Ki
         Be1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5Dw9z3skpovx5U+Kokok0Gl+LhbKi7TC3S8cZHyqEUI=;
        b=XplACvzbKmPf2h9ODswBwLKs1+8PBQSuqMLt9bOqjF0dX/T1rQPjjUhsqO9LDpcDx7
         XAGTJIsZQ7OZa/RnZk9ABp5u9amZtbw/IRS0pnyfzRQuv+UT0Lz6R4JDoCTxuSzYvfcF
         pty5cJ6fyZtNJZQj4PJdH1C2K0jrVnIu4hl+1sfY0HMs7T4uFhr2EVZYbhVYPtW5dL27
         wjAmUWU1YmIeqrn1jFeTxfkALs/qtX4Ogyq3crxtqlflCqknatJTrvMZ7F4kg5hFHIEO
         sfsGnflD6M6d4HlsBErQVlQXi4qumDDPKg8FyBL8yU5lvlCbEP2ea8B/eEDcrIMe3fdL
         5nhw==
X-Gm-Message-State: AGi0PubryqY31WTi2r2wY/2GTKCTxT0C43JKm4pjhl+HlHQPfB7FUcOm
        aRqaeH8CrSGcSC8XXC5EcrscwG+NDozkXfL7tZG1lw==
X-Google-Smtp-Source: APiQypKIJWHbxA5JB3lkWleLMMBByUMCEMnUlnt76a3lN0G0WNuQD4Dk7h+dye5tgPuRW+q4nMRv5v6zQwQumku/iX8=
X-Received: by 2002:a9d:7dd8:: with SMTP id k24mr26893979otn.33.1588173135382;
 Wed, 29 Apr 2020 08:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <1587748215-9587-1-git-send-email-tharvey@gateworks.com> <20200429033740.GP32592@dragon>
In-Reply-To: <20200429033740.GP32592@dragon>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Wed, 29 Apr 2020 08:12:04 -0700
Message-ID: <CAJ+vNU23EFFjxC4gATy1d1CU7GQQZ8+p+9eiQkF_r4vhR-p+ng@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: gw552x: add USB OTG support
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Sascha Hauer <s.hauer@pengutronix.de>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Apr 28, 2020 at 8:37 PM Shawn Guo <shawnguo@kernel.org> wrote:
>
> On Fri, Apr 24, 2020 at 10:10:15AM -0700, Tim Harvey wrote:
> > The GW552x-B board revision adds USB OTG support.
> >
> > Enable the device-tree node and configure the OTG_ID pin.
> >
> > Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> > ---
> >  arch/arm/boot/dts/imx6qdl-gw552x.dtsi | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/imx6qdl-gw552x.dtsi b/arch/arm/boot/dts/imx6qdl-gw552x.dtsi
> > index dc646b7..133a1e3 100644
> > --- a/arch/arm/boot/dts/imx6qdl-gw552x.dtsi
> > +++ b/arch/arm/boot/dts/imx6qdl-gw552x.dtsi
> > @@ -12,8 +12,6 @@
> >               led1 = &led1;
> >               led2 = &led2;
> >               nand = &gpmi;
> > -             usb0 = &usbh1;
> > -             usb1 = &usbotg;
>
> Have some comments about this change in the commit log?
>

Shawn,

I shouldn't have removed those... will submit a v2. Thank you for catching this!

Tim
