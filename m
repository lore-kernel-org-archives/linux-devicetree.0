Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BB8C32771
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 20:20:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87B482064C
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 20:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579119611;
	bh=e+lLd2ouarqgvj3XyOeY7c4JM/uuzjYlHWn1R3xKEjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MePhfU9J/KysvSjxHE5eMQgPhi8t/D7q2qy+iHVno+eLG/0ybm5KvPBCOZL3Y7jff
	 +TbbftfYuJ+nv339yDiZTYi5K0EVel253A+LVC5usGnsJgdLXN0fstN76/diPITHCN
	 u9/0uOIo62uFVy5c7RgqjAwH6QKW5icFWkgW+Ov0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbgAOUUL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 15:20:11 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45927 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgAOUUK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 15:20:10 -0500
Received: by mail-ot1-f65.google.com with SMTP id 59so17248705otp.12
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 12:20:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:content-language
         :user-agent;
        bh=1BVQS3/CT2AwFowBzdJp24DkQzhe3BERjAeXkX0Uz7k=;
        b=l0+UajL5ZkfgePmaGpr7biMiNxoHhbM0rZk7TfwlJG0s+JmUtu56HROnZcYiKzy+yS
         2K86JJ1Wn24SoLvhLhuG5A/GX/hGrU3bj/0NBEPLmysubFC187mgSmFZ1fJxja1Hb7DE
         JqXu4jJhuCNnt02EeDiHPM8RHedEcjBEk9MFKosoO1LB1E48vd74knfyaVTCNPVuNA07
         DfWuQGKmh8q3C+H1+JY4uNUH0fhB6SJHm9a6yr12xc9j6mnOArNddX5yxRzic9RMnXY6
         jLtdEkB4XdXB8Ejq/Fg6RmcBPPw+e4mBZmaj8nQ8n8lywhYn5qaUFS4DU/HJLtFyC4er
         Mq3w==
X-Gm-Message-State: APjAAAWq6dDBe8yKz7kwBtTxLAR/5Z2G0RCrf78mgSqEgfxiQx+o3D5+
        VyWnpUI/jfGAVx/y15x1PRHClEs=
X-Google-Smtp-Source: APXvYqx7sOIyVQPBP4SMGvwv4Lt/bFutpHUj8glbZYP3ElDn3FMyWFykKyBDp8WKa6ZBaUiX8/O3Yw==
X-Received: by 2002:a05:6830:1016:: with SMTP id a22mr3103561otp.83.1579119609587;
        Wed, 15 Jan 2020 12:20:09 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w6sm5940605oih.19.2020.01.15.12.20.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 12:20:09 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220379
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 14:16:37 -0600
Date:   Wed, 15 Jan 2020 14:16:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Shiping Ji <shiping.linux@gmail.com>
Cc:     Borislav Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-edac@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        sashal@kernel.org, hangl@microsoft.com,
        Lei Wang <lewan@microsoft.com>, ruizhao@microsoft.com,
        shji@microsoft.com, Scott Branden <scott.branden@broadcom.com>,
        Yuqing Shen <yuqing.shen@broadcom.com>, ray.jui@broadcom.com,
        wangglei@gmail.com
Subject: Re: [PATCH v9 1/2] dt-bindings: edac: arm-dmc520.txt
Message-ID: <20200115201637.GA25883@bogus>
References: <4fbf026a-4878-cd65-55f7-7d992782b331@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fbf026a-4878-cd65-55f7-7d992782b331@gmail.com>
Content-Language: en-US
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 15 Jan 2020 06:32:27 -0800, Shiping Ji wrote:
> This is the device tree bindings for new EDAC driver dmc520_edac.c.
> 
> Signed-off-by: Shiping Ji <shiping.linux@gmail.com>
> Signed-off-by: Lei Wang <leiwang_git@outlook.com>
> Reviewed-by: James Morse <james.morse@arm.com>
> 
> ---
>      Changes in v9:
>          - Replaced the vendor specific interrupt-config property with interrupt-names
> 
> ---
>  .../devicetree/bindings/edac/arm-dmc520.txt   | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/arm-dmc520.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
