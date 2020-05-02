Return-Path: <SRS0=YnW7=6Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFD4C3A5A9
	for <linux-devicetree@archiver.kernel.org>; Sat,  2 May 2020 18:16:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E268E206F0
	for <linux-devicetree@archiver.kernel.org>; Sat,  2 May 2020 18:16:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="C/6EcW8y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728161AbgEBSQZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 2 May 2020 14:16:25 -0400
Received: from mail.nic.cz ([217.31.204.67]:50222 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727988AbgEBSQZ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 2 May 2020 14:16:25 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 6751213F811;
        Sat,  2 May 2020 20:16:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1588443383; bh=JM0Qs6OyssLEEYd4o0Yhaj4I5fcibR1+ViasOiTSu/E=;
        h=Date:From:To;
        b=C/6EcW8yGk68wqRFvSvTUY3WsbvmHVnRVQv2DWI29CseTQ2lABYqkLjMvyN6kxdnK
         7LiH5sP49tGgIhqWGLrHFWjJcq6xLJPIUSXIbarT1DTi3ZB5plMDRr3/+JwE4KNzDf
         2qDS3/TIi639fb52sTylAKROiBVle3UfcAucwIgQ=
Date:   Sat, 2 May 2020 20:16:21 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        Pavel Modilaynen <pavel.modilaynen@axis.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dtc: Use better check for libyaml
Message-ID: <20200502201621.2b93dda4@nic.cz>
In-Reply-To: <CAK7LNARo7tErhQzxsOktwrrBcu+W5Wz4VqadrcyiTRHeL6-F4w@mail.gmail.com>
References: <20200501015147.32391-1-marek.behun@nic.cz>
        <CAK7LNARhK08CcDNij25PR0_r2A27Qx+psQp50_AgDJijexDAiA@mail.gmail.com>
        <20200501170816.2f95a2ad@nic.cz>
        <CAK7LNARo7tErhQzxsOktwrrBcu+W5Wz4VqadrcyiTRHeL6-F4w@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 3 May 2020 02:56:42 +0900
Masahiro Yamada <masahiroy@kernel.org> wrote:

> You missed to see the cost of parsing the Makefile.
> 
> 
> scripts/dtc/Makefile is parsed every time
> you run 'make'.
> 
> Even if you have nothing to recompile,
> it builds the tiny program in background.
> 
> This happens for 'make mrproper' too.

I missed this point by a large margin indeed.

> Maybe, file a bug report to your distribution
> if the pc file is strangely installed?
>
> ...

Very well, thank you for elaborating on that. Sorry this took your time.

Now that I know this, wouldn't it make more sense to decide
whether to build yamltree.c or not in config stage, eg. in a Kconfig
file? Because now it seems that pkg-config is being run everytime we run
make. I understand that it is much cheaper than gcc, but either way...

Marek
