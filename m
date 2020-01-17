Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD83C33CAF
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 00:57:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B4FE2072E
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 00:57:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="KvEFe/oP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733308AbgAQA5J (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jan 2020 19:57:09 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:38768 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729351AbgAQA5J (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jan 2020 19:57:09 -0500
Received: by mail-io1-f65.google.com with SMTP id i7so15700089ioo.5
        for <devicetree@vger.kernel.org>; Thu, 16 Jan 2020 16:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qxvKFjNlmm2YdNSGQw/t2H4ugTVLAvz4laRQaFal8lM=;
        b=KvEFe/oPSc/2vbeoAoO8Cv0bwwOn3KLVCs/6kRN3PwcgZSGV+n/Wrb6aVEmAOMogOn
         h4pA9N57WVBjf7QbLbPqFcTaMsjUi3/A+t+S4/iE/ZhV3vIpsdqKP3hgGTIfZOeMn6Zj
         oB3j6VcpKGXeOZ/wQRITOkn/RxiSiCIbeoTcYaERKW2EZulydgGpr5xyrQq2vPGIJjXH
         +YG4ZkqYnyLGXbu+khhWczvpAHPjL7jdDj2oAsP0aKA+OhXfoaXlcWDtvn51snQ+Yauu
         4q/7+cEgg2hJEV4Da8Cs0O17uRRNO5ZQrlm7uZz3RC/I3f4ZsMnIoYe5xJfBJ/xHhOpP
         MalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qxvKFjNlmm2YdNSGQw/t2H4ugTVLAvz4laRQaFal8lM=;
        b=EwQjAkgYqftAsr2R4H03Y8XRdhPYYEUhtN1rhADWQJje4u/sL45CHTMGsTk4TqZgYE
         fCuoEqMaPl/HAcLs+55rA5x7o3rP9PbsoMnPOsygjA703MB57DqzKGkOYKDwQwNXthJv
         V5O21g8JR6ueFd9MaoBFQbFhkSZ79aX9K/zF4M+2R2D6QFK0jqAjpEm9O0/lv5HO/Iw+
         MF3kpckjB3ygkFYsLxyW2ka42hD3nYAS/fuG6rYscmt+NkVNktsvNLIa7XlKWjW3SzvA
         hy9OlGeHiey0wBu6zylSHkIv77618V8U1erEvcPmsRZuUYYkIUeAnDuW0/wPpdgEfoU8
         6MnQ==
X-Gm-Message-State: APjAAAWg1GW6cCXKjurhwPtuert8bx7KTSCSxtVmxQspCvkI8D7lN/DT
        84I3Klr0VkB0nSKWYiVUioDw19rofJIH0FjAi250Aw==
X-Google-Smtp-Source: APXvYqyu4SPZDC4zObU6mM2JzTlSxF5CffLtlPXclG31ycWTRt+tto82A8i6lJJF1bygD3jkMFbplVRmLMMnnOilohQ=
X-Received: by 2002:a02:ca10:: with SMTP id i16mr1119516jak.10.1579222628788;
 Thu, 16 Jan 2020 16:57:08 -0800 (PST)
MIME-Version: 1.0
References: <20200110063755.19804-1-zhang.lyra@gmail.com> <20200110063755.19804-3-zhang.lyra@gmail.com>
 <CAOesGMjNkVpTOhSrLUKjNZnKFk55DTgg29QzVBEFVh3Z=Ra+cQ@mail.gmail.com> <CAAfSe-tx+S_tc1y0c5wobQy2xygNr01b3LOqQ4FQtHoDNhHNeA@mail.gmail.com>
In-Reply-To: <CAAfSe-tx+S_tc1y0c5wobQy2xygNr01b3LOqQ4FQtHoDNhHNeA@mail.gmail.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Thu, 16 Jan 2020 16:56:57 -0800
Message-ID: <CAOesGMhNxkyAYMeHSRAuxzR51-5eHZ278LLVYe-3jaS7EKa-jw@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] arm64: dts: Add Unisoc's SC9863A SoC support
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Jan 12, 2020 at 5:44 PM Chunyan Zhang <zhang.lyra@gmail.com> wrote:
>
> On Sat, 11 Jan 2020 at 01:41, Olof Johansson <olof@lixom.net> wrote:
> >
> > Hi,
> >
> > On Thu, Jan 9, 2020 at 10:38 PM Chunyan Zhang <zhang.lyra@gmail.com> wrote:
> > >
> > > From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> > >
> > > Add basic DT to support Unisoc's SC9863A, with this patch,
> > > the board sp9863a-1h10 can run into console.
> > >
> > > Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> >
> > You reposting a patch that we have already applied, and there's also
> > no changelog for it in the description.
>
> Oh, I have to explain a bit.
>
> I was expecting an email which inform me that the patch was got merged.
> That's the reason I resent this patchset.

Ah, yes -- me too. This was a combination of two things:

1) The patch was originally sent to arm@kernel.org, not soc@kernel.org
2) I bounced it to there to apply it using PatchWork

... but, it seems that the bot won't reply to patches that have been
bounced, only those who were originally sent there.

In this case, I should have made a manual reply -- I've gotten too
used to the bot and relied on it doing it.

> About the changelog, this new patchset actually had a cover-letter[1]
> in which I documented a little changes (which was not important now).

Not sure why, but I seem to have missed it. Maybe because it was 3
patches on v5, and I didn't notice that one was now a cover letter.
Anyway, all good.

I'll also apply 1/2 shortly.


-Olof
