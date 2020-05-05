Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E40C47257
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 15:40:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1830E20746
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588693234;
	bh=31k5lsJzCr3lcShWroGVopT+HRtj4oq3sHBg6jXQDeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jjeln50fat67l5OsGOVZrHN+nq041FAuWyq4SOcuv8K91x4rh2lxoPEvnJN29Home
	 EM0sqUmBHRwCFgDzu6PADP1rGIladfYt4ka96Q4YEZF0yxJYH1po623ImpFPqZYlJ4
	 zZvrSibxk//KRki9C0DMiLviLMWEYIWm7wMQ4Xcs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730438AbgEEPkd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 11:40:33 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43838 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729317AbgEEPkd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 May 2020 11:40:33 -0400
Received: by mail-ot1-f68.google.com with SMTP id g14so1987209otg.10;
        Tue, 05 May 2020 08:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lN6CEFyeKZCFu0OJiCgZWccGf+eFusscJwKLXSk5KTI=;
        b=PbJkAQOL+gzbmJqUMJGJwDr7IPXsecN0GdhCKtYy1F6p56B3wDPbLC5PBq3x0lcjYn
         1WvQJv1zMvoHyr+KdDP3uyxXyZlnF48xrw2asBpVh4mfCV1wQMcfEpZPx1WJLKGSZrIa
         /oMD3O5CSpIycrDbDGOOhOIrF+bKmdAefWS4qoGXOsSInFPbmwcFc7U5IA/KsfWiG84y
         xSYp4y3LfmMG6uGLxU9G+Ntw6A2NgXQtNaWuHAVjWqsDMli2BSnnprbF11jykhlkF8Qu
         hfyfLtE2MteCNvOn0/DmAdf/jk3JgVrgDXq94i71cyLXMeR8q2UR2wydJsIBjOU6kPm9
         YTkQ==
X-Gm-Message-State: AGi0PuamjFFQVbRiHb4t7i5RBTqjZsNvv9m21xn+ujRqoLYHnzqWUzhk
        hhqrOrnemedSTNfCYxiSxJZ055U=
X-Google-Smtp-Source: APiQypJLnfn8+KV4pOh2+Rr7e1217JEIk7U8xJPNQrhvgNj4MtAa2UJIT/k5Lny39ebo/r/5cevLSA==
X-Received: by 2002:a9d:6f86:: with SMTP id h6mr2873011otq.83.1588693231137;
        Tue, 05 May 2020 08:40:31 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r10sm685013otn.70.2020.05.05.08.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 08:40:30 -0700 (PDT)
Received: (nullmailer pid 4301 invoked by uid 1000);
        Tue, 05 May 2020 15:40:29 -0000
Date:   Tue, 5 May 2020 10:40:29 -0500
From:   Rob Herring <robh@kernel.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        sean@poorly.run, seanpaul@chromium.org,
        Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCH v12 2/2] dt-bindings: documenting compatible string
 vendor  "visionox"
Message-ID: <20200505154029.GA4222@bogus>
References: <20200421045508.21137-1-harigovi@codeaurora.org>
 <20200429054515.4976-2-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429054515.4976-2-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 29 Apr 2020 11:15:15 +0530, Harigovindan P wrote:
> Documenting compatible string vendor "visionox" in vendor-prefix yaml file.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> Changes in v11:
> 	- Added compatible string in vendor-prefix yaml file
> 
> Changes in v12:
> 	- Fixed the string to clear dt_binding_check errors.
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
