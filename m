Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAAC5C33CA9
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:38:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A712206DA
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578955134;
	bh=1IdqV5VvJ/BPxANAPiHQuOdPIKtGG/5RlhSG47PntHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=lbb8GferEF9AUKB2A6iMZ4HDLXCnc0JLBLXHM03H6g90YxDzQ41u4F5wC0oyY3ATK
	 p5wNcrUGLqVD4p80hUDBIexGDpszIwWs9zQNiX0wAoa62xM8vbqByxCNrS4nXpVczc
	 lS4wVROXuo1FomBEsIEoVmCMYgHifXrQaSrexSc4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbgAMWiy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 17:38:54 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36059 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgAMWix (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 17:38:53 -0500
Received: by mail-ot1-f67.google.com with SMTP id m2so5768636otq.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 14:38:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ro5qRPwmJVtGIpYVE3YFMYFRyOwvi8jNaWfJYatPWAA=;
        b=nk9IuDr4rcBU/Nn2m91JO5g6eJDGLOPtPzF6kLFYWxvq2l/9diCCKX/zOrRVH9mNAu
         5lK7tg9LH+YLX9nv9rm3rYQi5eiPAVFkwJnZPg74D0Gfa7s1Y8w75Gyuo3m0Ow2j+ggL
         pf7WLY53QCgIvwUWMsJJ7sS2UoJcwO4bkpOg96qJSXdmZ6Vpwkm473lNKSY3GnwB2VXa
         c3iezLk8XnifNsB+ByTd4YoyOjeq1aNHdV+b5Ss75dTN2cz4J33WsDof+er+njQipxmz
         9EbA0kaF+5yks1t28UNM6bPo0tXdUi+qOyljozcug4jX6YX8i4wwSJn3LhO75iqhgKrp
         x+jg==
X-Gm-Message-State: APjAAAVX2chUtDB5pmknyd95kCEg3s3v32h8ttg9Qe1E8DvUr4+p/t4U
        3ToN36zthjsYB7oWkutN22sApyQ=
X-Google-Smtp-Source: APXvYqxUtrSGg8hOvW3gwX65Xq2vsWMEPYtavtMwJsCm7IffkElfh7lQX3Wd8Kf/ivO+cNeP8ot9sg==
X-Received: by 2002:a9d:5885:: with SMTP id x5mr14164542otg.132.1578955132927;
        Mon, 13 Jan 2020 14:38:52 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e10sm4644730otj.59.2020.01.13.14.38.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 14:38:52 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22198d
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 16:38:51 -0600
Date:   Mon, 13 Jan 2020 16:38:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ondrej Jirman <megous@megous.com>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v6 1/6] dt-bindings: mailbox: Add a sun6i message box
 binding
Message-ID: <20200113223851.GA30654@bogus>
References: <20200113051852.15996-1-samuel@sholland.org>
 <20200113051852.15996-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113051852.15996-2-samuel@sholland.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 12 Jan 2020 23:18:47 -0600, Samuel Holland wrote:
> This mailbox hardware is present in Allwinner sun6i, sun8i, sun9i, and
> sun50i SoCs. Add a device tree binding for it.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../mailbox/allwinner,sun6i-a31-msgbox.yaml   | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
