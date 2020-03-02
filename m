Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913B6C3F2D1
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 22:15:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51DD821739
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 22:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583187339;
	bh=QXNtMN2NF3vlLc56hopAN1MVxaRU10dt55sfNA1FQVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=SKl1C0hiY+5PYmUeyGEbdk3xjMQ/nBpXa5ETukKarE8NK44EXMNUsS9EC0MApNhfu
	 XcU1UC96of+ZCEQf8M/7UpIwiRrXAIyvCLiF4xfJcTbTw2Q9i2b1WI2w6Whn1K0/fb
	 opt+ZRLbeXraRJSATYVSP9I6iCumO3J3LaFJuvTk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbgCBWPj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 17:15:39 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42630 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgCBWPi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 17:15:38 -0500
Received: by mail-ot1-f67.google.com with SMTP id 66so942168otd.9
        for <devicetree@vger.kernel.org>; Mon, 02 Mar 2020 14:15:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=LETpXWmgpQKAWlf7/PNYOZU17euTcGls817NEC0Ll5Q=;
        b=cFH+UMF96S5JI4j6ZcGdf7S1R+iQ0prVnd/wzVa+Plb57PKjdFO9RB4d2DS2GyS0Ug
         Xuff8J4o299NTMQcGXdI2gmv8C2gM7HEq7MysK0cFKBIYa2VtZTJAWK/2oX7tZVO0VH5
         nqe/z6AgeLtz8PONOEI6QRA8G7g45yCu9RG6KKotVXdeH/ZQV/zzK57lJdwfVGZVXUTg
         i5jlo42q9FgdNYz+Ehd4IHPLFkzvGhGjA8MBRY2rFVGaTv/v4eji797CotbHyalGhJMR
         PEEXiXMqGT285W5jhu1OkYxyaieTPIdZWnYTf4Ofwi0ANW/ApzY+igejGm0o+5GM/dRd
         gtcg==
X-Gm-Message-State: ANhLgQ2Pvis8n9lXWbKNQdpcBue5i+Rw5ukfMm5FWhNPJv/XVsNsQtOx
        8i5NWBiOG6UgtKAjF1p6zg==
X-Google-Smtp-Source: ADFU+vuIu9sIr+g4n3XyKI7KAnCEhL992URnfpHt8RwUvwkHeYF8Y/WQdkO8jX6NtAq7uvi9f0tx8Q==
X-Received: by 2002:a05:6830:1e46:: with SMTP id e6mr1000399otj.257.1583187338208;
        Mon, 02 Mar 2020 14:15:38 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a26sm5181632oid.17.2020.03.02.14.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 14:15:37 -0800 (PST)
Received: (nullmailer pid 27528 invoked by uid 1000);
        Mon, 02 Mar 2020 22:15:36 -0000
Date:   Mon, 2 Mar 2020 16:15:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?S=E9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>
Cc:     devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        =?iso-8859-1?Q?S=E9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>
Subject: Re: [PATCH 1/1] dt-bindings: arm: fsl: fix APF6Dev compatible
Message-ID: <20200302221536.GA27370@bogus>
References: <20200225123904.14723-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200225123904.14723-1-sebastien.szymanski@armadeus.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 25 Feb 2020 13:39:04 +0100, =?UTF-8?q?S=C3=A9bastien=20Szymanski?=          wrote:
> APF6 Dev compatible is armadeus,imx6dl-apf6dev and not
> armadeus,imx6dl-apf6dldev.
> 
> Fixes: 3d735471d066 ("dt-bindings: arm: Document Armadeus SoM and Dev boards devicetree binding")
> Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks.

Rob
