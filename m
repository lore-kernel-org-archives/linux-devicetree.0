Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90542C33CA2
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:15:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B2B320678
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578500149;
	bh=tgKCSs93XA7uX1BwWyzEqIecwBft+EvXOTzII3f3es8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2M0ucLYJMbavIk9conz/GGkBOyIXob5EtbvhvpqMaiLNMBDUsBXkmmzPZtLuX3AIp
	 91uVUaQB7SNymvWQkll+BVy/OZ6zWVUPzidbn1vwFzC9y4sci9nN+7+OoJE9moKibs
	 T6joebS7uviFBhULpeAZFmCJeKrDIOF44ORVv6Ng=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727428AbgAHQPt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 11:15:49 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44101 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729217AbgAHQPs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 11:15:48 -0500
Received: by mail-oi1-f195.google.com with SMTP id d62so3067466oia.11
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 08:15:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0DnqajaRB9CjW+Edkai5OQTOGJN4IE2DCdpMlqf4PPI=;
        b=QiTCO/4w8ceXP9cT1uS6fxmjdGpKd5zxjb+agM38oXafn4WYB4SelfTKPCtuMgLbQn
         ZYNvC+9QLWCvr8A/ziG1+aLvHk/zhQMu22NYtKJYVg0RXmcwvnA33QAtV6rgqamZepcU
         pQxmbYa/4iy/gwKQYNoNixtmgifVyS1Mxx2HzgNETIKoo8zvbffsofq6/F72Qjvh+3Vz
         9Gj0wwkeWcYBLJlwxEoC0cMEMwKLP8+EeCHDwakWUDniBR7XiaReIlj1b3n9jUDdbXuf
         vD7EEp5qF3cGvO/zhE7Vkz3OZQB8AnAhluvNdsA3JU4jmX0o5uxni0tYQ3JXLbauCMP5
         JMlA==
X-Gm-Message-State: APjAAAXPBfKM/Xv7YV9faSIeNcrKpXNbKma83CrtGuhMIvo0nnoZbphW
        JzGcaf1O1blKmgxYnTojSdFy+54=
X-Google-Smtp-Source: APXvYqyck9hyKP2ua9WQGghgO03TY6a4WyB1HPlj729ksLfws0E2/NWHChcXJWo5TVrahzzosZDKKg==
X-Received: by 2002:aca:5f87:: with SMTP id t129mr3779241oib.36.1578500146949;
        Wed, 08 Jan 2020 08:15:46 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a74sm1223809oii.37.2020.01.08.08.15.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:15:46 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:15:45 -0600
Date:   Wed, 8 Jan 2020 10:15:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/13] dt-bindings: memory: Add Tegra194 memory
 controller header
Message-ID: <20200108161545.GA10129@bogus>
References: <20191222141035.1649937-1-thierry.reding@gmail.com>
 <20191222141035.1649937-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191222141035.1649937-3-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 22 Dec 2019 15:10:24 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This header contains definitions for the memory controller found on
> NVIDIA Tegra194 SoCs, such as the stream IDs used for the ARM SMMU and
> the IDs used to identify the various memory clients.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  include/dt-bindings/memory/tegra194-mc.h | 410 +++++++++++++++++++++++
>  1 file changed, 410 insertions(+)
>  create mode 100644 include/dt-bindings/memory/tegra194-mc.h
> 

Acked-by: Rob Herring <robh@kernel.org>
