Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF79C32771
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 20:17:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 23EAE22522
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 20:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579119424;
	bh=cRc55CvYpQobK998sX1otex4cVjAmzAwwrwAjicGMNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=CVadLygowkhAwrNpWv7U0SxQKCzJAmNX5m0Qc23e2kfAelyvbgRHGRT5QMJevmHM6
	 Ff04WUJG7LtZbd18i5IWTUteUv0LpDzym1eUvT8bviPA4H2t7KkunlEfSiereFOja3
	 p4HKZhckP3PjIPBfqTBFYlV7IOgmGuWmg4rc4Ok0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbgAOURD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 15:17:03 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44036 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgAOURD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 15:17:03 -0500
Received: by mail-oi1-f193.google.com with SMTP id d62so16659501oia.11
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 12:17:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2myqp2GrpN0pfUan1rnrXmWGh+MWOgXmKRvJ9E5COqI=;
        b=aYNH/RWQq0NOB2sUdB89zMkKCbFR86O04syr4KOUFWBvOXv6hJ7OjEcTU8K2XAVM9T
         HYruNXak4aFpYRt/x6Lx1zknygzGJ4UktS3B+EnIDdHNG2L/ijxDNHbck9hNjZQ/PMXi
         mT3WMW7H6TH7Vo8oOdqNCfBuNa6AdNx2ZL6ozp/Mj169GunOoz1QLPILoy8ecMdN4iIT
         ABmQONXmfYMcgiN/owvkaWSZR8J9zBSMjfnZIuLw+l1HSewRC+t8JKAGRmGzN6XammZV
         gHkuxGsmISH1A5y9+pyjPm4vQznUkqL6h3KVhaE99jJiQSTQs9yrVtav/FHx2k7f+LhR
         uwtg==
X-Gm-Message-State: APjAAAXB7LWoL75dr1PS+y+xgIikFF5Zrly+r3JSSTAQedMCypifCURJ
        EqA5POTja+/T16nv/jYrxQZ06R0=
X-Google-Smtp-Source: APXvYqz1/oQhawl5LKl/qMARiMJQwxe71uT4xbpYAzSMtVaM16XodK97FvzgH2apmuoR1voaRIuhOQ==
X-Received: by 2002:aca:b183:: with SMTP id a125mr1317060oif.83.1579119422283;
        Wed, 15 Jan 2020 12:17:02 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k17sm6070663oic.45.2020.01.15.12.17.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 12:17:01 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22062a
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 14:17:00 -0600
Date:   Wed, 15 Jan 2020 14:17:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Guillaume La Roque <glaroque@baylibre.com>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        johan@kernel.org, nsaenzjulienne@suse.de,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
Subject: Re: [PATCH v7 1/2] dt-bindings: net: bluetooth: add interrupts
 properties
Message-ID: <20200115201700.GA26654@bogus>
References: <20200115101243.17094-1-glaroque@baylibre.com>
 <20200115101243.17094-2-glaroque@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200115101243.17094-2-glaroque@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 15 Jan 2020 11:12:42 +0100, Guillaume La Roque wrote:
> add interrupts and interrupt-names as optional properties
> to support host-wakeup by interrupt properties instead of
> host-wakeup-gpios.
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  .../devicetree/bindings/net/broadcom-bluetooth.txt         | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
