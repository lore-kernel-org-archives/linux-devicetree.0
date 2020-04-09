Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51248C2BA2B
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 14:32:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 193C92078E
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 14:32:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYnrmjIY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbgDIOcJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 10:32:09 -0400
Received: from mail-ed1-f43.google.com ([209.85.208.43]:44428 "EHLO
        mail-ed1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727435AbgDIOcI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 10:32:08 -0400
Received: by mail-ed1-f43.google.com with SMTP id cb27so2207662edb.11;
        Thu, 09 Apr 2020 07:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VYwDDpHalN4TmJxXJgoc++jRpDXmGt1tukthPPht+D4=;
        b=rYnrmjIYLPGLQTVbXdel5on7euxIJgiyvFMLgPNINgf+RShpuH/bGxZ4eCOwmGR6CK
         vVMCkwvbfychsyfA5Jw/n8gzi5tbEqPHP+aqj0STNkrjg6haDyQELFyCMFFXtdN/5ygU
         L8HhZmJAU99+xBGELI/76AbpPGlqo0mJuwTjo9H+xIrGMGLRbAe6kU2f7jZkD5SWIuUn
         evj4WKqdLxqbJxwXJ2PCnSROncZLgXFP3vZILDCgOUUXRfG9lxLB0pJbkJ678/nGyfel
         JRpwiMxr7/cLFrYbd3KkK0E7XsENFQ86/aXoNdIexwbLJBiw4xZDfnuVs1wx75FkI/J5
         wuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VYwDDpHalN4TmJxXJgoc++jRpDXmGt1tukthPPht+D4=;
        b=BRnBVtQsQ0bC5kyp1hL1N5PdBsMOROxA7dsnGuoyMJtVT7Ak6G2aWAaPSchov8eQY6
         VwEQ94NIgYd3Yc8bgwwjNdW4pRb7Yoj2XRnpMgCd7qTnlO7jIzblza2Rsj/ho0Bf16fQ
         5uJ7Usj1Qlyas2PeZqCB+3h65dRx5+oe/2EnESiI3Ml3FnBzdxQ1XI4q0Q5UqLredegm
         LI5yH3z5KgGhDIv9VYJkRwrUJjnB2EFf3++v2WGQeZJmXrdpyFkdrY+8ePJrKXrnAT9k
         2Mp9ZXaQH6C42KAMqbIN+5kRP5+pqRcsqnBIjuHfAK/hF0+vg+Yfiwe5h6qhINJtHnb3
         rKlw==
X-Gm-Message-State: AGi0PuYc9RZ93Oifnyx/8UgcGfxfuzWF4PZ90dutNoVbpEwkBa+w42gb
        m6a2f7QNHb0Ot9eF//4NriYHd3SwZyQ=
X-Google-Smtp-Source: APiQypLw11PoMHs7AnePRgxQoQD8JiurnJ/uIq1zOsY/p1OOiaOhRI4tzDJguzsTPsyGKEJkLBaohQ==
X-Received: by 2002:a17:906:7383:: with SMTP id f3mr11397574ejl.197.1586442727267;
        Thu, 09 Apr 2020 07:32:07 -0700 (PDT)
Received: from localhost (ip1f115f16.dynamic.kabel-deutschland.de. [31.17.95.22])
        by smtp.gmail.com with ESMTPSA id v5sm3062159edf.56.2020.04.09.07.32.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Apr 2020 07:32:06 -0700 (PDT)
Date:   Thu, 9 Apr 2020 16:32:05 +0200
From:   Oliver Graute <oliver.graute@gmail.com>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, jun.li@nxp.com, linux-imx@nxp.com
Subject: Re: [PATH v4 1/2] phy: cadence: salvo: add salvo phy driver
Message-ID: <20200409143205.GA15163@portage>
References: <20200401013851.16227-1-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401013851.16227-1-peter.chen@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 01/04/20, Peter Chen wrote:
> Cadence SALVO PHY is a 28nm product, and is only used for USB3 & USB2.
> According to the Cadence, this PHY is a legacy Module, and Sierra and
> Torrent are later evolutions from it, and their sequence overlap is
> minimal, meaning we cannot reuse either (Sierra & Torrent) of the PHY
> drivers.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>

Tested-by:  Oliver Graute <oliver.graute@kococonnector.com>
