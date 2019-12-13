Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BF8C00454
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 21:01:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF98F2465E
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 21:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576270905;
	bh=4HO+C7qWI46svOmlvOTW0VO4gmsmkmYP/ZNU3TEZmvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=d5/jdSe7NG6gLREqS6xa6VN8A0dpr+2Fp9zT6/Nd41iNrKg36Ban7+aEShRpt6cbm
	 bi1YjOvVQbaSqJx0FUrMyoXKWS9k5BJvZ4IYB++hXPpTiWKQvhbtn2ox6r5ZjvRAtm
	 JaQ3eb48XYTpHNPyTRfZE9OF6s/nsrazLA+O4TlM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfLMVBq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 16:01:46 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38169 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbfLMVBp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 16:01:45 -0500
Received: by mail-oi1-f195.google.com with SMTP id b8so1888421oiy.5;
        Fri, 13 Dec 2019 13:01:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KOxUGgicEuCv+hKKbBEUiThIOKvSQbqIIf6kqpfyaVc=;
        b=swhInsy5FbbZDT64urBsfBUuxZjnmwKqhK5BXganbfDuY4IJs/Y9Wil7am06/hh0gy
         zPy9RMpn/y8iqmXHWfnVBt6vhhOJ4Gc8JkDvgCU/u0pjfhfs6LkgY8TJugCDIcWxWUhe
         z1U/eY8iki5x2mxQCrBFVcYwdQX9JdVOrxayV+/t+OFDXHO3l/JLYnojBDTdbSgOFUSt
         xZs6GbBbUlO7PwZHy0OWy3NdExBdoBbdbw5IOTEnjb27AjxR0xf85rEHWqeo1kW/ccDr
         h8mdWMoZTv3EQf+fTCkWNsNEeEx3Ac2u2ut8hRn6E/lRGq1nYB5q76xDJ1jyoTPVRS/Q
         HPUQ==
X-Gm-Message-State: APjAAAVYF0a/B2angSwlbjSEkbffddiUiqnwRPGh9dD3DmzxMCWtd0OS
        xLIoXMKA43xX4b661xytrw==
X-Google-Smtp-Source: APXvYqyu5bi0OplQ8EqPYVfMSdVGRLNuQ2frsbckjG/8mRvUUzDsb55kQPsfvbWV4Nz+AJW/ejlSRw==
X-Received: by 2002:aca:c507:: with SMTP id v7mr8001693oif.157.1576270905038;
        Fri, 13 Dec 2019 13:01:45 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m2sm3696429oim.13.2019.12.13.13.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 13:01:44 -0800 (PST)
Date:   Fri, 13 Dec 2019 15:01:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     kbingham@kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
        Simon Goda <simon.goda@doulos.com>,
        Kieran Bingham <kbingham@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: vendor: Add JHD LCD vendor
Message-ID: <20191213210144.GA18725@bogus>
References: <20191128105508.3916-1-kbingham@kernel.org>
 <20191128105508.3916-2-kbingham@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191128105508.3916-2-kbingham@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 28 Nov 2019 10:55:06 +0000, kbingham@kernel.org wrote:
> From: Kieran Bingham <kbingham@kernel.org>
> 
> Jing Handa Electronics is an LCD manufacturer based in Shenzhen, China.
>  http://www.jhdlcd.com.cn/Company.html
> 
> Signed-off-by: Kieran Bingham <kbingham@kernel.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
