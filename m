Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D6A8C352BE
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 19:01:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 363242074D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 19:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586890905;
	bh=b1he5tzCKBuvEV3+b/4NFiXC2UVZ13c9FvtDGLl5VK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ddFYWbRN2RspmIywCu3Qm/LCRHg326hFsKsFchpyf6zZJmCkdO2yu1jwRcbv0Btpg
	 OYr9KYVkZ4lcNzoNvA5NUBYMemCHqxt4wWMKbHx2OOJSFQK2YF0I7D3adfyOBZ9aoH
	 ky12TGl/22xO52ZA3BVB/EXWqbvETm84Ig42KhVI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504594AbgDNTBo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 15:01:44 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38396 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504590AbgDNTBn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 15:01:43 -0400
Received: by mail-oi1-f194.google.com with SMTP id x21so5176785oic.5
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 12:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nqVv+ORxaWxg2NdPce1X/0L1DRMcHdT+zeS1PlpMDpw=;
        b=BldCC1ZppeHQEMO6XYs0TcXg4BMTYgKYc9cqa6LotD3G5k2I8LzzbTb56CgSEgeYzW
         /j/eU/uuZuRpL40GHvoX+B3lvEngAyjOKOj2fzMmlEf6gSCLYwqwNSTzop6c5up2RYNT
         J9swdhOKzEgCkDXMefblz1/4wAL9ZB/1CltRlGOVVdBko5pZ4gMwofdrBX5Ms8BWFGCB
         MHpVyD1UlGrmlyZXDqn04eUpY2PTR/zbo+UzkLCV7ngmAUwOZNtXYLTT06Xo+XpuJYDv
         EQygfRJMvmgoR/17i5mSrd0Qh+beB7bK/2eTXXhwEJDv8uCK6BbN8LSfPvbK4ijFUL5x
         At3g==
X-Gm-Message-State: AGi0PuYlahu0M3b4UezJ+g3/j4kdZvLfFXObFBX0HbVlc3FwA+HI6K7O
        029+REtNhQYDqS//0QkIgQ==
X-Google-Smtp-Source: APiQypLrFqniMD1Dn3d9gmjF72MsX++LcJM2BM+neB+4j0XMv9ZzWmLZuNaGysAHg/DplIXj3arcxg==
X-Received: by 2002:aca:eb4e:: with SMTP id j75mr16790839oih.18.1586890902457;
        Tue, 14 Apr 2020 12:01:42 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i21sm3913255ooe.26.2020.04.14.12.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 12:01:41 -0700 (PDT)
Received: (nullmailer pid 20276 invoked by uid 1000);
        Tue, 14 Apr 2020 19:01:41 -0000
Date:   Tue, 14 Apr 2020 14:01:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Stefan Mavrodiev <stefan@olimex.com>
Subject: Re: [PATCH v2 35/36] dt-bindings: display: convert
 olimex,lcd-olinuxino to DT Schema
Message-ID: <20200414190141.GA20217@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-36-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-36-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  8 Apr 2020 21:51:08 +0200, Sam Ravnborg wrote:
> v2:
>   - use "ic2" node name in example (Rob)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stefan Mavrodiev <stefan@olimex.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/olimex,lcd-olinuxino.txt    | 42 -----------
>  .../display/panel/olimex,lcd-olinuxino.yaml   | 70 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 71 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
