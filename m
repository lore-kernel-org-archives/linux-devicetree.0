Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B112C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 14:19:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 779212075E
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 14:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586873991;
	bh=YwvYwmyuLY3TG7RZWU5k2CEIeJJEzdqsI2x/kJN0hrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=U6KF74bae+axth3u9ryuC7R0AbPG6A1UMYRAaJz7UNUhsPL3VZMmw1TQgO9m/PYHd
	 T6/nOfiPKkupZzALx71Z9dzUym+qAHAFUGuLx0rU2nqcIbKxV2iKt2u/jrsyUGzxxC
	 eJ0nqrMMaYFK9myVi656VhNDxDD1qf/0z+YSEU68=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389687AbgDNOTu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 10:19:50 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33214 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389553AbgDNOTr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 10:19:47 -0400
Received: by mail-ot1-f67.google.com with SMTP id 103so12944775otv.0;
        Tue, 14 Apr 2020 07:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=amC22dHVE6sj1pCFyhArvd/MvLO5DdG9yLMdacMiflc=;
        b=qGZ7B5bFm+toVEY2qwYkJLrfDoqPo/hbPqqMYItUAnVNXESXvmRZ6Gn/vOaE1K8lrb
         fTr3jeozN+SMMuO93Kq0yC6LW3qT6YHuZoWtwMcu5ixnoZtVKpsteNPpcecDWkvEslrw
         ws3qBOqnfAMy0JJjJU5nN2bFvZdreW8bi4nd2akR5hmjLpu0DEvLCVUQSA403HJt+kTK
         I5Gvlfk4oIviUEejKiDH9Al0IWTbNBUkU0Y8TgywBdhyWZzgwLc2KXTS4txdLschxa2K
         x2zlFLeN+skAgvOFQycDjXGFDwIEIofDz0fwZpv0/MdMTs3neIqQULVl4orutBRy2rrv
         jVkQ==
X-Gm-Message-State: AGi0PuaD7x5AtaFhkF3taiGuXDcm/4j90TVZrMVGQIVzvpeWoOmLxgNg
        md9gscMOSuyC67x+CBWZhg==
X-Google-Smtp-Source: APiQypIs3pK2G5cy3G+TK6LsvbQ/Ij3vzS8cRgXVhLPFfrMsfdk2W4iVdlZJXN4pUznaCrafiFwQYA==
X-Received: by 2002:a05:6830:11d8:: with SMTP id v24mr19273278otq.258.1586873985871;
        Tue, 14 Apr 2020 07:19:45 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a5sm6169637oot.5.2020.04.14.07.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 07:19:45 -0700 (PDT)
Received: (nullmailer pid 13004 invoked by uid 1000);
        Tue, 14 Apr 2020 14:19:44 -0000
Date:   Tue, 14 Apr 2020 09:19:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, jun.li@nxp.com, linux-imx@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATH v4 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Message-ID: <20200414141944.GA12924@bogus>
References: <20200401013851.16227-1-peter.chen@nxp.com>
 <20200401013851.16227-2-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401013851.16227-2-peter.chen@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  1 Apr 2020 09:38:51 +0800, Peter Chen wrote:
> Add Cadence SALVO PHY binding doc, this PHY is a legacy module,
> and is only used for USB3 and USB2.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
> Changes for v4:
> - Drop the useless description for power-domains
> - change unit-address of node as lowercase hex
> 
> Changes for v3:
> - Fix more schema errors
> 
>  .../bindings/phy/cdns,salvo-phy.yaml          | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
