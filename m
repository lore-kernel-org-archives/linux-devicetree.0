Return-Path: <SRS0=7PY0=2Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED2DC2D0CE
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 22:44:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E99F922B48
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 22:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578091467;
	bh=L5tbYYAmX0Q/f7Xsyf5mSs9zpysnyX9RcFdoD/DisA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nu0MZOW2iPN2EWC/7rYRvdpG+9N3ZYqQOAg2BAnysgsyIMV3w7mzny4Lgz2rL9n6X
	 2+xE4SpenNsYe6CoWiTze1LZERhQKIAN8CPXKX+uhedBViUOBVNla0NfXO03IBQxWS
	 Ww8GF76mzzFQmcpI19HmBq7FXCQfiYNfpdY0Hcrw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728834AbgACWoX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 17:44:23 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:41416 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728794AbgACWoX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 17:44:23 -0500
Received: by mail-il1-f196.google.com with SMTP id f10so37860001ils.8
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 14:44:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zL7lXPN6EMBAnzsaSWaNynU9nZ8SUyCQnluhdY1uUrg=;
        b=J+wb1OR58GlbCprSiFXCM3V1nUGGgL0j1SfKK2GrgrkJefN+wnEVFSfF8a0CeGh4EU
         vcaxgW7Rlq9AUw01c1CjVtyfhtM2m5Tg/PqCB7niLmKVr7Wp/tsHPBsVrFaIw9MnnLZ6
         d5lpeIYDDFw00c40H6k6ggGBnYMuhE0+re5nokZogW1MHqXnVlPemsm8FvlcEv4ZQoKN
         EENWX8fYniAbsK00mDQb8QE5OSm+I82S4g75PuTutJKiEGkmYVw/rBG+Kx0Q1oWfNAp9
         EoZRPwRp9Og64oLIkNedJo13F5Jbfz9CR7HQLfS2QqPymtZ8gOrcVvDirGuMbOZVM1Em
         LcTA==
X-Gm-Message-State: APjAAAVmnxdTROSAoPxsgRqoBpDqVptJOmuSrTleE/jzN8XbltDG9AL0
        3OdPiSa1S3fdBbmFLyhrU1tPtEE=
X-Google-Smtp-Source: APXvYqxBevlfsE5dl4ZjSaFdIGxv5qYtNkNgzt+54bbbdbGaAXu4NQs2dmALH5bxcQDaPvGKHXichA==
X-Received: by 2002:a92:7ec9:: with SMTP id q70mr54526601ill.185.1578091462599;
        Fri, 03 Jan 2020 14:44:22 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id k16sm21390575ili.35.2020.01.03.14.44.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 14:44:21 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 15:44:20 -0700
Date:   Fri, 3 Jan 2020 15:44:20 -0700
From:   Rob Herring <robh@kernel.org>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: Document the Xylon LogiCVC
 display controller
Message-ID: <20200103224420.GA24988@bogus>
References: <20191203150606.317062-1-paul.kocialkowski@bootlin.com>
 <20191203150606.317062-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191203150606.317062-2-paul.kocialkowski@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue,  3 Dec 2019 16:06:04 +0100, Paul Kocialkowski wrote:
> The Xylon LogiCVC is a display controller implemented as programmable
> logic in Xilinx FPGAs.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../display/xylon,logicvc-display.yaml        | 313 ++++++++++++++++++
>  1 file changed, 313 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>
