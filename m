Return-Path: <SRS0=vHNE=6K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F05C2BA1A
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Apr 2020 07:00:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D55A220700
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Apr 2020 07:00:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5J2XM51"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgDZHAc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 26 Apr 2020 03:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726179AbgDZHAb (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Sun, 26 Apr 2020 03:00:31 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C11DFC061A0C;
        Sun, 26 Apr 2020 00:00:31 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id z2so15392924iol.11;
        Sun, 26 Apr 2020 00:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QqYXi0qprT2rxEAtWajLAu2VmMobHTp4511WhSWWgXY=;
        b=D5J2XM51avFUCxgpWCV8sS6eek7cEVRH3Ddk7T2AuPeGirRnI4qHT/pR+5Mz+YzIVV
         jjtzVNxyavHtJQSaKO2Dge2lNLeBiMTvfsNf9o/IDk0zxLHzp/FKcxUs2U51bXrD5EBd
         u5/YdGZ8zP76NzILvZM6flmgLfTmovegCENHbnGS3I/nMOHyICPjx4aGMDfzzoo5e+Nf
         xTdzHdREslT4xuq8lgWZPvswOiTO2sqsqNgoGdvq8UbNYRvWCnGlr67J68k4cup7M6b6
         43vy64J5CEKV0cm7LF+mMwcbH/Bb2y3Mt2jk+W1KFFW8ybfVUtSTz1k6FrmnJCsbxlEK
         /Y4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QqYXi0qprT2rxEAtWajLAu2VmMobHTp4511WhSWWgXY=;
        b=Xdev52BifprMwNVIxPVROaAE9WHXur4euZ0hIsTTUfytxE3JC6grj0Oe6PoQ60rc+3
         CMy/I3cYtq1DhRpXTXLJx5Lkvzn6V6PEYswt71tJkL6PPOOopA8zx7Rqz56/Vf8BdYZ9
         hZ46Q29cFvuyQ2bZhOQokhnoXzvGGwPhC0bgFffpxOeq/PP1jSQbmwAPPKSfNZgoGkoM
         VtMrBCEZEYQCj4l7kOqTT4oh5S3EgR6Q1VyeUqOLYF27BqQf8LXsZ17yXDDDkJUW/5Ik
         oC4tREaS5eZM6kHHt1tiFc4aW3TB6mrS3FJZeh69C+Dngx3dugLrygdEDOaaCKWlBY3F
         DfsA==
X-Gm-Message-State: AGi0Pubk3vK1Uq+i/TDfMIhjn7C2SQskjXfWOXRIeP70ksuK1u4bBp6C
        B6uzSKBd46doKibaS8KMUMBQLObBwpja+CJE9lY=
X-Google-Smtp-Source: APiQypJ0ylly85UlUwamAj9ktaUCHzrLGowbhQNl/cvxF+WQi3eDu2ErZxzBZWSyHtoj7TCIcw2DMhXaQ/68HLXBavM=
X-Received: by 2002:a02:2428:: with SMTP id f40mr15634676jaa.49.1587884431179;
 Sun, 26 Apr 2020 00:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200401013851.16227-1-peter.chen@nxp.com> <20200409143205.GA15163@portage>
In-Reply-To: <20200409143205.GA15163@portage>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Sun, 26 Apr 2020 15:00:20 +0800
Message-ID: <CAL411-rfxO-88aPaiDcjW+ri+RKMFz=C6tkNMztWYA-+uNvopA@mail.gmail.com>
Subject: Re: [PATH v4 1/2] phy: cadence: salvo: add salvo phy driver
To:     Oliver Graute <oliver.graute@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>, robh+dt@kernel.org,
        "ABRAHAM, KISHON VIJAY" <kishon@ti.com>,
        devicetree@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        jun.li@nxp.com, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Apr 10, 2020 at 12:30 AM Oliver Graute <oliver.graute@gmail.com> wrote:
>
> On 01/04/20, Peter Chen wrote:
> > Cadence SALVO PHY is a 28nm product, and is only used for USB3 & USB2.
> > According to the Cadence, this PHY is a legacy Module, and Sierra and
> > Torrent are later evolutions from it, and their sequence overlap is
> > minimal, meaning we cannot reuse either (Sierra & Torrent) of the PHY
> > drivers.
> >
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
>
> Tested-by:  Oliver Graute <oliver.graute@kococonnector.com>

Hi Kithon,

Rob has already acked the dt-binding patch, would you please merge
these two patches,
thanks.

Peter
