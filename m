Return-Path: <SRS0=YuQm=5V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A56DC2BA1A
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Apr 2020 01:24:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D163C206C3
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Apr 2020 01:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586049880;
	bh=V5gCxUvEJ9mnQOJwCbGwFUzCWNl5LXu0txZgNmpLEtg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=l/ibUfk02f9zQf+dBOadS2oclu+vRXXSX8nKv9drQxaEzjPBMrHFUHMp0Km4meiw+
	 67BXePloYAmw5cdHoT76eVVW+WmBXpQkUrDtv016z5lQeR7VDkdn8rVCQF1esZSuca
	 raE6Gm+a1h1GUw5/jeixKvGeSWK91f9LwHWoPJX0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgDEBYi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Apr 2020 21:24:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:54386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726258AbgDEBYi (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 4 Apr 2020 21:24:38 -0400
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 812C92070E;
        Sun,  5 Apr 2020 01:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586049877;
        bh=V5gCxUvEJ9mnQOJwCbGwFUzCWNl5LXu0txZgNmpLEtg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Aa+F7Vw0XlhtJ/R5A6JusfA5mhVg+2EGtuEL5Uq338n8MQtpKY2dzASJAFHH7d8u7
         rzFxoo4nqLgzN1vMRrxT3REvcg9jn6EH+5llKmDbuE2FowIS3fRUSxtOal9zvcKrls
         6Fy17RS2y5YTW7LLUotQgIld88vsjZAeeYv1669s=
Received: by mail-qv1-f53.google.com with SMTP id bu9so5680083qvb.13;
        Sat, 04 Apr 2020 18:24:37 -0700 (PDT)
X-Gm-Message-State: AGi0PubU/qa0F7Uxd/0l9AHU8jXKTQH/z5O9ZsBiDHp5vxZcaVj1VgCW
        trJyBddwHEoV9RsFeiDkhOXuRIzbE1gVXunkvQ==
X-Google-Smtp-Source: APiQypI0ZGR68OihzLNkyx14nt40AypnK76tnx6sNhl2gvnALhhrx7pk4NzDbSwls9817CuxOQZToy1qP42xbW6i5g0=
X-Received: by 2002:ad4:4829:: with SMTP id h9mr14262204qvy.135.1586049876596;
 Sat, 04 Apr 2020 18:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200403185640.118569-1-thierry.reding@gmail.com>
In-Reply-To: <20200403185640.118569-1-thierry.reding@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Sat, 4 Apr 2020 19:24:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLsCHJOuYBdh33eouu3VhwYzv5XR5wop8QAAi4jXP2xcQ@mail.gmail.com>
Message-ID: <CAL_JsqLsCHJOuYBdh33eouu3VhwYzv5XR5wop8QAAi4jXP2xcQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] of: reserved-memory: Various improvements
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Apr 3, 2020 at 12:56 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Hi Rob, all,
>
> this is a set of patches that I've been working on to allow me to use
> reserved memory regions more flexibly. One of the use-cases that I have
> is an external memory controller driver that gets passed one or two
> tables from firmware containing a set of EMC frequencies and the
> corresponding register values to program for these frequencies.
>
> One of these tables is the "nominal" table and an optional second table
> is "derated" and is used when the DRAM chips are overheating. I want to
> be able to pass these tables as separate memory-region entries.
>
> So what this small patchset does is make the reserved-memory code adapt
> to this situation better. On one hand, while the DT bindings currently
> support multiple regions per device tree node, it's slightly unintuitive
> to specify them. The first patch adds a memory-region-names property
> that allows the DT to specify a "consumer" name for these regions much
> like we do for things like clocks, resets or the reg property. At the
> same time, a new alias for memory-region, named memory-regions, is
> introduced to make this more consistent with other bindings.

It's just not worth supporting both flavors (forever). I don't want to
repeat gpio vs. gpios. Let's just stick with 'memory-region' and allow
that to be more than one entry.

I'm not a fan of *-names, but fine.

Rob
