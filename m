Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9130C00523
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:25:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3E5E21835
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578097512;
	bh=0Lu/vO1oG+KYsQXrmf3PSKLDAXVF+mGyNpd+SpY7Yzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=esfqgqqUrMT2k4ZFjdhOqUkpAIYW7kSqHMJXphTIoOU9u/RcgSTig/JmePzffSrda
	 jkjSOk1NpY2/Yfi7030ls2uKv9E8LmMWH+crmySnLwDyQB/03e+uJSy9NghA8B3JdM
	 /kYx9ylvF5IJhz9/qe6onopfc73a4vKpCXZ9O548=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbgADAZM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 19:25:12 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:41911 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727091AbgADAZL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 19:25:11 -0500
Received: by mail-il1-f196.google.com with SMTP id f10so37987281ils.8
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 16:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eR1DwePl12inkeFIjAXH/g5K3pWBVW6Bq++1sC/LWl8=;
        b=blF5nf6wN8L49sVoLGvAG0Qo0ps+wyDfBaBDM5GHw+FomDtTwxyIEsYT1Ru1HAFG8Y
         RVoW1+CJ05W9lPcz2UpZicw/UbeWrRA4kLWBU678S5V7quzoa9jPvzPmH51lW9quBeJJ
         UAcYyn1W9/OxfY0q2l+tW6yTrESd+q+W3bVVont9h9dW+lLXaFTwFmnaiWR42JKYEMX7
         MSS/ZKdG+JCjZlVqx7dRJK2Uu83QOjGJmK0x/5/lk5lRGMzN+tA+9nw9LLlmwsUJyNyi
         2M7Cry+zWUG6Rvq1rzZVzdtAxVhSxXW/xJ01LFyJqGZfie5jTe/rORYhGm92EiiufkQ+
         v+mg==
X-Gm-Message-State: APjAAAUfQWTA4hxUkhPTxPV7RBk7MEPzqscwjgfaeo+Cz605296zPDJ2
        lqOCXNmUZLjEzwA5Qvscz/PW4B0=
X-Google-Smtp-Source: APXvYqyDUHJ3ZNxtzssY9lyrNzIV6LNkjfaUXwYIV8bK4HihJXdxWfilMlhJJtPdCdZNXTsh1orjzQ==
X-Received: by 2002:a92:de05:: with SMTP id x5mr74525262ilm.74.1578097511137;
        Fri, 03 Jan 2020 16:25:11 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id z81sm20420423ilc.17.2020.01.03.16.25.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:25:10 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219e3
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:25:09 -0700
Date:   Fri, 3 Jan 2020 17:25:09 -0700
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jun Nie <jun.nie@linaro.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: add "hisilicon,hi3796cv300-ir"
 compatible
Message-ID: <20200104002509.GA24062@bogus>
References: <20191226120222.14745-1-shawn.guo@linaro.org>
 <20191226120222.14745-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191226120222.14745-2-shawn.guo@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 26 Dec 2019 20:02:21 +0800, Shawn Guo wrote:
> It documents "hisilicon,hi3796cv300-ir" compatible for Hi3796CV300 IR
> device.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  Documentation/devicetree/bindings/media/hix5hd2-ir.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
