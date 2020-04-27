Return-Path: <SRS0=/Yzg=6L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85951C5519A
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Apr 2020 09:24:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 630C22063A
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Apr 2020 09:24:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PqkwdOV9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgD0JYL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Apr 2020 05:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbgD0JYL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Apr 2020 05:24:11 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63808C0610D6
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2020 02:24:11 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id v2so6781246plp.9
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2020 02:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=62sxPbsrxCm2fvIpJ8tpB4+O/E6FAUO1ubRiSS5aMQs=;
        b=PqkwdOV9sWGTFWFEwpK93utJLjznxrq9WB2g7q3+71ll4BiIeRtuPb+ynL2zXTe+Nr
         m1FfLsqEjWI8q0Ir9zWeZBQ1TzbPYwbUz1alfss91jOdDLIcQnVwOHgqhJnjSXatqq8n
         TCA/aUeHD5zilUdC3r50QHTAo7ow6caq+LkPzrGFb5FjU3YbfpUYUU0TvEQcBYSsfx08
         OsL3fcXvxI1Gcvat0hjax14vIxLSD/CeFJ0AMJ5SD3/IqM6mPuQxuU+KfC1JDHRmktRv
         bNwzP6r4PlUzL7vbiwLeUR6qcr+VJ26wQ5jfmfm7C/ODd3PFJ80O+/A9HzGO+7gkYSrL
         ISFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=62sxPbsrxCm2fvIpJ8tpB4+O/E6FAUO1ubRiSS5aMQs=;
        b=qAqcBNOnTSV7dpEtmNq/csxD4Mmw695ySSQgvK6DtMCKBauWa+kt3DmInK2OAolQP/
         pQBiBSvA/2aeXbdR0O0tZlf+nUk/L1B0iC4XtxIxmvQIDqPhWxjbQqFn9I4w52QBHHrX
         +aatPo8BH14s6BEWyBw8WfzntgW0tIUS7Tcm7jDR4dXW2YFzS7K4DGRPT0gbtM5baO77
         3YRcU+DxOGbBZvcFvWAg9KnrS19TL77RWtuxn2YhYe+UU6PSrFISkLjmXpnMCrHlm/DJ
         +ZaCGR8sQRmyUbeA7+VMOv2ZOoYIy8JxAm2VQquDo7VBCX3v54JiHGeRhytVK7ASmj19
         RzHA==
X-Gm-Message-State: AGi0Puabq9P807MiL0pcWpkeZOWnd0Fq+v713zSYwaTD1776tFQ9Sk+m
        ewdeg4JTmUO0hzZM+NCvvD9d3g==
X-Google-Smtp-Source: APiQypLoeg39tmPVj837ge/fvjEjwcaLKfMYIysT4UHtoPUQOPFkSmOF2zWgF54zZIpO9qIWwNDClQ==
X-Received: by 2002:a17:90a:1501:: with SMTP id l1mr21988435pja.82.1587979450837;
        Mon, 27 Apr 2020 02:24:10 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id l37sm10807183pje.12.2020.04.27.02.24.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Apr 2020 02:24:10 -0700 (PDT)
Date:   Mon, 27 Apr 2020 14:54:08 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 10/10] cpufreq: dt: Add support for r8a7742
Message-ID: <20200427092408.g2vpc6j2c6it4x2i@vireshk-i7>
References: <1587678050-23468-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1587678050-23468-11-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdV6J-_gBkzhUXtA8OrxhJVzyrAqjA8oeGJGBp86X-C3Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV6J-_gBkzhUXtA8OrxhJVzyrAqjA8oeGJGBp86X-C3Nw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 27-04-20, 11:22, Geert Uytterhoeven wrote:
> Hi Prabhakar,
> 
> This patch should be merged through Viresh's cpufreq tree (CCed).
> 
> On Thu, Apr 23, 2020 at 11:41 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add the compatible strings for supporting the generic cpufreq driver on
> > the Renesas RZ/G1H (R8A7742) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Prabhakar,

Please resend the patch with all dependencies to me so I can apply it.

-- 
viresh
