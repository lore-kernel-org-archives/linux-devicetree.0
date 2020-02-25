Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B7BC35E15
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 21:46:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B994220675
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 21:46:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qEa2RI30"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbgBYVqS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 16:46:18 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40521 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgBYVqS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 16:46:18 -0500
Received: by mail-oi1-f194.google.com with SMTP id a142so861678oii.7
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 13:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OaHhaeQJNk3b1iGwrho9OQW7vTtILFRlnGdHwBGHiXA=;
        b=qEa2RI30+eu6y+QG1RZcKaHE63SwriP8FaoGgwhahp/jQ21rAuyfZyhnI39ZaQZPTK
         x+hjX7xFI4kZoMYbClW5pfDwOlru9laun8LG52dDvbs36nVfcRIuXJFMcetpsWABJkwy
         joYb3JrrYXZ548+Zal0Q8PMlSZGWpJ8BEpfeWWDdjA3JtgPwNzcOW3qFf8maZZdozYQU
         ux2WYmwTQB3ZIWRqlN5rqV5Jog6VUM0bEhy9mjUk2yD89nAIT8/dEbYlqT+pKaj4U2Dn
         0bRx+Fv2YVyzelsP/9ttTUm4knli3ewZHxsXIwT+oFehxZ9gsP9iP/b8vez+UUdwDQE0
         +OFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OaHhaeQJNk3b1iGwrho9OQW7vTtILFRlnGdHwBGHiXA=;
        b=kxCTKWhCZEDWeunkjasfM2cQ8qVE8KlgD72P078aQunsmGUAPCKHZaTm57wwKM774F
         wzePDRJmB3IAIbAsE2d2l3dCkc6gcrbtD2rcWpxUfY5dNFMpH5gHIIqtwC3B7qRxUOrN
         ADQfjFzcG9CCnY6uVTcQHmtxBjmvlcLuYNzubnl7B3Vx7FipuU1icVYIcAo703AD7ZnU
         LAVOBEgE9PRjbiej/t/6Dle/EJiTND3na8HXijOMnciMaQ+k8dbp857pGNrAoqyEj93E
         zZjbadIlbPHbu/MwTdwiwLYokBDIslNFdtXrz0Qh/QGLkMUYsiQKlSIfpDFXtB5Rsl3h
         HOAg==
X-Gm-Message-State: APjAAAXwlP8Z9cfh5iUEAg13w6igWizCPY+MxIYdF+aC3ksi+eoE2HXt
        BLr71E49+o94SuJfg+EjDGe9rw7UstXXG4/06HtMZg==
X-Google-Smtp-Source: APXvYqzYfJMSifN7KgTz+K+MGlTU91tf+QULFSdmvn4DI2zL4yI7bwfwIGxnV/JfXP88xbSYOEqcTpG9Tgu9zHpTakg=
X-Received: by 2002:aca:ea43:: with SMTP id i64mr786584oih.30.1582667177181;
 Tue, 25 Feb 2020 13:46:17 -0800 (PST)
MIME-Version: 1.0
References: <20200220055250.196456-1-saravanak@google.com> <CANcMJZBQe5F=gbj6V2ybF-dK=kRsGZT2BX9CBJiBFoK=5Hg-kA@mail.gmail.com>
 <CAGETcx88H+aFTt=Vp8Q1KVOZYEaD3D6=i5WN8tWmnBAs1YdY1g@mail.gmail.com>
In-Reply-To: <CAGETcx88H+aFTt=Vp8Q1KVOZYEaD3D6=i5WN8tWmnBAs1YdY1g@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 25 Feb 2020 13:45:41 -0800
Message-ID: <CAGETcx_n=fZYaY5q6yZRJR9daTXm2Ryz5frfZr3n1BKf-pXCEQ@mail.gmail.com>
Subject: Re: [PATCH v1] of: property: Add device link support for
 power-domains and hwlocks
To:     John Stultz <john.stultz@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        Todd Kjos <tkjos@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Feb 20, 2020 at 3:30 PM Saravana Kannan <saravanak@google.com> wrote:
>
> On Thu, Feb 20, 2020 at 3:26 PM John Stultz <john.stultz@linaro.org> wrote:
> >
> > On Wed, Feb 19, 2020 at 9:53 PM Saravana Kannan <saravanak@google.com> wrote:
> > >
> > > Add support for creating device links out of more DT properties.
> > >
> > > To: lkml <linux-kernel@vger.kernel.org>
> > > To: John Stultz <john.stultz@linaro.org>
> > > To: Rob Herring <robh@kernel.org>
> >
> > Just as a heads up, git-send-email doesn't seem to pick up these To:
> > lines, so I had to dig this out of an archive.
>
> Weird! Left out the main person who'd care about this patch.
>
> >
> > > Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> > > Cc: Kevin Hilman <khilman@kernel.org>
> > > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > > Cc: Pavel Machek <pavel@ucw.cz>
> > > Cc: Len Brown <len.brown@intel.com>
> > > Cc: Todd Kjos <tkjos@google.com>
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > > Cc: Mark Brown <broonie@kernel.org>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: linux-pm@vger.kernel.org
> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > ---
> > >  drivers/of/property.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> >
> > This does seem to work for me, allowing various clk drivers to be used
> > as modules! This removes the functional need for my recent driver core
> > patch series around the deferred_probe_timeout (though the cleanup
> > bits in there may still be worth while).
> >
> > Tested-by: John Stultz <john.stultz@linaro.org>
> >
> > Thanks for sending it out!
>
> Thanks for the Tested-by!
>
> Rob,
>
> Can you pick this up for the next rc?

Friendly reminder.

-Saravana
