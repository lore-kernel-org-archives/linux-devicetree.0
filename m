Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211E5C28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 18:21:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0394320747
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 18:21:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JaXZicmL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729882AbgEFSVN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 14:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729477AbgEFSVN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 14:21:13 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF89BC061A10
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 11:21:12 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id g14so2155618otg.10
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 11:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D2taJJRTg2UNCEqvPUHeisc7wYhhWEOMV6TUWaPz7kg=;
        b=JaXZicmLPCbQ1s4wEPLd+sV+a4q0wnzPoifqdGpBSL8D7Z8GrydmvQGqC8UT22nL2I
         WZa/znMpgXW+q41TZVo9zK6nCks5GJUhUduUAyuXBbeNVH+4lSu2c8TsdwQTipW46XE8
         2YvlAWllyGrBAxfyw+wCC3p4SEMWY6eYou+Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D2taJJRTg2UNCEqvPUHeisc7wYhhWEOMV6TUWaPz7kg=;
        b=pe59p636996ICmOYMk7FaGjIgKP+QydRhz29wDBrDre7KzNtGAxqE8Po6gK4nYBTYC
         oHy8i4hpsy5gxcwM8wpvsqCkmOKzUQ3GNfPTSy3oPfohspMD9UDoCULdh7iMe/aoob28
         GfT0jniabenaVHe53pBor4Jr5wm1SOOA+W4jfHZaGAf6B13ZkND9WhfIMil1reG5Ix+K
         /DB+1yeyFb5vxDWKSezQHahu/cr41d9SRIKoEBE3Ucvq9HQDiBxvtL+0Sk6Sg0BLRmv5
         7tJcwjZbHTBsW4JyRwlUpCPgKOx183jSeX5hE0EDNTU60Zz9+cPLg2EXNGKwsgu1N8jT
         6qhQ==
X-Gm-Message-State: AGi0PuasGnJ1Mt3nUY+L99Kx5ToR+eoH9+KOONOXfoEw1ylh3S8U41GE
        vqTKXCyYr0kJUQwEIQ0q1FlmJJDfzYxxSFK8B+ypAQ==
X-Google-Smtp-Source: APiQypInw39ygS3P/++U3PAE3LlMt925jYmNYdu8cvU7nnL+hmn3yH1R3d09MJ5VoLDPJl2XHnEM/8wYsJ8wMTKfCVI=
X-Received: by 2002:a9d:490d:: with SMTP id e13mr7509661otf.356.1588789271980;
 Wed, 06 May 2020 11:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200505140231.16600-1-brgl@bgdev.pl> <20200505140231.16600-6-brgl@bgdev.pl>
 <CAKOOJTzcNr7mc9xusQm3nCzkq5P=ha-si3fizeEL2_KJUOC3-Q@mail.gmail.com> <CAMRc=Md7gLMThfGF-7YLqW17MpMhU=UFbdTvfjbr9fFHTLir8g@mail.gmail.com>
In-Reply-To: <CAMRc=Md7gLMThfGF-7YLqW17MpMhU=UFbdTvfjbr9fFHTLir8g@mail.gmail.com>
From:   Edwin Peer <edwin.peer@broadcom.com>
Date:   Wed, 6 May 2020 11:20:35 -0700
Message-ID: <CAKOOJTxkcaq0bF34bcz3HZzqsNgfmJH=Hd+odNNMX5gDq4to=w@mail.gmail.com>
Subject: Re: [PATCH 05/11] net: core: provide devm_register_netdev()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Fabien Parent <fparent@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, May 5, 2020 at 11:46 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Re the last bit in priv_flags: is this really a problem though? It's
> not like struct net_device must remain stable - e.g. we can make
> priv_flags a bitmap.

Fair enough.

Regards,
Edwin Peer
