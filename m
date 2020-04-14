Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2887FC352BE
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:53:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00C162074D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586890403;
	bh=AAp5bITzFd7ZJlEcc+3WflxFsSieRSn/D7/0KNGLzYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=UXQ2/9d728fGa94dD4feiYQIR8lFtYZHeB0Hp4PP+CwEhnhpGOSKMtHpqs0W2gesM
	 8mj3QK+2Bj9J+4SD6n/ouPlKLTiu4SVz4fysvbi0YmAWWDEjU7hD8wFyFvJm6t34rh
	 ZKITko+TKY8YVFkMF/ygGmpUb/I7AjQS8lvtlQNs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504414AbgDNSxV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:53:21 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34501 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504481AbgDNSxU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:53:20 -0400
Received: by mail-oi1-f196.google.com with SMTP id x10so1952594oie.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DnUIm0pCTMjrJlKf0PE9TFv9cjSyYhQx6LzvNIdhMAk=;
        b=JpedOlZAzFu5tV1AVlMelJudTU3Wzlq1eufLXDfVratsjQ4mc9pDUT5fvKamTU59jG
         RQNboXOVgCsfmlpaAQ/XrlwA1dsv2v9GHkFZdMC94gT97VOk2no2VmiLMFQoNvaKLsBh
         0ZuH4vw65oeU/4j8c3o11BgT4rIPxHCGEFWX1oS40ihWV26Qnf+dR6PsaDksdBvRCE8F
         PdbKOjLm3jaqKURcLllg5IxvvZHOFHHKvh+q+DfbwI8OpjAVIp4uWpPQWy7VJ3JceHFp
         EDSe+KWzJdlVmNTEzY2kk962lHBLeVL6IMSwpZdfI5MEkI/A+H8CYP2tiLd5dr8U2TiB
         h00A==
X-Gm-Message-State: AGi0PuazVqt0rWSm9JUqWRbA0Esk7lu+khJM2T1ov/6Nu16Gdkx2i0Zs
        qohLlh2PCECCodrIhLuvyA==
X-Google-Smtp-Source: APiQypJO2aj/ViwEJv6VhOEdbrE3T0CJhw4JlEHWkOQn2ENl7Wbc+x7CT6tgWq3Ota34btutjtgABQ==
X-Received: by 2002:aca:b143:: with SMTP id a64mr6140775oif.1.1586890398871;
        Tue, 14 Apr 2020 11:53:18 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v15sm6372807ook.37.2020.04.14.11.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:53:18 -0700 (PDT)
Received: (nullmailer pid 8012 invoked by uid 1000);
        Tue, 14 Apr 2020 18:53:17 -0000
Date:   Tue, 14 Apr 2020 13:53:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 28/36] dt-bindings: display: drop unused
 simple-panel.txt
Message-ID: <20200414185317.GA7959@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-29-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-29-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  8 Apr 2020 21:51:01 +0200, Sam Ravnborg wrote:
> There are no more references to simple-panel.txt.
> Delete it.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  Documentation/devicetree/bindings/display/panel/simple-panel.txt | 1 -
>  1 file changed, 1 deletion(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/simple-panel.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
