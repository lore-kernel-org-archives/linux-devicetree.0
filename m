Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A0AC33CA9
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:51:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25B2F2084D
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578955896;
	bh=kMxppQ8YsqJJUlYe1VlyCBuZnq/uMJx+8ulQVbeug+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MFAKYT+BiYoiZufcwXBnOvOxnHXMZpAGbG03XAR3xilRzxx/lrjr3m72bgdSnbfqS
	 V78JhVhwuVtHQHduN0XrIl5dWDV5cQOBMwiWWZoiLmSXG43x6U42Dqe2M2rj0SzAea
	 y/wmAt7oPQKaOCfmMZn4InYy+uk1kBzVX/gEY14U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbgAMWvc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 17:51:32 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38859 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728961AbgAMWvc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 17:51:32 -0500
Received: by mail-oi1-f196.google.com with SMTP id l9so9963502oii.5
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 14:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kHrOCgkkdDXDANIjbqsuSi8zgIrP7fM6uexZoRu9ItQ=;
        b=lWNgx6rMaw/27D7FT1/0nYYMm6peZabSsi2rpDketsc3vNow/2zfR77x3KmkZhqDmm
         8Y/qyEBid+Am4uyH4IFzjINHk40dXgBr9ci4hNy45q/S7l/f18RKhUDuG/uI2Fen7etJ
         nBoGePD2YgGr74UkECb7xhgPp6Qhe6pmfXOjDpgQ+iUhsvEwTqSXFM4P2dYDAJA1gUQu
         +nV83xZmfxh6aTk7fa/b7CBVLh0TcSW4PQ0Shp0yWeP8IpBTxqvbrHzH87VMPC1mh299
         upcRcvcTIrFkZKZOLBw+6yZ9gpcQ274DtKaj1mp4NPuHCxGwuDHUL8kZzkN3E/A7VyK+
         Gruw==
X-Gm-Message-State: APjAAAX+YmIov1FD2QHJeKWvrmsdApDno7kQjRBcTcG+TaYptwqh08kG
        2/yqrg+FjrcjlgH/qBwmeNjsFqw=
X-Google-Smtp-Source: APXvYqySHimWaUedQ4VIldRohMS9ut/tjzhJvulfFDn7svAgaAWTHc94MEEZyzjFNzylp0xp6vg59w==
X-Received: by 2002:a54:4e08:: with SMTP id a8mr15057736oiy.77.1578955891700;
        Mon, 13 Jan 2020 14:51:31 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a65sm4652112otb.68.2020.01.13.14.51.30
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 14:51:30 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219cf
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 16:51:29 -0600
Date:   Mon, 13 Jan 2020 16:51:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     robh+dt@kernel.org, georgi.djakov@linaro.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        daidavid1@codeaurora.org, saravanak@google.com,
        viresh.kumar@linaro.org, Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: interconnect: Add OSM L3 DT binding
 on SC7180
Message-ID: <20200113225129.GA16336@bogus>
References: <20200109211215.18930-1-sibis@codeaurora.org>
 <20200109211215.18930-4-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200109211215.18930-4-sibis@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 10 Jan 2020 02:42:14 +0530, Sibi Sankar wrote:
> Add OSM L3 interconnect provider binding on SC7180 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
