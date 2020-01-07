Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1339C33C99
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 10:20:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 828F820678
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 10:20:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xCw2aOcD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbgAGKUX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 05:20:23 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35235 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727154AbgAGKUX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 05:20:23 -0500
Received: by mail-lf1-f66.google.com with SMTP id 15so38497634lfr.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 02:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eMXkNg8gjjjP4/UPSl/T3BVhY6m7trOu4dhjFlvWIdM=;
        b=xCw2aOcDbDhAosRUZpI6S8jMUrGPkDQqWqFwb5KY/DgItDqPB6ptgX5V8gs2yDC82+
         TQSjZ5E2cLNKjaz6JtEmt4T7mFfIrrPYNyrT3jiAN6/2Iyc2srA526cttuVeaA9GgZy7
         RsjrRB4c79+Wti1TvIpqtZa5J1rHZihfl2JV8GWrftEngwr59RFHWw/BAxyZc22OAW9/
         mAqEQpKUAtdMyffk8S0eL1YYz/+fwuQPZL+9BCsW8/zdkEbMRl8S/rExnFRhho40HLDS
         VkvUCyyWA7t7vhznmbNtN4ENfD3DyIk0oCQtLNU+auQQZHfpdNT541zidQxXe0Qz4M0T
         FgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eMXkNg8gjjjP4/UPSl/T3BVhY6m7trOu4dhjFlvWIdM=;
        b=cgtSGfaJOvHF/on5/0ys4oVYSWvPMtKzs78rl5qhWuH+FthSFc9KZWWR+7Uk0JNe0P
         7Areaumt6C5ctaAsfLAfv6Zmr3IjNMX0mvc6zPyGpNHti6fSdZN1AHOXsZmz1+TANiC0
         UZ8NJJMWgGAwKNiQXhokTpmC5W1QO34Tlek/FGLeOJbNxGsRI9EzalOoPcY8/U+KAbXT
         rMaDrzRZ715j+k7uqZt/X+kFHC1bTb0DQMIBm41xUk82xJrkWAHkz/kznoe0Q0RuKPPw
         YM7QO2q0E/n3YyPMDFsaw/M+zZ6B0UrtKkhcUYFpQZLye6NvPkrRXGMPJeFJykBzLEau
         F2/Q==
X-Gm-Message-State: APjAAAW6AXyBGrkR7SFyN20PFnQzQbjSFY8bfYYs7Ggy1Zb1ZoRDE+A/
        viTDo3KAqX6NzfE2aUqjexzLG0WLkGew7jMMpmjZWQ==
X-Google-Smtp-Source: APXvYqx+1HVleR9t6Yuyooq8t8xa7rjXdvZgR0S/2R2tmpjcPZ3EC1OYv8foVlifSxaWiiQHWGnQCar3duKMNpwhtnc=
X-Received: by 2002:ac2:55a8:: with SMTP id y8mr58557682lfg.117.1578392421291;
 Tue, 07 Jan 2020 02:20:21 -0800 (PST)
MIME-Version: 1.0
References: <1566206502-4347-1-git-send-email-mars.cheng@mediatek.com>
 <1566206502-4347-6-git-send-email-mars.cheng@mediatek.com>
 <CACRpkdZa_sQgvWC3ic0NxrVi9gS1cNTsV-wa-SDpA0e5kutBRw@mail.gmail.com> <1577022724.7468.20.camel@mtkswgap22>
In-Reply-To: <1577022724.7468.20.camel@mtkswgap22>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 11:20:10 +0100
Message-ID: <CACRpkdZUxpQ1tS9mKG9tc_U==M2BL9HwXt3DS1t413GGSEaVTA@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] pinctrl: mediatek: avoid virtual gpio trying to
 set reg
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Mars Cheng <mars.cheng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, wsd_upstream@mediatek.com,
        mtk01761 <wendell.lin@mediatek.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Dec 23, 2019 at 4:11 AM Hanks Chen <hanks.chen@mediatek.com> wrote:
> On Fri, 2019-08-23 at 10:57 +0200, Linus Walleij wrote:
> > On Mon, Aug 19, 2019 at 11:22 AM Mars Cheng <mars.cheng@mediatek.com> wrote:

> > This does not explain what a "virtual GPIO" is in this
> > context, so please elaborate. What is this? Why does
> > it exist? What is it used for?
> >
> > GPIO is "general purpose input/output" and it is a
> > pretty rubbery category already as it is, so we need
> > to define our terms pretty strictly.
> >
> Virtual GPIO only used inside SOC and not being exported to outside SOC
> in MTK platform. Some modules use virtual GPIO as eint (e.g. pmic or
> usb).

I would call that internal GPIOs, those are very real rails inside
the chip made with polysilicone so there is nothing "virtual"
about them. If the documentation for the chip calls them virtual
then explain in the driver that these are SoC-internal
lines so that everyone will get it.

Is the PMIC inside the SoC? I thought that was usually outside of it
in its own chip.

But I suppose there could be some interface to it in the SoC and
then that interface has this EINT?

> In MTK platform, external interrupt (EINT) and GPIO is 1-1 mapping and
> we can set GPIO as eint.
> But some modules use specific eint which doesn't have real GPIO pin.
> So we use virtual GPIO to map it.

OK I get it I think... just put these comments into the code as well
so we understand when reading the code what is going on.

> > > +       if (mtk_is_virt_gpio(hw, gpio))
> > > +               return 1;
> >
> > Why are "virtual GPIOs" always inputs?
>
> We set virtual GPIO as eint.
> It mean virtual GPIO only used inside SOC and not being exported to
> outside SOC.

Are you saying that:
- "Virtual" GPIOs are always and only used for interrupts
- Since they are only used for interrupts, they are always inputs

Then write that in a comment to the above change so we know
this context.

Yours,
Linus Walleij
