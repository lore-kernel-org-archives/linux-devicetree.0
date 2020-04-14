Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28061C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:31:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0106E20575
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586889063;
	bh=Hlfg/LC+JV9GVGPrQqB2/V8U5KS8yUXA8297werSy70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2fUmwSRSDBTajRsoNMFLh1/Sb9sv1E6O/U5n/NLzI2WfBTBnI9F5Nm/Lw2ExsUPej
	 AuZZBIi+X+/JYst9XH6huwwdV6SSaygrtMkTOlBq7uYMhRYEN20Zhqq3rpqjgoTlGd
	 pakOYSWTeI/W+9RGjOrixl/pJiiECK18PA0b0sz8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504006AbgDNSbC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:31:02 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36268 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503999AbgDNSa7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:30:59 -0400
Received: by mail-oi1-f193.google.com with SMTP id s202so8092706oih.3
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hCA2+SJnjAIpb0+v1mTByhrS43t6QQFIn6K1NItE6O8=;
        b=lYwuCbhr55nMDcfO28b2OUYv4UzGMzO3f/P6p2WPkgHWO6cGJLlVAYbcwdtIEUGdNw
         pE1Nb7SgRuIX8w6XhpEdl1fgA32mHGWJybrj2CURhIhSpPjKHjl/zH2oNLdJANKsl8IF
         8lg0fZn7DuD4GxNqn4pve4hpwa7Jcgt7Su2f3xgapCmQCrkrcpMogedQss7S6vhAjaAH
         2ZZaNFnRQA5TAPJzgSQoaiwwPSo2GA2LnMZyePR90Riyyx0CQHHpZ/Sg/eVoxBbp3Z8p
         yoHq+uu8enartP5lvUgg7bJbIYnLF+Sqjx/tYVF3P90qZ2UKriQ90z+eGybS2w9hCsJ0
         bnnQ==
X-Gm-Message-State: AGi0PuaBdmAvNHeKxsnIMlfcRYzWZ4Zy/erhk9jy/HNNwvbp2cNVsv+1
        m2+58AjK3iqhPgxB8KOSNg==
X-Google-Smtp-Source: APiQypIossNwbQu0CymziaWK6/BAL0R+wS+f6D9hWJwmXOVzVQBj/k+jSz+bVCJCPhkgWiI14I01Wg==
X-Received: by 2002:aca:6002:: with SMTP id u2mr16614872oib.45.1586889058506;
        Tue, 14 Apr 2020 11:30:58 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g8sm3550205ots.38.2020.04.14.11.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:30:57 -0700 (PDT)
Received: (nullmailer pid 31207 invoked by uid 1000);
        Tue, 14 Apr 2020 18:30:57 -0000
Date:   Tue, 14 Apr 2020 13:30:57 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sandeep Panda <spanda@codeaurora.org>
Subject: Re: [PATCH v2 11/36] dt-bindings: display: convert
 innolux,p120zdg-bf1 to DT Schema
Message-ID: <20200414183057.GA31140@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-12-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-12-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  8 Apr 2020 21:50:44 +0200, Sam Ravnborg wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Sandeep Panda <spanda@codeaurora.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/innolux,p120zdg-bf1.txt     | 22 ----------
>  .../display/panel/innolux,p120zdg-bf1.yaml    | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
