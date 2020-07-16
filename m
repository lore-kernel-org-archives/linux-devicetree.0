Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF2DC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 08:06:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1BC9206F4
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 08:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594886760;
	bh=ehYqwwPvhuxxIPWHvlV3lLMdf3GltGXOOPUU/9ywhbk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=D+O4XQ9FalJtlxenko0MFqmhWmkNZOrkIrAhA5Xg6dxjP7wR8v/sFMMmFgJvpJJSZ
	 seinEGd4uf47SmRIUjDAPtOnfMAAxuK+c6ESZV4AJPIOT9hOn356uYzsjVP88any+s
	 QaHcpkvMSvcksoIcR/XqUlAQhQ6ex9I0spjumgsE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbgGPIGA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 04:06:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:43264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725897AbgGPIF7 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Jul 2020 04:05:59 -0400
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BAA67207F9
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 08:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594886759;
        bh=ehYqwwPvhuxxIPWHvlV3lLMdf3GltGXOOPUU/9ywhbk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NUX4V55vt4vDnhVkTf8fxI7TNgH3zODiAlWoDTATCG7RRdPANygNwAvNS6W5TZWQW
         SSdJcDQi4Jb0D+6miI511OufLznjUg6BIZLFLtlUCQNq06JGEPi0nWV6X5MaM8bFOC
         7oYDeoj4xzpTLhtqIbGKVncaWoF6cMtiJRPHVL7s=
Received: by mail-lj1-f170.google.com with SMTP id q7so6156395ljm.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 01:05:58 -0700 (PDT)
X-Gm-Message-State: AOAM530qsR7fMQxGPcxbohXsgabpZZ6U6bvrWG/IQcyder50oe3nMrtu
        vSN/H+4au42Wvs0Zahrp1pvvqljjwJzZjSRka38=
X-Google-Smtp-Source: ABdhPJxazghiflEzI/K26+i5bXrJUHgf5KqjhEhjQP9dK24Tz6XSyIB/akZSw4IY6VNdFmgg7CnAA+tbWy1cJgyFKIY=
X-Received: by 2002:a2e:3a14:: with SMTP id h20mr1308635lja.331.1594886757055;
 Thu, 16 Jul 2020 01:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200714071305.18492-1-wens@kernel.org> <20200714071305.18492-2-wens@kernel.org>
 <20200716080043.6duzgo2ikeqr5lnw@gilmour.lan>
In-Reply-To: <20200716080043.6duzgo2ikeqr5lnw@gilmour.lan>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Thu, 16 Jul 2020 16:05:46 +0800
X-Gmail-Original-Message-ID: <CAGb2v64a=kDwx-bEtXSyX1QCMe65KETgDHhbkYGBjX8Fv3Jk-A@mail.gmail.com>
Message-ID: <CAGb2v64a=kDwx-bEtXSyX1QCMe65KETgDHhbkYGBjX8Fv3Jk-A@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel-dpi: Add bits-per-color property
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Siarhei Siamashka <siarhei.siamashka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jul 16, 2020 at 4:00 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Tue, Jul 14, 2020 at 03:13:01PM +0800, Chen-Yu Tsai wrote:
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > Some LCD panels do not support 24-bit true color, or 8bits per channel
> > RGB. Many low end ones only support up to 6 bits per channel natively.
> >
> > Add a device tree property to describe the native bit depth of the
> > panel. This is separate from the bus width or format of the connection
> > to the display output.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> >  .../devicetree/bindings/display/panel/panel-dpi.yaml          | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > index 0cd74c8dab42..8eb013fb1969 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > @@ -26,6 +26,9 @@ properties:
> >    height-mm: true
> >    label: true
> >    panel-timing: true
> > +  bits-per-color:
> > +    description:
> > +      Shall contain an integer describing the number of bits per color.
>
> You should specify its type (u32), range (1-8 I guess?) and default
> value (which seems to be 8).

Ok.

> Also, it's not unusual to have a different number of bits per color,
> like for 16 bits panels where we usually use RGB565. I guess we could
> make that an array?

So for different number of bits per color, I'm not sure whether that's
a function of the panel itself, or the bus format. I don't really have
any 16-bit panels on hand. As it stands DRM only handles a common color
depth.

ChenYu
