Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897CCC282DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 21:02:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5ABAA20692
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 21:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578517333;
	bh=wlolg3E3L4ANOt4HcBeJdXMgpDmVugFNTWotSSrHwUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zua6dhC+Xz3caERFEFGT83EKEb3isT3oOKQQWXvYwPC5f0TNqT77vL8PevWtQIfG0
	 dr8/feLZnjSwlLbMHHIUEgoiEhwrL5eGcdPrEGoNABqe8UwiemIrNmPpXraL98IFEz
	 oeb+4gjY1Oh/RfuJxZCTwT+ltpJibeUI+w20t+F0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgAHVCM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 16:02:12 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33313 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbgAHVCM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 16:02:12 -0500
Received: by mail-ot1-f65.google.com with SMTP id b18so5040623otp.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 13:02:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uIbTO+scLpMtdyQX4VTD0iVt1QuxcxYNeAASTguI5Fc=;
        b=rYz0y28Pjvry0lH5HOTDkR98UKCQU3i8rrKINVNQsdKgBvJh6CEgBYNXCmw+OQnMWx
         vfFSV3c2YjDnbzS8iuvOZZZoZtvVbZbxE+wNq1bcanS35VN5vyKFskWroRBjddK5a70a
         wRFNhb9+HWs+wB8+d54Y1EZA5ebqQP3xdm1zIW28PCRaJNw4k8b8OvA88310p/cn+THg
         COlDS1sGGDl4BKNe5CP/rzBDTl1P4UDss0KhpJPUADbXXI5ZI0qvhLPRIIX23B1W9Txf
         iA5iFBFHli1PZRh+5+9TPz9SI/aIThqyMO6SABzZjpNahTDhQxeEtKZmz/zA+pPHMvxA
         fv5w==
X-Gm-Message-State: APjAAAWoh6D841t79dZ+8ZL6i8mXFW24+TykOV+CT0yXAOREWEIYIMjR
        fvfRF00K0ahbt29EGKSxY3yNtb0=
X-Google-Smtp-Source: APXvYqy6iV1MkQCvZ7v0gdO17U46MXEvSVRWOd+4ebHLPtm0ok12jRP+lb41rxdJ1WokMMTuTQXwyQ==
X-Received: by 2002:a9d:6a5a:: with SMTP id h26mr5901138otn.103.1578517331363;
        Wed, 08 Jan 2020 13:02:11 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i20sm1494051otl.74.2020.01.08.13.02.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 13:02:10 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 15:02:09 -0600
Date:   Wed, 8 Jan 2020 15:02:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     devicetree@vger.kernel.org,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Icenowy Zheng <icenowy@aosc.io>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt: bindings: add vendor prefix for Kamstrup A/S
Message-ID: <20200108210209.GA27864@bogus>
References: <20200107141143.11838-1-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107141143.11838-1-bruno.thomsen@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue,  7 Jan 2020 15:11:38 +0100, Bruno Thomsen wrote:
> Kamstrup manufactures meters for electricity, heating, cooling
> and water. Including long-life communication infrastructure
> for e.g. smart grid based on Linux, more information on
> https://www.kamstrup.com
> 
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks.

Rob
