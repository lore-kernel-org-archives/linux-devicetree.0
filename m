Return-Path: <SRS0=u7up=3N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BFCC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 20:23:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE0312081E
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 20:23:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="eqqiUcBN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388730AbgAXUXp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jan 2020 15:23:45 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38763 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387480AbgAXUXo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 Jan 2020 15:23:44 -0500
Received: by mail-lf1-f65.google.com with SMTP id r14so2025205lfm.5
        for <devicetree@vger.kernel.org>; Fri, 24 Jan 2020 12:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YNUNzci7Ki+kYYCPvb39XVTgjfk5mcI92JUtukf799o=;
        b=eqqiUcBNVVH+UrA+DM3vLI5nS815gkneczHy+NGnuiq3u2HqT3jXnATb3eUDRR0GQO
         4vhlHlDPiiL772CNPAMzt7U0uuZgh0C0WRdblM4zctdf4R4P5COJNKEnppD+cgWFjWuG
         UhNX+3otnjoeMnIk8Eu5aV39oo0SUmgI6x4FHrQsttiGslEol8mXa5msrnfUOfthAt9F
         2SWMdciNoyytzAofnwUOrpSyBSMD2gBICMpHgqW4xFKp1daMjuC7pJgBS3xGq+yh0SYx
         1nzPpy9kkj4R/xCGmgN7cfKKIKqH2cDL/1L5gcnO5n9yN3WfJmDaqL02PD69OmM6KGNi
         2P2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YNUNzci7Ki+kYYCPvb39XVTgjfk5mcI92JUtukf799o=;
        b=r/0/BbbhehKuq5FfpDrRSJfhlS1vw7CsbxStapwy4QanEgsjjvmV8t15/Y9ub/Ibjw
         88bJC3XCn+K95SOVj5oe2dOsM5BC4T44ZS9HqHxidERSBlk9hUJ2DKlMY5ZMiW6f5U7R
         1LI9aJdNzAlubkKOQS022Sw7HbNeTj+kG6TAhDR4GSAQfi+r7HrPAwo+JpTLDLX3zTCV
         KEeG4TkhlxolW9V4YQj8sBVgasuIoB3SYtrK8GUCRmgsr0R3vnLQmmHh2ufV60zmniSy
         4kWKuIwqIrJieT/4BzXj8/yibcsEnezqe5Vzo09qn5/41L+tBrWP4+esYWDlAu7tlhq/
         zdFA==
X-Gm-Message-State: APjAAAVAlqy1JXJqSGhPd1MtF4jTHDt55COBUZSnigpX8P1AWvW6lrlp
        O0ya7O26PEqFEvGXvyYznNXzRg==
X-Google-Smtp-Source: APXvYqwKZYJUPJeYgEpmrE/NTzuIH587Zpaxvsd190XRkzqqSgxGbHOlCFcDOcIq6d06uBMsG0OmNA==
X-Received: by 2002:a19:3f16:: with SMTP id m22mr2266907lfa.116.1579897422600;
        Fri, 24 Jan 2020 12:23:42 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id d11sm3386928lfj.3.2020.01.24.12.23.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2020 12:23:41 -0800 (PST)
Date:   Fri, 24 Jan 2020 12:11:40 -0800
From:   Olof Johansson <olof@lixom.net>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, soc@kernel.org,
        devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Collabora Kernel ML <kernel@collabora.com>, dafna3@gmail.com
Subject: Re: [PATCH] dt-bindings: fix compilation error of the example in
 marvell,mmp3-hsic-phy.yaml
Message-ID: <20200124201140.oczzqz2xplbq3abe@localhost>
References: <20200124105753.15976-1-dafna.hirschfeld@collabora.com>
 <CAL_Jsq+7E6B181hYn_6yNE53Mf+jiQ+o6pGDotwGX=m+GysW4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+7E6B181hYn_6yNE53Mf+jiQ+o6pGDotwGX=m+GysW4A@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jan 24, 2020 at 08:08:58AM -0600, Rob Herring wrote:
> On Fri, Jan 24, 2020 at 4:58 AM Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
> >
> > Running `make dt_binging_check`, gives the error:
> >
> > DTC     Documentation/devicetree/bindings/phy/marvell,mmp3-hsic-phy.example.dt.yaml
> > Error: Documentation/devicetree/bindings/phy/marvell,mmp3-hsic-phy.example.dts:20.41-42 syntax error
> > FATAL ERROR: Unable to parse input tree
> >
> > This is because the example uses the macro GPIO_ACTIVE_HIGH which
> > is defined in gpio.h but the include of this header is missing.
> > Add the include to fix the error.
> >
> > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> 
> Fixes: f6f149604eef ("dt-bindings: phy: Add binding for marvell,mmp3-hsic-phy")
> Acked-by: Rob Herring <robh@kernel.org>
> 
> Arnd, Olof, The above commit is in your tree. Please apply this.

Applied.


Thanks,

-Olof
