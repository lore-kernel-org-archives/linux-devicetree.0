Return-Path: <SRS0=kXJJ=3D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA3CC33C9E
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 22:25:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C9452187F
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 22:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579040713;
	bh=RNCkUDCwyLro5zJmU3mlVSOjQp7cTxat5/T5mKGVwXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=05qa54h9PK4Jdw9AGoO2fMvLAO+YZR+7NZLwycqZNuTsMU8aeOv3U3+/w/W5Oawlk
	 LNgwJW11b2qLrlRhxS11EjTWnATTQu9JakE32XFKsg/d8roj7d4rBUpGkrSzBW5DoF
	 00nmUVquDL7Ffvlqt/NfE6yfNNuykQxHfNAKQW6I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728587AbgANWZM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jan 2020 17:25:12 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42275 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbgANWZM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jan 2020 17:25:12 -0500
Received: by mail-ot1-f68.google.com with SMTP id 66so14262378otd.9
        for <devicetree@vger.kernel.org>; Tue, 14 Jan 2020 14:25:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WS8NlkYRgt1yxklwHlCzn8AYd/wck8523N3nH8IJHG4=;
        b=pdXI78H1nIw01K2gnsOgdA42z/Aotp6pV0ZYgNnj2XPMLIwp5aap8UIVay+kOLMaAH
         74jPkq03jpYZoq9e4do3/w7nsX5OGkLiZVf116nLjhV8ohUwQlu1KKMD7Z0jWUsvICW7
         UKlElxJSyoM/QI9rm1z0Z5SIeO6x46FdFklPzHf8PewCjCHEZQWh/tFGnznXmNzLvOy9
         cHfIF/W23AOaBYy9ETBubk02flemhtnVQ8b7IPzoJ0hWjor+KasOydNkzr89yin2vyjS
         EZyehRdW+SOvTGBFdFV8BNqDNZoD9P86XgXmIif722Vc8XZZCePVchaQgPrBsdBaf3i2
         W6bg==
X-Gm-Message-State: APjAAAWYPC2/3olcDG3IGIOHUArCit0qukw8wfDpPCvHccW/kMF/KuVX
        V3H7E9lpKsYlDP1uQyYiCvVL2Wc=
X-Google-Smtp-Source: APXvYqyDwvQajjX6SdBy77+9JL8/istKMfTYwUL4wRZYqyrBzp7vx2JC8/Bp2RcVTsrHrF4Hl+ikPg==
X-Received: by 2002:a05:6830:138b:: with SMTP id d11mr480072otq.38.1579040711988;
        Tue, 14 Jan 2020 14:25:11 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w201sm5030057oif.29.2020.01.14.14.25.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 14:25:11 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2209ae
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Tue, 14 Jan 2020 16:21:40 -0600
Date:   Tue, 14 Jan 2020 16:21:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        robh+dt@kernel.org, maxime@cerno.tech, liviu.dudau@arm.com,
        sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, agross@kernel.org,
        corbet@lwn.net
Subject: Re: [PATCH v8 05/15] dt-bindings: arm: Adds CoreSight CTI hardware
 definitions.
Message-ID: <20200114222140.GA20488@bogus>
References: <20200113213149.25599-1-mike.leach@linaro.org>
 <20200113213149.25599-6-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113213149.25599-6-mike.leach@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 13 Jan 2020 21:31:39 +0000, Mike Leach wrote:
> Adds new coresight-cti.yaml file describing the bindings required to define
> CTI in the device trees.
> 
> Adds an include file to dt-bindings/arm to define constants describing
> common signal functionality used in CoreSight and generic usage.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  .../bindings/arm/coresight-cti.yaml           | 336 ++++++++++++++++++
>  .../devicetree/bindings/arm/coresight.txt     |   7 +
>  MAINTAINERS                                   |   2 +
>  include/dt-bindings/arm/coresight-cti-dt.h    |  37 ++
>  4 files changed, 382 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/coresight-cti.yaml
>  create mode 100644 include/dt-bindings/arm/coresight-cti-dt.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
