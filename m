Return-Path: <SRS0=c2W6=4V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C913C3F2D1
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 16:34:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CADA221739
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 16:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583339669;
	bh=fQ8DTHjVKzB5X5OZ9YGpbuVIAhvEQvFga2oanE3OFPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=uHXXjgX3ejBfuKYWnw+8QkrfHBDqDA1Y9hGRRkWUnNdNsUVJtnjCqgfLvNR5QCwTv
	 WgPo8v3K8at2b1J8m6bUXETGae4+X0DiGjaSWPLvGb7M87mSJBLTWosl0/UXtDaUYu
	 +fX7dK1UZisj2wShI1spYoHw9QovfFD4uE/2059o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729792AbgCDQe3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Mar 2020 11:34:29 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35503 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726764AbgCDQe3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Mar 2020 11:34:29 -0500
Received: by mail-ot1-f67.google.com with SMTP id v10so2642199otp.2
        for <devicetree@vger.kernel.org>; Wed, 04 Mar 2020 08:34:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HYgnap7JcbfyJ9LwlrBSQ6khAGsJZr+4LoSP4vff9D8=;
        b=VzkRP7ivKEU6cFJdGNvOW6Y/RPbwvN+42/c95LF0gASgfxf9MnxY2l0wYqbr0Gf5ae
         +nvzPfpH3NQGCVaCfcdvtZyKDAXr7s/0AJ+Nuo4CCYDTu/Zh7ZbQpTvsTmf7YzEKubEX
         M2OEIWmAf8ECabd/ekHMu5E8OrFQnT8pp8tny2It1+nfHhUHZPSWUwu+nW/DCj+jD+v9
         0tczvcuqnG69rwVl8jQ1LTpYzStjfpp61m6Y2+XMsxCnzZyhkG3C3JGfOpX5LDvtdfNW
         Q38bCYdeyxD5FFyJKUOjbtGXr5S1Rr5LOyv5TUzqVpo2j9nzObRLoIX2ctX/ZX5P6YxF
         fIrA==
X-Gm-Message-State: ANhLgQ2KDueh9zJP6WAQj9EogHXKly6vBSMLHgsgJ6q0LjXCQuzbcmIi
        V0fvwNaG9FqZ1WsnjOkMXA==
X-Google-Smtp-Source: ADFU+vt5Q6fikJmgeBqJkMGvP+8/KykDpQZFFE+L6Qzd+haE4wied4mpTIXVkprwHCGx1VthdflbWA==
X-Received: by 2002:a9d:3de4:: with SMTP id l91mr3113287otc.35.1583339668343;
        Wed, 04 Mar 2020 08:34:28 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w18sm3076845otl.60.2020.03.04.08.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 08:34:27 -0800 (PST)
Received: (nullmailer pid 20763 invoked by uid 1000);
        Wed, 04 Mar 2020 16:34:26 -0000
Date:   Wed, 4 Mar 2020 10:34:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
        sam@ravnborg.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        mark.rutland@arm.com, christoph.muellner@theobroma-systems.com,
        robin.murphy@arm.com, linux-rockchip@lists.infradead.org,
        heiko@sntech.de, francescolavra.fl@gmail.com,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: Add vendor prefix for Elida
Message-ID: <20200304163426.GA20664@bogus>
References: <20200229151506.750242-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200229151506.750242-1-heiko@sntech.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, 29 Feb 2020 16:15:04 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> Shenzen Elida Technology Co. Ltd. is a Chinese TFT manufacturer.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> Hi Rob,
> 
> as can be seen on [0], Sam expects you to apply the vendor prefix
> to the main dt-tree.
> 
> Thanks
> Heiko
> 
> [0] http://lore.kernel.org/r/20200229125725.GC5447@ravnborg.org
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks.

Rob
