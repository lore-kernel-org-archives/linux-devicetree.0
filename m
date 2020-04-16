Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F23DC2BB55
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 00:58:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FA49208E4
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 00:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586998731;
	bh=NjTvNrxjlHFScy4ebnKzSnM4jSIs1SlF2paT+ZaYBeI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=ri7hT/pn2Ewy48ZIFYRWQB6YZ3zdDBF+9iuZkCiOZierFFB8vhbnvot3YMvv/oFDs
	 2lOGz2EkInj/DGNrQ5AoqvHhFn0TpZK8JdOvOuqdWbNmzOeXO7h3rWnXWWNWAyAbyy
	 jdXwoAQMrvk3NIvAsnpcD9cnZ9EwNx2f773hzj+Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389076AbgDPA6t (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 20:58:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:42272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728100AbgDPA6r (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 20:58:47 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE0CF208E0;
        Thu, 16 Apr 2020 00:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586998726;
        bh=NjTvNrxjlHFScy4ebnKzSnM4jSIs1SlF2paT+ZaYBeI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tdrhhcUfkIKCM0s18mbeSn5SP9h0vWFC+0x6fkNf029GOJlZMaz2gbXoDORxN6UGT
         Xk64ZR1+eHjz/HTPl+uZpf4Fq6rSk56xrWIJTvM4SVpKHaWp4yR/YfgpHAKb1prJeW
         RTN8+ZqrEHL1ytzFowd4LpDpB9ps6wXa3Y8MCfHE=
Received: by mail-qt1-f182.google.com with SMTP id l13so12390124qtr.7;
        Wed, 15 Apr 2020 17:58:46 -0700 (PDT)
X-Gm-Message-State: AGi0PuaxHTfiRVMXvt5bYs/eDBZ/PxT0rYXJss5oysmspdR980/EGdwh
        CVfAN8LxqTnTPgiY8pmzyqldcX5s6d+4FEguOg==
X-Google-Smtp-Source: APiQypIb8Qh+U7+DzcXL5pISte9uAUnyZWYerl12Hfw9dl6hFAs7Ug63drp+s8XNKQa3pH3auFFQ0DRFz+hVTsEascg=
X-Received: by 2002:ac8:39e5:: with SMTP id v92mr24067936qte.224.1586998725925;
 Wed, 15 Apr 2020 17:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-3-thierry.reding@gmail.com> <20200415162449.GA1842@bogus>
 <20200415233532.GA211822@ulmo>
In-Reply-To: <20200415233532.GA211822@ulmo>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 15 Apr 2020 19:58:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK6Ku3woyc+9kxzjN_fih_ygWWnt3EFdVRi6UBd7=2iFw@mail.gmail.com>
Message-ID: <CAL_JsqK6Ku3woyc+9kxzjN_fih_ygWWnt3EFdVRi6UBd7=2iFw@mail.gmail.com>
Subject: Re: [PATCH v6 02/14] of: reserved-memory: Support lookup of regions
 by name
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Apr 15, 2020 at 6:35 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Wed, Apr 15, 2020 at 11:24:49AM -0500, Rob Herring wrote:
> > On Thu,  9 Apr 2020 19:52:26 +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > Add support for looking up memory regions by name. This looks up the
> > > given name in the newly introduced memory-region-names property and
> > > returns the memory region at the corresponding index in the memory-
> > > region(s) property.
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >  drivers/of/of_reserved_mem.c    | 19 +++++++++++++++++++
> > >  include/linux/of_reserved_mem.h | 11 +++++++++++
> > >  2 files changed, 30 insertions(+)
> > >
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Hi Rob,
>
> thanks for the review. Do you want me to apply this and patch 3/14 to a
> stable branch and send to you as a pull request? That way I could use
> that same branch to resolve the dependency in the Tegra tree for the
> memory controller driver patches.

I think it is fine for you to just take the patches.

Rob
