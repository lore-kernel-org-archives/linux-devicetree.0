Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFF3C38A24
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 03:48:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6700620725
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 03:48:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Huotxyr7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgEGDsY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 23:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725809AbgEGDsX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 23:48:23 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E47C061A0F;
        Wed,  6 May 2020 20:48:22 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id s9so3221463lfp.1;
        Wed, 06 May 2020 20:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/au1P+LKp7UGcITXckfJpNTDS25YxZ0TSqVFN3ZEiRA=;
        b=Huotxyr7xcPRjx/eppGI6o40oTPYZhC35YkjqS0Da0hrwxfHfTCZhoDtvy4zBkmskK
         GMDnOdfrMe6v7b2f3CBvtF35xxZYgnxACnwHUfsy/3GbYLP6aEuNz8lWMWeQazz6A6d1
         KuR5nZ8A1FKFSFIE4x9uHLPjUE8m140aKcE4cIaME/hUEJAxNk8IqWMZ2RJOkDl9zEiF
         04ycUOZEja5swK+kchyPVRD9/bxZE/pDMfx1RgSRXTvqC+lQ3dv/J752Migi2a/u40f9
         Rra2BU7s5vP6JkKC6YTNZpgHwmJaliY+RQlDY4GdJsaFMbV+CjVbchpf32E5nbscHmLK
         uOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/au1P+LKp7UGcITXckfJpNTDS25YxZ0TSqVFN3ZEiRA=;
        b=T1EXeEzAWLelRNIQsyd/cJb87l55/5QJvCq4hAXWwaZH9Oi5oGC/OuvfGlYL30xnHB
         7gQu85vOcOW2lrc24D6XOJU5pQiuzAvHUd6yHmQUA2PRpPsr9Uu48HcxiHhtavIhunyS
         bWiEEa3PlDEQ7uW/xPiA5uGlo6hZqHwzHlxCNoUjGTEXiywi4AC0u6wqvNfs/Q2tisAo
         XoQsqp5nbwY3zOSko07sIZbxNF98VeEYdRXx/+PHgknv7y20aFrZEYD2s/v2Zd2V1Wvk
         3wSH9UrOuWlFLg6ORhHMmFjSNT8+BbbaTSliXrVWNhERHXXeghDUTXLo7hx+h1OwX4Ei
         k7IA==
X-Gm-Message-State: AGi0PuZvnNGTYHkB08GPESoHXujkQlWfHKnBhbGCgDqSgcdKXYGZLcMC
        R5/8t+ViSxUXeS8e7K5nXptk6xFC5aI+T9h9TcA=
X-Google-Smtp-Source: APiQypKGKAViU1DdiQYgx/qoKOwR6hee8Kj1KrI9t7atXw+zCve75aBN2UiRyE1F5LQNGot+nOkW2RgNsyyWjFgqooU=
X-Received: by 2002:a05:6512:10d0:: with SMTP id k16mr7385994lfg.71.1588823300383;
 Wed, 06 May 2020 20:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200401013851.16227-1-peter.chen@nxp.com> <20200409143205.GA15163@portage>
 <CAL411-rfxO-88aPaiDcjW+ri+RKMFz=C6tkNMztWYA-+uNvopA@mail.gmail.com> <d91e7b91-4197-3f5e-ba0d-854281b94403@ti.com>
In-Reply-To: <d91e7b91-4197-3f5e-ba0d-854281b94403@ti.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Thu, 7 May 2020 11:48:08 +0800
Message-ID: <CAL411-oycAoGFwStjcr4Xjxat=p0syketTLf7yN+ntBrFsCY-Q@mail.gmail.com>
Subject: Re: [PATH v4 1/2] phy: cadence: salvo: add salvo phy driver
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Oliver Graute <oliver.graute@gmail.com>,
        Peter Chen <peter.chen@nxp.com>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        jun.li@nxp.com, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Apr 27, 2020 at 8:47 PM Kishon Vijay Abraham I <kishon@ti.com> wrote:
>
> Hi Peter,
>
> On 4/26/2020 12:30 PM, Peter Chen wrote:
> > On Fri, Apr 10, 2020 at 12:30 AM Oliver Graute <oliver.graute@gmail.com> wrote:
> >>
> >> On 01/04/20, Peter Chen wrote:
> >>> Cadence SALVO PHY is a 28nm product, and is only used for USB3 & USB2.
> >>> According to the Cadence, this PHY is a legacy Module, and Sierra and
> >>> Torrent are later evolutions from it, and their sequence overlap is
> >>> minimal, meaning we cannot reuse either (Sierra & Torrent) of the PHY
> >>> drivers.
> >>>
> >>> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> >>
> >> Tested-by:  Oliver Graute <oliver.graute@kococonnector.com>
> >
> > Hi Kithon,
> >
> > Rob has already acked the dt-binding patch, would you please merge
> > these two patches,
>
> Sure, I'll be merging it this week.
>

HI Kishon,

I still not find it at your next tree:

https://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git/tree/drivers/phy/cadence?h=next

Would you please merge it, I have patches based on it, thanks.

Peter
