Return-Path: <SRS0=bipS=ZI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F86C432C3
	for <linux-devicetree@archiver.kernel.org>; Sat, 16 Nov 2019 00:35:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E8B12073A
	for <linux-devicetree@archiver.kernel.org>; Sat, 16 Nov 2019 00:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573864502;
	bh=ZowElwrmsGrsNzdowivw08ySLvn8WkJT901VnVvmvGw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=HxqV6siF3EFhy2meLqyjLe0d9mRkMb5fMbUeU2tQ3exh89/7QDZ0/pH7sjeidnMS+
	 iiLS+9zaqTkabUGD5qUDUVMQUgKdC7Nw/Ks22PrpR3M1I4Gk9ShvEg6brI6hNuFHLA
	 3R/CRpnkKv9zY60mDu1S9GzlGgMUYjTPD5FWJpZo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbfKPAfC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 Nov 2019 19:35:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:56756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727089AbfKPAfB (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 Nov 2019 19:35:01 -0500
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4157B2073A;
        Sat, 16 Nov 2019 00:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573864501;
        bh=ZowElwrmsGrsNzdowivw08ySLvn8WkJT901VnVvmvGw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ygrAkebUlqZfkZp2vvd8sS0C0NiPPlF+KrDc5sE1QhRQcMKtqWyc1qsODSsjfTciY
         E+HUX8VoRveGntQIbUNNsniNJJ8ALcw5it4RnGImAImabL5ELsYByOSzRuth713yGZ
         XguNNc6kFrrEWg1AlZfNsRVuZpZSY+8GUNKz8rlc=
Received: by mail-qv1-f42.google.com with SMTP id q19so4460474qvs.5;
        Fri, 15 Nov 2019 16:35:01 -0800 (PST)
X-Gm-Message-State: APjAAAWjZLyTNqthUrzj2eaFyj3uZ3NFklY7GgjkrDEhtrlfDUcZ8VYt
        ZcAutlbGJ+rILUlfRrdYVlu/32SB59yt2Cyb8g==
X-Google-Smtp-Source: APXvYqxWUYJ0VE48z5aNU9FLHSWMIgzyDb+dTJpIrmDUhsIbuI6lda5haPFdPXIkYUkRAmM+TqYkVFiMmLlmrmaXVgM=
X-Received: by 2002:ad4:42b4:: with SMTP id e20mr2714620qvr.85.1573864500398;
 Fri, 15 Nov 2019 16:35:00 -0800 (PST)
MIME-Version: 1.0
References: <20191115195339.GR25745@shell.armlinux.org.uk> <E1iVhi2-0007au-2S@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1iVhi2-0007au-2S@rmk-PC.armlinux.org.uk>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 15 Nov 2019 18:34:49 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL3-gTeQqiVmiMCvx9hmDiuAYLP1TBdg_pDXgaERZwd6g@mail.gmail.com>
Message-ID: <CAL_JsqL3-gTeQqiVmiMCvx9hmDiuAYLP1TBdg_pDXgaERZwd6g@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/3] dt-bindings: net: add ethernet controller
 and phy sfp property
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        netdev <netdev@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Nov 15, 2019 at 1:56 PM Russell King <rmk+kernel@armlinux.org.uk> wrote:
>
> Document the missing sfp property for ethernet controllers (which
> has existed for some time) which is being extended to ethernet PHYs.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
>  .../devicetree/bindings/net/ethernet-controller.yaml         | 5 +++++
>  Documentation/devicetree/bindings/net/ethernet-phy.yaml      | 5 +++++
>  2 files changed, 10 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
