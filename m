Return-Path: <SRS0=PToE=Z3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F844C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 07:32:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9432206DB
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 07:32:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K8ZOZvMX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbfLEHcv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Dec 2019 02:32:51 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:37236 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbfLEHcv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Dec 2019 02:32:51 -0500
Received: by mail-ua1-f68.google.com with SMTP id f9so535171ual.4
        for <devicetree@vger.kernel.org>; Wed, 04 Dec 2019 23:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KsELQrnPZOtejoY9i2DcdQh6UW42pUNNIY62CtBGNDc=;
        b=K8ZOZvMXPg14WS3fQd+RBECESqh0GW7rIgK55uh1NaVW8NgJN3M4lK6gsY58FUpz3r
         579brr/4qJcNLtpDf/74ELIW4MFLn9VdIRC7C49tRzxW9Sw4D4hxc5fCDlJJ/GRcXRKD
         rH4zot3jChLf4F049+6kdx643bIVmP2Zlkd7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KsELQrnPZOtejoY9i2DcdQh6UW42pUNNIY62CtBGNDc=;
        b=WT50zx3GTOuxLfIA+xBMLsJs9IGy9jnxxs5B9XVRWcBGST3vgFK4JNgwl7tmiYMfMr
         SF4Z2QKza4CTgNJR9rW5rZzp2CTJiEgF3veiKS0B4SP8nR2uLA4Y+AS0wrr866SZHOee
         4ahXLpcwRqxk/kjm7b8s6jm3x8JuyGgFHtveGQFjnh5xyfZhtd/F9EkJ3/l+FokAsxMq
         lMZY0DgzHUhfQcvErVXUnTShkwVr3LppsTE8UUyjo/jzCD9Oe32qujsGaWY2SwOZYQnT
         ZdOwHudVw6W8hKQt5JQ3YwFoFICpUBI2sv6ioLh9g5+XkTtXOq0Q4UWCuuQpNKeJ+7VC
         FgoQ==
X-Gm-Message-State: APjAAAUaq/neLgGUWY1FILue2zooWxL0PqNfUG+4YRKiViKLeZEJE9Io
        QCuJQkC5PYV6VwwU+ybesOMyqqMHrGxZKvFcdR4Ahg==
X-Google-Smtp-Source: APXvYqyS8tC5o4S3M/3z7o7qG0IUB3RnkhEI2T8kq01FR6LqqglwErSaRr7uwnavrsj6wAcTuw+4FblqisXXxbVB9r0=
X-Received: by 2002:ab0:3487:: with SMTP id c7mr4227890uar.25.1575531169645;
 Wed, 04 Dec 2019 23:32:49 -0800 (PST)
MIME-Version: 1.0
References: <20191203101552.199339-1-ikjn@chromium.org> <20191203165301.GH10631@localhost>
 <CAATdQgCqYrd_aXN5GDsso+F3WadNx3DQKK3Efk3tgkrv2VXjyw@mail.gmail.com> <20191204075533.GI10631@localhost>
In-Reply-To: <20191204075533.GI10631@localhost>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Thu, 5 Dec 2019 15:32:38 +0800
Message-ID: <CAATdQgBcuJenS2VSm+y4Yhn5mWE1P0CGJQ3NRdoe68dd2SRPGg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb: overridable hub bInterval by device node
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        GregKroah-Hartman <gregkh@linuxfoundation.org>,
        RobHerring <robh+dt@kernel.org>,
        MarkRutland <mark.rutland@arm.com>,
        AlanStern <stern@rowland.harvard.edu>,
        SuwanKim <suwan.kim027@gmail.com>,
        "GustavoA . R . Silva" <gustavo@embeddedor.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Dec 4, 2019 at 3:55 PM Johan Hovold <johan@kernel.org> wrote:

> > > > @@ -257,6 +258,14 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno, int inum,
> > > >       memcpy(&endpoint->desc, d, n);
> > > >       INIT_LIST_HEAD(&endpoint->urb_list);
> > > >
> > > > +     /* device node property overrides bInterval */
> > > > +     if (usb_of_has_combined_node(to_usb_device(ddev))) {
> > >
> > > Not only hubs have combined nodes so you probably need to check
> > > bDeviceClass here instead.
> >
> > yes, you're right, I didn't think of that case:
> > if (to_usb_device(ddev)->descriptor.bDeviceClass == USB_CLASS_HUB &&
> > ddev->of_node && !of_property_read_u32(...))
> >
> > Or is it better to check bInterfaceClass, for composite devices with a
> > hub interface inside?
> > if (ifp->desc.bInterfaceClass == USB_CLASS_HUB && ddev->of_node &&
> > !of_property_read_u32(...))
> >
> > I think checking bInterfaceClass is better.
>
> Yep, that seems better (but please use two conditionals for
> readability).
>
> But related to my question above, why do you need to do this during
> enumeration? Why not just set the lower interval value in the hub
> driver?
>

Because I want device tree's bInterval to be checked against the same rules
defined in usb_parse_endpoint(). e.g. although hardware says its maximum
is 255, but the practical limit is still 0 to 16, so the code can
print warnings when
bInterval from device node is too weird.

> > > > +             u32 interval = 0;
> > > > +             if (!of_property_read_u32(ddev->of_node, "hub,interval",
> > > > +                                 &interval))
> > > > +                     d->bInterval = min_t(u8, interval, 255);
> > >
> > > You want min_t(u32, ...) here to avoid surprises when someone specifies
> > > a value > 255.
> >
> > yes, thanks.
>
> And I guess you should really be honouring bInterval as a maximum value,
> right?

Yes, right, not masking.

>
> > > > +     }
> > > > +
> > > >       /*
> > > >        * Fix up bInterval values outside the legal range.
> > > >        * Use 10 or 8 ms if no proper value can be guessed.
>
> Johan
