Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A08AC33CA9
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:53:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4BD07207FD
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578955986;
	bh=oCwqlQnFH8P7dUM4myakN3iHVtlhaPt6WwUh+Q5T3zE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nZq9tmjpPzjJbBGaaO4D34ljhoQrwKnQZoBoOhBJ1gYd+jw6M8Iw1Xsfq1VEIfln7
	 NbcEhWVJqRacj9KbW1+WB7KPV9BgrU0dxJtfu08M7dykm9z2nMSf41cHku3XHcqz/5
	 kGMq9gphRl1ktuYwdyXxs51ndbDzLxX8dNnnGUss=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729133AbgAMWxF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 17:53:05 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46276 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729092AbgAMWxF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 17:53:05 -0500
Received: by mail-oi1-f194.google.com with SMTP id 13so9944988oij.13
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 14:53:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uDkx2r+nuwFxUKoOrf7KVMmZfrPFwS8DDF7iAYkk30E=;
        b=L5v2wfNE4eEpms1WKoG6F78sLtL6BAOZgvmwvofIuXbSAxAPUpQfjadalpMJT6B07d
         u1zuxXqMGyybPcPis8nS5LkobyKPtz4yDz9T4XhpjHo8SKP1ycNwwAARQMVEy6g2Yuxc
         MqgO+fNnFhsWdwbU1IK3wT5um4Ko/zkeKeQeKLLumXP/IgkBfyxrIbvehHn5V9bXM5oW
         WT4eK6OorV6roMthxCYvBigbpuyEUDESjjFrrVOWiLE+iTYLK0aI7u3WYiZR9e7MuxPV
         IXpdxVZPtXmFiZQ5WNy8Ipmdv2N8Oye3SowNpUxmCaC7OordtvIkrBvn/qNq1FCsUHG4
         AtPg==
X-Gm-Message-State: APjAAAU3NYiFiFVmefqf7UTaft1lg9F2aNiy8zHaZ+utoj5a00yttHOq
        rY2utiwkY7WQ+XpV4uKFN1vpzl4=
X-Google-Smtp-Source: APXvYqxZC85P9AzFqnLMoR3YGIz1ChPZgpLLJdHnsxysXjKbCu+VVJXnRAc9I24B5aahRWuS51CLVA==
X-Received: by 2002:aca:cdd5:: with SMTP id d204mr14596473oig.134.1578955984514;
        Mon, 13 Jan 2020 14:53:04 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o101sm4654653ota.69.2020.01.13.14.53.03
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 14:53:03 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220b00
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 16:53:03 -0600
Date:   Mon, 13 Jan 2020 16:53:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        linux-ide@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v4] dt-bindings: Create DT bindings for SATA controllers
Message-ID: <20200113225303.GA18742@bogus>
References: <20200112111751.21984-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200112111751.21984-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 12 Jan 2020 12:17:51 +0100, Linus Walleij wrote:
> I need to create subnodes for drives connected to SATA
> host controllers, and this needs to be supported
> generally, so create a common YAML binding for
> "sata" that will support subnodes with ports.
> 
> This has been designed as a subset of
> ata/ahci-platform.txt with the bare essentials and
> should be possible to extend or superset to cover the
> common bindings.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v3->v4:
> - Drop any master/slave terminology: SATA has one drive
>   per port or up to 15 drives behind a multiplexer.
> - Drop RFC notation, this feels pretty finished.
> ChangeLog v2->v3:
> - Split off into its own RFC patch
> - Only support sata-port@ in this binding
> - Opt to support devices 0..14 on the sata-port in
>   line with ahci-platforn.txt not modeling the port
>   multiplier in the device tree at all.
> ChangeLog v1->v2:
> - Use ide@ and sata@ as node names.
> - Use ide-port@ and sata-port@ for the ports toward the
>   drives, rather than letting the subnodes be the drives
>   themselves.
> ---
>  .../devicetree/bindings/ata/sata-common.yaml  | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ata/sata-common.yaml
> 

Applied, thanks.

Rob
