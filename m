Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A336C3815B
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 18:46:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D6042078C
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 18:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587408402;
	bh=wP+WTXf9KAg0tiR+c9MiIYebpcXYj+y4lIW/kLZwG8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=qpireVmYCpfHa4KYNGXnAb2EVj6P8XXq7BOjl0ToQMjFzqfDD0flJzVzXnGRAH77K
	 GYCBYrO2teky3fnD3t3sV2OSd6TbFU++RQeLH8MFWCRv6zd/MBZuoxYMYyCsoZkjZ0
	 ZXXrJHUPkUO4GA6OCh4VC1uiyZPJUA3qgTHTiBtw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgDTSqm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 14:46:42 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33300 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgDTSql (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Apr 2020 14:46:41 -0400
Received: by mail-ot1-f66.google.com with SMTP id j26so9068900ots.0;
        Mon, 20 Apr 2020 11:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dJDN6ZSVBrwBuPPhD+aSfFRw6fiy4PnYxRMXPYH5eJE=;
        b=NbSNUUGnCKqzAEDBMd24r7SE8xCM0YKODi8jmKA5pjzbb+KcqnBI2wqiMx1RBAcP2B
         j/BGzh3GUFde2/PN7a1HsH4AaY4Sx/6egTDBE28CrgctUn7B8QGA6Ich2hyX6VHDjWl1
         SkjpD0wkgzE7h50fjx9fCphC87oDykZ6YZqNDvsEiwVwBRHb4tZYgKkHl/E7xNUyDPYb
         t6DHFIScl1gJzxWEHwM02RhfUmFdCFJ8r6JZQyZDDqSQVh0Mb2XZnYQKM02QIZnryG4z
         /Qt6+kG2dGhHfkePVBCXPe3o2Qwvw34xfFfL7/gM4GVmIUHsAMzpNqZWy4/CG0Uq7KVt
         JunQ==
X-Gm-Message-State: AGi0PubGhakqSpQQJWYz5B+Jl6UgMtc+xCdr1+2hKeJp7DJx4OMqsvuN
        dabNCi3ox+aT9VpYZnhgpw==
X-Google-Smtp-Source: APiQypJKBNzrWvr1SWwVwphT9YqgirBWXMbyZeBvPDgavXh+P8/XkilfFXtYjOgYCLzIiuXOqrckdA==
X-Received: by 2002:a05:6830:1e45:: with SMTP id e5mr10543687otj.236.1587408400603;
        Mon, 20 Apr 2020 11:46:40 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q11sm61919ooc.19.2020.04.20.11.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 11:46:40 -0700 (PDT)
Received: (nullmailer pid 27429 invoked by uid 1000);
        Mon, 20 Apr 2020 18:46:38 -0000
Date:   Mon, 20 Apr 2020 13:46:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jitao Shi <jitao.shi@mediatek.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
        yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
        cawa.cheng@mediatek.com, bibby.hsieh@mediatek.com,
        ck.hu@mediatek.com, stonea168@163.com, huijuan.xie@mediatek.com,
        Jitao Shi <jitao.shi@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v6 1/4] dt-bindings: display: mediatek: add property to
 control mipi tx drive current
Message-ID: <20200420184638.GA27394@bogus>
References: <20200411074408.38090-1-jitao.shi@mediatek.com>
 <20200411074408.38090-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200411074408.38090-2-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, 11 Apr 2020 15:44:05 +0800, Jitao Shi wrote:
> Add a property to control mipi tx drive current:
> "drive-strength-microamp"
> 
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt    | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
