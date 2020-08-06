Return-Path: <SRS0=kUjg=BQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66972C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 12:29:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36D1322DFA
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 12:29:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="jcOMn0Ur"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729031AbgHFM3Q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Aug 2020 08:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbgHFLPf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Aug 2020 07:15:35 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4702AC0617A5
        for <devicetree@vger.kernel.org>; Thu,  6 Aug 2020 04:06:22 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id v13so25843198oiv.13
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2020 04:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zDiKZFm/DKBG3ZOKFXLxuBs2P7seO7llz6RT0NqT3bo=;
        b=jcOMn0UrBeP5geOnYnlQ8z4juZNEc9OXmo6IBcl6Rnq87ACgANLb3yILTOqmNAqrrA
         jI81kv8iXQ6fWMWXCDh+B+QWkIiKBN94CEsTNJ9EcfUy06qWF3YFszenTvh6BLJgXvbE
         FhZSUlOw7CwnZRe2+S/1YAiZkxEvKmMJRDMHybduKwXYk2EvW5VlaP0IpXR2+OR8UT3w
         OtxpnVRG06smB+Z+LlpYRbZmHp8oWGibEe4LMCbYOOEhl3hP4EUcjb9jJVtOLY3nQxRT
         WhTH0QPiPU7CfiY5W7FDhuT/YiMwFvtqVCbDBdVa0phkZuQ+91Hix75pFFPKtfir9UI6
         vXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zDiKZFm/DKBG3ZOKFXLxuBs2P7seO7llz6RT0NqT3bo=;
        b=aGGGEVLOKiGaPZ3QSo4NYfid04EmIYhMR5oS5FDOVPzdro22hbzsM/nd2Y08tdt+Ej
         9mgap4t/g6CXjVfKXQndoF71Jk2XkLYCEl2ZXuH4qyKxme24X896XeauyduZvn38sBHZ
         v/ptpUvuGQfU6INhcnLJU7M/DSb+816i4FG/TBq9XxjCdRwFCBtKHqdoKXK276qGp3Ev
         rr8oNLTA+L4hQzJGiTfWKc9/ZhonX8JeRUVYXt3orH1Q9mNq88TuIbtjP7iy2Zt1l76x
         2yZMdUEihEPfF12G30gSBQ42ET5AE02wJoqpHgQ3L85gUE+vRsyB+2cild8ia5gxw+54
         CzcQ==
X-Gm-Message-State: AOAM5337hQhM9z277wHxFUhdF94tNASndzVFZ3VJn6eG0Xx8Ws4Cw1K7
        EGgPRGiXewAVnF4x0DmCRkmW9iyDZZ9r3VAWtkcEKA==
X-Google-Smtp-Source: ABdhPJyVlbMTsMQFzsrlc2hcmjITWeegvU4Gjtb6ZL3RWPK683BES2aE4HFBq4sNHPg8JcbDApxNkBr+pzHHua8sFr8=
X-Received: by 2002:aca:6708:: with SMTP id z8mr6388273oix.96.1596711976097;
 Thu, 06 Aug 2020 04:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200503201823.531757-1-robert.marko@sartura.hr>
 <20200503201823.531757-3-robert.marko@sartura.hr> <20200504073914.GQ1375924@vkoul-mobl>
 <CA+HBbNEiB+o4KxonAu4-ra+P11Yb649v6AFaPjFc8JQDQ8T=CA@mail.gmail.com>
 <CA+HBbNFsZ-v_2cMhDNGnQXTFaqsjGzB+1rAS3=_CLQhd0N4OKQ@mail.gmail.com> <20200609161903.GE1084979@vkoul-mobl>
In-Reply-To: <20200609161903.GE1084979@vkoul-mobl>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Thu, 6 Aug 2020 13:06:04 +0200
Message-ID: <CA+HBbNEiU8ubZLK2fP-STgTyRXf4F80OfO7aQ0_FHPKgUkqjBQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] ARM: dts: qcom: ipq4019: add USB devicetree nodes
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-kernel@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jun 9, 2020 at 6:19 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> Hi Robert,
>
> On 09-06-20, 16:45, Robert Marko wrote:
> > HI,
> > Vinod can you maybe pick this?
>
> Sorry can't do.. this needs to go thru Bjorn..
>
> We are in merge window so it is too late for that.
> Bjorn can pick this for 5.9...
Hi, can this be picked up for 5.9?
Driver and DT bindings are already in 5.8

Thanks
>
> >
> > It would be great to have nodes in 5.8 along the driver
> >
> > Thank
> > Robert
> >
> > On Fri, May 29, 2020 at 11:36 AM Robert Marko <robert.marko@sartura.hr> wrote:
> > >
> > > On Mon, May 4, 2020 at 9:39 AM Vinod Koul <vkoul@kernel.org> wrote:
> > > >
> > > > On 03-05-20, 22:18, Robert Marko wrote:
> > > > > From: John Crispin <john@phrozen.org>
> > > > >
> > > > > Since we now have driver for the USB PHY, lets add the necessary nodes to DTSI.
> > > >
> > > > Reviewed-by: Vinod Koul <vkoul@kernel.org>
> > > >
> > > > Bjorn, I have picked the phy and dt binding, feel free to apply this one
> > > >
> > > > Thanks
> > > > --
> > > > ~Vinod
> > >
> > > Any chance of this landing into 5.7?
> > > Driver and bindings have been merged, but I don't see DT nodes queued.
> > >
> > > Regards,
> > > Robert
>
> --
> ~Vinod
