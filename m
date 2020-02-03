Return-Path: <SRS0=8HU2=3X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B26AC35247
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 15:54:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6248720838
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 15:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580745241;
	bh=k1ij7xtj7QOUeGO+WCPds9gB1px2XN/nsv8ejt+4z2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=iynApsq56tG6hcJibVrb3XdIT9AXPyGRN9syNrndKR8nXE99CL2rr1dW1MiJUT4z5
	 sUf6mEhJ1LfPCNjaPX/zw0oD8DI9wm5SKBp3tsoyYUG6TyiWlYKd1lZi+UQLkFIbcu
	 M2wlrcEHBqMqwAPMIj+I6p+yKRHxpVOBi5+SIzig=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727860AbgBCPyB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Feb 2020 10:54:01 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33615 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727616AbgBCPyA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Feb 2020 10:54:00 -0500
Received: by mail-wr1-f66.google.com with SMTP id u6so5589007wrt.0
        for <devicetree@vger.kernel.org>; Mon, 03 Feb 2020 07:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tP8fWS0Om+HUZS9XvN6HPA99hRkjM3xVE0yxOW/WzBs=;
        b=Kmbl9d6o4aqki9KvLnPTNxx+UPziSZhZYQsk1ttG24U5/+TtmdjnexywEC1zOHarxv
         sOI7+8SxwOoUR4FwYDuMXG9QDa1b/Ctt9FXWAaKTI6+gYNURsin2+jQiFlKyKa3ixF/U
         k03IOmAiTGWUxG9E9j5fzYXgdA/4gfAwh7+3bMe5CASaw4Iopr4xJ/hHlV7qxmrIdJeI
         Uw3gCe3Wc29IuW++fKP5aq6qLqtS6X6TDj9eeBHHqhEVbA81oS58j/fI4WC6YeqZ1nBZ
         YeAY2DQxF5Kg5LQuWhizMlxhpfNeJJNYo3RgvCc1Wc1XyAnlyNLOmzY+R2mbGaNNJbgV
         Hcrg==
X-Gm-Message-State: APjAAAVIo8aZwDxHOcJqh4df8Z514Mn+OXptkg0OUH9p+gwxaHYE76kO
        NNwQAPUsRyLHC0VLMb/r8zocYCQgTQ==
X-Google-Smtp-Source: APXvYqzHf4VEmi2pcidWYBE74yP1wuva3q2BtMtnLGr1Ujp3xojBAWYPbbfNYhl4YvKIuxa+73JvAA==
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr17245205wrr.73.1580745238257;
        Mon, 03 Feb 2020 07:53:58 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.163])
        by smtp.gmail.com with ESMTPSA id 18sm23239849wmf.1.2020.02.03.07.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 07:53:57 -0800 (PST)
Received: (nullmailer pid 31100 invoked by uid 1000);
        Mon, 03 Feb 2020 15:53:56 -0000
Date:   Mon, 3 Feb 2020 15:53:56 +0000
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Cross <xobs@kosagi.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: Add ITE Tech prefix
Message-ID: <20200203155356.GA30832@bogus>
References: <20200127022023.379080-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200127022023.379080-1-marex@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 27 Jan 2020 03:20:21 +0100, Marek Vasut wrote:
> Add vendor prefix for ITE Tech Inc, http://www.ite.com.tw/
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sean Cross <xobs@kosagi.com>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks.

Rob
