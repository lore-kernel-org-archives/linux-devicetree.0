Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E33C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 02:51:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA06B2083B
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 02:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592448705;
	bh=o5nt36zkyVqDgCG1kHxBckdnWOYFAYpdKtcPMRjyBuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1kHW3RJVXozqQkGnNnB2HPJ3fW5ainPtAONWB1z9C2+nCkgsFq/amEKUJdqTcEXCn
	 kRxp6emSwmnM8RY9wRaiAlRSawkBFVlpFwXidGb3bz04K18GkYlhqbu8MWFRIECftJ
	 IbzE3lJ8zkPe3ilryOglZEyUyXCZLkzpbJXPEzWA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729117AbgFRCvp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 22:51:45 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:46284 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729447AbgFRCvo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 22:51:44 -0400
Received: by mail-il1-f196.google.com with SMTP id h3so4333714ilh.13;
        Wed, 17 Jun 2020 19:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=14EvOj4oVkS3uh3SmKA36b5RuYlxBdOyXHl1LJGal0g=;
        b=QPib9ojFw9F0nOE1eVeIPmphXkZ1qyZYIfbblfDoYE7pQV2zOAcBmHUJujTonpzIef
         u3XOauUPrZtbLhiD/hTZ/QGsgYchbLtjOgjsCyuD5LXWXSPYBxC5uW8WYU8v4OkEZ5zB
         /oiyPc8inuBkPITETNwLcv9fsDWF/5cxpW72M3Oo7vcodG4cyMtZflOKZbG5uw3SQnMJ
         w01aIodhGd6WPa98oCerfUHBXq+CZjXG3zq/audrPXsYtCjREzcgDt34yrQfcxJAIET7
         oLqpqH9JVWv2SQv6bNfBEjvmW/dnhg8L9WH6yDjrQQAKpKJEN8jVMXg8ViqiTwSYOeIj
         HJ/w==
X-Gm-Message-State: AOAM533g3LUc++vJWFPbv78o0k68oGNENDWBACpehJ4bERT0rL3lgI3e
        UrI28eU23Mj6tMRemIWkRw==
X-Google-Smtp-Source: ABdhPJz2aSVwD0CNf8249CB/24p8/BxBVl5rZnECN+dcFbBorsYbKnBVhhXqk3Kvgtf59tP9SpTAwg==
X-Received: by 2002:a92:7901:: with SMTP id u1mr2167340ilc.52.1592448703066;
        Wed, 17 Jun 2020 19:51:43 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id t63sm846364ill.54.2020.06.17.19.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 19:51:42 -0700 (PDT)
Received: (nullmailer pid 3390371 invoked by uid 1000);
        Thu, 18 Jun 2020 02:51:40 -0000
Date:   Wed, 17 Jun 2020 20:51:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 37/38] dt-bindings: pwm: Explicitly include pwm.yaml
Message-ID: <20200618025140.GB3378010@bogus>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-38-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612141903.2391044-38-thierry.reding@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 12, 2020 at 04:19:02PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> For PWM controller device tree bindings, make sure that they include the
> pwm.yaml controller core bindings explicitly. This prevents the tooling
> from matching on the $nodename pattern, which can falsely match things
> like pinmux nodes, etc.

My preference here is to clean-up the mess that is pinmux nodes.

This has the side effect of no longer checking pwm nodes that didn't 
have explicit schema. Perhaps that's of somewhat limited value.

Rob
