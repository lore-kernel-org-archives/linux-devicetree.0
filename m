Return-Path: <SRS0=wYQk=7F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872ECC433E0
	for <linux-devicetree@archiver.kernel.org>; Sat, 23 May 2020 10:16:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 639D320757
	for <linux-devicetree@archiver.kernel.org>; Sat, 23 May 2020 10:16:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=flowbird.group header.i=@flowbird.group header.b="LbBFgRwc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387741AbgEWKQO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 23 May 2020 06:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbgEWKQN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 23 May 2020 06:16:13 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D0B0C061A0E
        for <devicetree@vger.kernel.org>; Sat, 23 May 2020 03:16:12 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id m18so15622773ljo.5
        for <devicetree@vger.kernel.org>; Sat, 23 May 2020 03:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flowbird.group; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mIlsCm+rT7kwukl7URSohYQng9/Du2FKvF/brHcNKyU=;
        b=LbBFgRwcOR6Ca4VmxtLY6AETfa6Cgnvp4i0ehkN6dL7ZYgrj6J93hNdGr6BTTg/2gZ
         26Iwme03fRE71vy24tzHeCcP3oe8Vj/n9mRNa8mZHFvBtUlffKPVagv95kiORZ1EiZF6
         KrHW9woREVPGdHW6hqk/0Dl9ca4ztL4DhS5zeSxp2qsArsTeg3xsG1h3qc6RypXfOy9S
         TrNUL48c6pn129JsIF86DTS8GMDwA51qz8JUeLJ+3LEllA1b+RGIERq1oQhZ3kMFqYCE
         bzduouN192nrwQG7+h6hNQnkb8V8Ly3Dh7JCjHKgw8IF5sAGY/eXf+ImhIpJ02zScS/z
         73Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mIlsCm+rT7kwukl7URSohYQng9/Du2FKvF/brHcNKyU=;
        b=b40hc9YX1JkLv6G7MWmbvuQU0ia3oCvseZyoL50NTjdUFWoGoUhX1i/5OB0Ijda0Ji
         W3OQfHVl2UepCt4AU3e0jTpLqaDzQ1GEBESVWSc+ROx23eZnu2kAafO1l1nulZpu9Nfd
         rQo2mnMkXjdT8mkfNFHAwlKH7BCGJu36B/LT4vvzSuXE/P9b62Kz/swxWOR8GmDgnAwx
         z6iuAUJ4EOvavCL8315fBaZC7vM5R7XvMAX2VI146wTTGgKLpGFUpjUAQ5uzKMkX+jjt
         eT7TCZKS1W7AlOaimU1jPOpqqHSYRu+PpfWtKBSEVFr8V0eO7nChta0NVV3ap1jFpwCS
         qG3A==
X-Gm-Message-State: AOAM532L/fSj54/O1LVia9gu86J2qFkqI/5+k3kQ/GsaVM32xqNfiUg6
        3O1vKbsq91IlQkv3kjv0ESE9Zjgz8ShZH0KT2GjP/A==
X-Google-Smtp-Source: ABdhPJw8d/bvq8DbyNF5EpiICZHfXIYlz3Eh+N9RghL1ws1sCknCrX1LgohK7PlMoVRSX56UsyFqADF4Nqv+onyTp/s=
X-Received: by 2002:a2e:6c08:: with SMTP id h8mr7938646ljc.375.1590228970396;
 Sat, 23 May 2020 03:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <1589963516-26703-1-git-send-email-fugang.duan@nxp.com> <1589963516-26703-3-git-send-email-fugang.duan@nxp.com>
In-Reply-To: <1589963516-26703-3-git-send-email-fugang.duan@nxp.com>
From:   "Fuzzey, Martin" <martin.fuzzey@flowbird.group>
Date:   Sat, 23 May 2020 12:15:59 +0200
Message-ID: <CANh8QzxfVtk+3N=5UttjXK6CR9ZQ=qD-Twu7y-zKabLJZGQ2yQ@mail.gmail.com>
Subject: Re: [PATCH net 2/4] dt-bindings: fec: update the gpr property
To:     Andy Duan <fugang.duan@nxp.com>
Cc:     "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

>  - gpr: phandle of SoC general purpose register mode. Required for wake on LAN
> -  on some SoCs
> +  on some SoCs. Register bits of stop mode control, the format is
> +       <&gpr req_gpr req_bit>.
> +        gpr is the phandle to general purpose register node.
> +        req_gpr is the gpr register offset for ENET stop request.
> +        req_bit is the gpr bit offset for ENET stop request.
>

More of a DT binding changes policy question, do we care about
supporting the old
no argument binding too?

I don't think it actually matters seeing as the no argument gpr node
binding was only added recently anyway.
But it was backported to the stable trees and
Documentation/bindings/ABI.txt says

   "Bindings can be augmented, but the driver shouldn't break when given
     the old binding. ie. add additional properties, but don't change the
     meaning of an existing property. For drivers, default to the original
     behaviour when a newly added property is missing."

Myself I think this is overkill in this case and am fine with just
changing the binding without the driver handling the old case but
that's Rob's call to make I think.

Martin
