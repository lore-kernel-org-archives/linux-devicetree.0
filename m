Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBBBC28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 12:59:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36C88206DB
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 12:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588769989;
	bh=MPXOfGvSfzOLFX5Mr6VIYuxuS5zusNmJO44TnBYJ+4c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=aQG8k9YEWQA91cqksrHrmoNnNGr8dg5vuOy4MV1xZJxp+KMZARLisC6yax1OqloK+
	 mrSVkQyCn9JrjguotPUkjiyNdMrWdJ6+2PqdXH/zl0shkZSygAf7gsirm8rkpFEZd0
	 AqU59S/i/PD8kvZPmT6n2pmpBXlHXaz7ezeyoDcA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728543AbgEFM7s (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 08:59:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:42974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728081AbgEFM7s (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 6 May 2020 08:59:48 -0400
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A15F206DB
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 12:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588769988;
        bh=MPXOfGvSfzOLFX5Mr6VIYuxuS5zusNmJO44TnBYJ+4c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xAaAzHhmFFb5GEoM8xdv/EgSiN4efFAjxqLJfFT7rtDodCckGoaZB+mQyRPMC/WH6
         TR+abpF4ldtyzsc/UhAw9EZXkHXrteGlre2le/TAZOW3zVZhaSCL0alhOm7uZ6w1Fr
         oKyAFn7TFachz3T8G+v7pgFjVc02IqG6PA3pndjk=
Received: by mail-ot1-f49.google.com with SMTP id e20so1212380otk.12
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 05:59:48 -0700 (PDT)
X-Gm-Message-State: AGi0PuaT6rnZycvuvsrrcyHYGQKbs/S6k2BTeanL05W0m7kSx4SzG6bt
        11lCp7ElSE3TJ/w432g49D7H3Z1cvxAj1nkkPQ==
X-Google-Smtp-Source: APiQypKMCl11Lv+2rqDX9OoL5GHc2eme9RFoZ4Zrg8I1wW+XHUMQEKMY4mUnzx/QVXnxxUR4/bc3QbJsu9VNuB+IZLA=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr648970otl.107.1588769987459;
 Wed, 06 May 2020 05:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200501083227.10886-1-ricardo.canuelo@collabora.com>
 <20200501083227.10886-6-ricardo.canuelo@collabora.com> <CAMuHMdVbRoGAqeqePQDgRpxg4Vsr_LEfHERW-r6KdiSOCo5a6g@mail.gmail.com>
 <20200506082332.57ptj42mkrrn4ceo@rcn-XPS-13-9360> <20200506105705.GA5946@pendragon.ideasonboard.com>
In-Reply-To: <20200506105705.GA5946@pendragon.ideasonboard.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 6 May 2020 07:59:36 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJrE5nMGStAKCynQc4yc1cAvjBos8hvWkSCMxbzJaowPw@mail.gmail.com>
Message-ID: <CAL_JsqJrE5nMGStAKCynQc4yc1cAvjBos8hvWkSCMxbzJaowPw@mail.gmail.com>
Subject: Re: [RFT PATCH 5/5] dt-bindings: drm: bridge: adi,adv7511.txt:
 convert to yaml
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     Collabora Kernel ML <kernel@collabora.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Wei Xu <xuwei5@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 6, 2020 at 5:57 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, May 06, 2020 at 10:23:32AM +0200, Ricardo Ca=C3=B1uelo wrote:
> > Hi Geert,
> >
> > Thanks for reviewing the patches. Some comments below,
> >
> > On mi=C3=A9 06-05-2020 09:44:19, Geert Uytterhoeven wrote:
> > > Can't you avoid the need for patches
> > > [RFT PATCH 1/5] arm64: dts: draak: Reorder hdmi-encoder@39 reg and
> > > reg-names properties
> > > [RFT PATCH 2/5] ARM: dts: wheat: reorder reg and reg-names properties
> > > in hdmi bridges
> > >
> > > by using
> > >
> > >     items:
> > >       enum:
> > >         - main
> > >         - edid
> > >         - cec
> > >         - packet
> > >
> > > instead?
> >
> > Not really, because that defines a scalar property that can take any of
> > those values (if I'm not mistaken), and the core schema enforces that
> > reg-names must be an array.

No, 'items' as a schema rather than a list applies to every element in an a=
rray.

> >
> > I think the closest I can get to what you mean would be something like
> > this:
> >
> >     items:
> >       - enum:
> >         - main
> >         - edid
> >         - cec
> >         - packet
> >       - enum:
> >         - main
> >         - edid
> >         - cec
> >         - packet
> >       - enum:
> >         - main
> >         - edid
> >         - cec
> >         - packet
> >       - enum:
> >         - main
> >         - edid
> >         - cec
> >         - packet
> >
> > But then that wouldn't prevent anyone from defining duplicate reg-names
> > (eg. "main", "cec", edid", "cec"), which is even worse IMO.
>
> The direction DT bindings are taking is to enfore a particular order. It
> will cause DT validation errors for old device trees, but it won't break
> backward compatibility as the order won't be enforced at runtime, so I
> think that's fine. Tidying up the existing DT sources to use a
> consistent order seems best to me.

Yes.

It's not a new direction though. The order was always supposed to be
defined, it's just enforceable now.

Rob
