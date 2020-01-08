Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217FAC282DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:43:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E77FC20720
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578501781;
	bh=ynpqtPeDiLkS3B1XbB+7iA1SxwfKdgld1oNMaDvbztA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=RvU4VehgZQ+RoGD24KiEV9o0BsYIOXVoQFEL6meYzlsxA7y/5FrTl/sFWDekLVj8C
	 OJI7/gqpfmT1wfHpbSx/EqGwToMsL3VPlTz/U2D3zrjtaQcAOsEx4h1f5oOw+1y3rC
	 wAMOXWGAWLDcf2QmBhQWbCs467CBH5TLO+vILjjQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbgAHQmx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 11:42:53 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44167 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727127AbgAHQmx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 11:42:53 -0500
Received: by mail-oi1-f195.google.com with SMTP id d62so3156393oia.11
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 08:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UKDNwGykO2dbNkNckCxJfHqBIvtnDZYUjcmwNmsSzE8=;
        b=NZXFdK4GjOoRxjxFPsyYJOoHUGS1EXB8Qm4v9fJeOJMpqEa9I+YzrC3Hdl23FRpUte
         fQQQCRXhPan9EfeRw0i43t/uuW2EP4JLiMhb3nfI02esZGYsXf1sncqfNeiMbeNnbU3F
         ywLzRt2chbZWPPjTw92cJ/fB9PlXctavsX4ErnssDEdQcMyv6FimPnPaQuUJLmRFOmtL
         P3Y6khTOxFcDK/3RWZYt6/omuh9GVWV3yfpIem64sfyOh8g72rz4u6kOU1jtszTnrHk6
         FM/sQAr/PJlwPomQYLKCc+PmIRRGmkCbvhfrhc+3NXCK2Cn8k8Rs+kxYo5zLGNC96Mnz
         GBAg==
X-Gm-Message-State: APjAAAXaTnRtMFny80gRgmQ2VJ7vbSj8T/JqxMwk5uswRRtsBJnR3+x1
        M6gMQX85iFk7FLsnRwC9Ftq0xQY=
X-Google-Smtp-Source: APXvYqxz4gOjjPo08HpZVcZyky83rvdD0e8SZU5MkELVh4xVNjzV5EofHwrkYyXtqXCiWCGQZ9M3lA==
X-Received: by 2002:a05:6808:f:: with SMTP id u15mr3904600oic.100.1578501772712;
        Wed, 08 Jan 2020 08:42:52 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r13sm1213830oic.52.2020.01.08.08.42.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:42:51 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2208fa
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:42:50 -0600
Date:   Wed, 8 Jan 2020 10:42:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        manivannan.sadhasivam@linaro.org, andrew.smirnov@gmail.com,
        marcel.ziswiler@toradex.com, sebastien.szymanski@armadeus.com,
        aisheng.dong@nxp.com, l.stach@pengutronix.de, angus@akkea.ca,
        cosmin.stoica@nxp.com, gary.bisson@boundarydevices.com,
        leonard.crestez@nxp.com, abel.vesa@nxp.com, jun.li@nxp.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Linux-imx@nxp.com
Subject: Re: [PATCH 3/3] dt-bindings: arm: imx: Add the i.MX8MP EVK board
Message-ID: <20200108164250.GA17075@bogus>
References: <1577426385-31273-1-git-send-email-Anson.Huang@nxp.com>
 <1577426385-31273-3-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577426385-31273-3-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 27 Dec 2019 13:59:45 +0800, Anson Huang wrote:
> Add board binding for i.MX8MP EVK board.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
