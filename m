Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F602C32771
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 21:14:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 758F9222C4
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 21:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578172498;
	bh=aQkYv/od3M6ELDfON77dEIQpB8tvF3HasO5wg5XVGWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PlsAbh6j0Donbr8jARYAUuoj2584//MupmnKXmKlWLLdPFwawTBuAqDrWlYcF2dG8
	 atrBZZ69QoBXvIcJ+lsbssZfjFsmPXf1TAYjr5XfSEphX05K/DwdWIUGFiX1bpc1uU
	 0xZaLlnauPsdvKfOhGfluzaGt46hg5zATWyHd9Eg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgADVO4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jan 2020 16:14:56 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:40838 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbgADVO4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jan 2020 16:14:56 -0500
Received: by mail-io1-f68.google.com with SMTP id x1so44731330iop.7
        for <devicetree@vger.kernel.org>; Sat, 04 Jan 2020 13:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=l6WjYhwErffAfIJqKX4almlPavimz+egXrq1mO0xKZc=;
        b=Tkf2VnEppwfj+atxiYL54NZ5v78+8Lv+dVZ/kqY8Yum7WGbb2WJyR+T2ncqcM/D0GC
         aXeKODKGhwiB/b+IvvGjQDqaQ5CLgUUMZ4mDEkPbJx5iLYe1UqViUKnSV50ZZAqUgU8J
         moBQZVdvdBPOT20s2hHQzfEkcBQfxsfdfOCqF66xQdGUlxxKKw41zKZYR0pascBBVMsk
         74ABbWIf76dtMXK7NAW5iBvyBTedB/upAJ1BZh/FNx8I8AOtZkpy0LePeWn4zmaQLbmT
         5Tu2qRroXqOlXkEilWpAGKlr0MscNYHr+EsFhD8dJEHMfMdChHoiaQvjWSnM2XwHrLD9
         nEQg==
X-Gm-Message-State: APjAAAXGPVL56BvTddL1QaPVurNu2j5wixwK77Xa8txyJLThnARUollr
        lLYqxi62AFGgS+P+I0+YFVk9/4c=
X-Google-Smtp-Source: APXvYqwiQ78D4omiFPxFH9UaYD37ADaV7tVKsxe/jSBLRGXYJkGXUvtW9vz5y7zn09CdznB5pkg2BQ==
X-Received: by 2002:a02:b14c:: with SMTP id s12mr73996903jah.67.1578172495283;
        Sat, 04 Jan 2020 13:14:55 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id m22sm16077322ion.1.2020.01.04.13.14.53
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 13:14:54 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a3
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 14:14:53 -0700
Date:   Sat, 4 Jan 2020 14:14:53 -0700
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        rnayak@codeaurora.org, swboyd@chromium.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        dianders@chromium.org, Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: power: rpmpd: Convert rpmpd bindings
 to yaml
Message-ID: <20200104211453.GA26611@bogus>
References: <20191220064823.6115-1-sibis@codeaurora.org>
 <20191220064823.6115-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191220064823.6115-2-sibis@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 20 Dec 2019 12:18:22 +0530, Sibi Sankar wrote:
> Convert RPM/RPMH power-domain bindings to yaml.
> 
> Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../devicetree/bindings/power/qcom,rpmpd.txt  | 150 ----------------
>  .../devicetree/bindings/power/qcom,rpmpd.yaml | 170 ++++++++++++++++++
>  2 files changed, 170 insertions(+), 150 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.txt
>  create mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
