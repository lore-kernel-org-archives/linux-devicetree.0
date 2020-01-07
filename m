Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4C6C282DD
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 21:13:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D01DA2077B
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 21:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578431599;
	bh=Mu0zhx9ti4OUp/EdrAMXIrQy01N+AgLGZ/0oUsekZgg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=pBNe249xma4FY5nFboWfHCPTHWZtMqUXFVEzWKzEEWDO/69+AeZlTrr3Q9WUEFXoQ
	 5NikuCAJXbQmuJDnalEMOtsAAQH1v+bF7eWY+9ozBChJmCt/2kdijzttGKCqZ+xCe5
	 g/YeVbuhWcw1RfxJ8qa3TZOtkDZHaZkbY0EY7YtQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728739AbgAGVNS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 16:13:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:44858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727345AbgAGVNR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 7 Jan 2020 16:13:17 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 50B87222D9
        for <devicetree@vger.kernel.org>; Tue,  7 Jan 2020 21:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578431596;
        bh=Mu0zhx9ti4OUp/EdrAMXIrQy01N+AgLGZ/0oUsekZgg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HZ+ZEmZaxJOG4sJ6wCyRwffphyheNBiyMazVmMNLn+R7YnC9wfA8tao4JhjKl/TkW
         qjN33XFEy2GCq0s8KifroyEefD+6yD110qd1WZYLF+IB3kYfuah5ilzOwGY7pZj3Wj
         M8Ntiw7a1tysnwZEfyCjWqmdqCn+KPBHNuac6GhU=
Received: by mail-qt1-f173.google.com with SMTP id d18so961488qtj.10
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 13:13:16 -0800 (PST)
X-Gm-Message-State: APjAAAV7eC+ODEfvCzG2hyR1EERYeaHWCEpR88Wf33UC6u/rTCk2R0GK
        tcASZWZIAf73J2kcvuJjzZz6Ia9LCUIIxhEjag==
X-Google-Smtp-Source: APXvYqwDgmAjJGxgm7wk0h6HATAd7Cshh9FVAcgKcQjVPlOIjTq+cJCEaNcpcpLZPfTHcRLwSdZZOc90O30ygN3j8v4=
X-Received: by 2002:aed:2344:: with SMTP id i4mr893504qtc.136.1578431595537;
 Tue, 07 Jan 2020 13:13:15 -0800 (PST)
MIME-Version: 1.0
References: <CAA2QUqKK+XcR5oqpZPrMNnQmgk=BV7s05UR7Efc2kCcYUs8=2w@mail.gmail.com>
In-Reply-To: <CAA2QUqKK+XcR5oqpZPrMNnQmgk=BV7s05UR7Efc2kCcYUs8=2w@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 7 Jan 2020 15:13:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLgMJty+EgzEV-AfyWM7mKzWyB0X4ohxk5FUksMLcSL3w@mail.gmail.com>
Message-ID: <CAL_JsqLgMJty+EgzEV-AfyWM7mKzWyB0X4ohxk5FUksMLcSL3w@mail.gmail.com>
Subject: Re: [RFC] MAX_RESERVED_REGIONS hard-coded value
To:     Daniele Alessandrelli <daniele.alessandrelli@gmail.com>
Cc:     Miles Chen <miles.chen@mediatek.com>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jan 6, 2020 at 12:05 PM Daniele Alessandrelli
<daniele.alessandrelli@gmail.com> wrote:
>
> Hi,
>
> I'm using a Device Tree with more then 32 reserved memory regions and
> I'm seeing the following error while booting the Kernel:
> [    0.000000] OF: reserved mem: not enough space all defined regions.

How many do you have? Is that DT available somewhere?

> My understanding is that this is due to the hard-coded value of
> MAX_RESERVED_REGIONS in drivers/of/of_reserved_mem.c
>
> Googling around, I found this old discussion [1] in which Miles
> suggests to add a CONFIG_MAX_OF_RESERVED_REGIONS kconfig option to
> configure MAX_RESERVED_REGIONS. Rob replied to Miles' email saying
> that he would prefer MAX_RESERVED_REGIONS to be dynamic. However,
> later in the thread, it looks like making MAX_RESERVED_REGIONS dynamic
> poses some implementation issues [2]. At that point the discussion
> seemed to have stopped.

Not sure what the problem was as there's no code, but I'd guess the
array alloc and populating have to be done later (perhaps in
unflattening).

> Is there any chance for the patch proposed by Miles to be reconsidered?

A kconfig option would still be my 3rd choice after dynamically
allocating the array or just growing the fixed array size.

Rob
