Return-Path: <SRS0=DK2V=2X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B0AC2D0DC
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 15:43:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9B91215A4
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 15:43:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Mtxy2+o0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbgABPnt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jan 2020 10:43:49 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:42593 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728561AbgABPns (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jan 2020 10:43:48 -0500
Received: by mail-io1-f65.google.com with SMTP id n11so31923833iom.9
        for <devicetree@vger.kernel.org>; Thu, 02 Jan 2020 07:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tocxIO5F9WiGwdyi59k65eYp6LMpmfQ5nQn9VUEVPqU=;
        b=Mtxy2+o0bGr/YIkhtVJRxWVKb9Ts8KHINjjApSRDlUQUw8j5A3XxCYZ8CKfnITE+FA
         /KkxbNERhd0WMLvxeqjJLVICjFaIgydE1Rc8bRMLYlyYjj3njZG1bjNacTARHK5oNFaw
         jbDX9RRTa4yi7hWnPb7e0E5g/8zfiz+SWjmiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tocxIO5F9WiGwdyi59k65eYp6LMpmfQ5nQn9VUEVPqU=;
        b=clRDpP7T5g/txphpIWfpSFFaK8G1BcnPZUbFnC6wxgnakvbOdn1AcZOrowsoLYXXr4
         i/H+eZS0cgV6GigAgMoCCFSgu8HzvGXev0IHt6yAzNcPszeNtxEl5mmUSVrxflVBkp19
         0Bp+tfRFU4C0VfAp7pFM8V0PvGOHTDEd2T7+f/9xOIYbfu+1K++47Ln5QZg/5wpQbZGv
         e25mJDRjKlcmgssEVNQiYrLCuY3RewoZHDjCBB2P2VM3H5a8mif8xDbaJe+7Qgx2oBBU
         FJ7qPZQFv3Dw4sQmiqcGrYl4iBEJyVgSsJiC1zcwzAmmP8uyyeQOaVX+bRiNlyHpckQc
         rZag==
X-Gm-Message-State: APjAAAVctH1lT+zcUpZFOOZMLfxRZSEBexxY9HgkcSr1BGp7ZZtXyAwv
        Pd4Vl++NFoGWFoh3lXQHRxNq5Kn9qXhv2Oos4RITbQ==
X-Google-Smtp-Source: APXvYqygOqKSlxE+0TT0WUiiUg0DLdEp+in8oQr92U8mxkGOhOUcB0XCaUZGiQdDnqZWvyQeVmWXtdoyza5Z2wi099Q=
X-Received: by 2002:a6b:f716:: with SMTP id k22mr44050760iog.297.1577979828013;
 Thu, 02 Jan 2020 07:43:48 -0800 (PST)
MIME-Version: 1.0
References: <20191231130528.20669-1-jagan@amarulasolutions.com>
 <20191231130528.20669-7-jagan@amarulasolutions.com> <20200102110347.v7lsnmmsbp66r3ia@gilmour.lan>
In-Reply-To: <20200102110347.v7lsnmmsbp66r3ia@gilmour.lan>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 2 Jan 2020 21:13:37 +0530
Message-ID: <CAMty3ZAwaqE31=rCiub3bRZBOa68ck5Ld=A7kVsQjssps9TCxg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] dt-bindings: sun6i-dsi: Add R40 DPHY compatible
 (w/ A31 fallback)
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jan 2, 2020 at 4:33 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> On Tue, Dec 31, 2019 at 06:35:25PM +0530, Jagan Teki wrote:
> > The MIPI DSI PHY controller on Allwinner R40 is similar
> > on the one on A31.
> >
> > Add R40 compatible and append A31 compatible as fallback.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v3:
> > - update the binding in new yaml format
> >
> >  .../devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml   | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> > index 8841938050b2..0c283fe79402 100644
> > --- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> > @@ -18,6 +18,7 @@ properties:
> >      oneOf:
> >        - const: allwinner,sun6i-a31-mipi-dphy
> >        - items:
> > +          - const: allwinner,sun8i-r40-mipi-dphy
> >            - const: allwinner,sun50i-a64-mipi-dphy
> >            - const: allwinner,sun6i-a31-mipi-dphy
>
> This isn't doing what you say it does.
>
> Here you're stating that there's two valid values, one that is a
> single element allwinner,sun6i-a31-mipi-dphy, and another which is a
> list of three elements allwinner,sun8i-r40-mipi-dphy,
> allwinner,sun50i-a64-mipi-dphy and allwinner,sun6i-a31-mipi-dphy, in
> that order.

I got it Maxime, thanks for pointing this.

>
> Did you run make dtbs_check and dt_bindings_check?

I sure I didn't, thanks for the clue.

Will do this on another patch as well.

Jagan.
