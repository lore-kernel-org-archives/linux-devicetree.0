Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D82C33CA2
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 20:49:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9953D2070E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 20:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578516598;
	bh=CkhtezZ3aI7W2ttzSwXUkCU/xpPlgbQ804mcJzg2vnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=SeNfYmInTnsub8fBAADpHjSvpISFpSW2LJzg90E33pQrLtPszHSIJqtC5a68aScHm
	 IS/ZD9Sx0tlXHk618hzn/GQK9kHtwgtEXLIO9FMy5l3JS7XxD1Tl2t3z8dNEooPxww
	 7j2+hV6y4Y+30ppp2XB7D/NUVbBcUR4Xrf2vzHSE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgAHUt6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 15:49:58 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:32988 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgAHUtv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 15:49:51 -0500
Received: by mail-oi1-f194.google.com with SMTP id v140so3960553oie.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 12:49:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y2blFDS/4xPh5DF4rW8+xU8LHc7BSZTKgnRIfuXGUCs=;
        b=ouLvz+1nIrBREBzegW1RJchtpUvJUk2hK3gHSsHmbqdPHsQyye8eNihG6pR6OAus5N
         y2uSnplq8cdSMJm8drY6czG3vxGaL/2FsC0Mb5hBfUooEbshQ9liysob1teJaUDtCElk
         zyXQD1b33ixEnluIdK/Z0f5dbSZnW4trOJjMR+GHSJRF41ooVq5CWoe3RehfiqAETrlg
         eyDozDUIxVbq5ROVb7B2ddAqM82p6OUVY9CzCyLAkCyNs3wnU2TehVu88mIsPTcv+OCq
         10/SsAwZuVGyraTL00SJW/LwBAWx7KqSHJXENHcDB/xNs1rPHBWWiw2TO28puGpo70UV
         XWgQ==
X-Gm-Message-State: APjAAAWQJRppVp65YTyHAoVbKrEDOTmO2iGCHQFduWDrC7mY3nurLzt3
        EohqubgTX/8/nMEIZynJEhK8zGs=
X-Google-Smtp-Source: APXvYqw/bDZykAkuTvf5Ik8w9uLXRntbCD27C5qvmjHdhHWTx3UJ1PElZ0vOiD083ICzoehnz3ggLA==
X-Received: by 2002:aca:530e:: with SMTP id h14mr381449oib.105.1578516590183;
        Wed, 08 Jan 2020 12:49:50 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t13sm1497595otp.33.2020.01.08.12.49.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 12:49:49 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 14:49:48 -0600
Date:   Wed, 8 Jan 2020 14:49:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        mark.rutland@arm.com, kgene@kernel.org, krzk@kernel.org,
        hminas@synopsys.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com,
        amelie.delaunay@st.com,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v3] dt-bindings: usb: Convert DWC2 bindings to json-schema
Message-ID: <20200108204948.GA9782@bogus>
References: <20200107091630.12796-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107091630.12796-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 7 Jan 2020 10:16:30 +0100, Benjamin Gaignard wrote:
> Convert DWC2 bindings to DT schema format using json-schema.
> DWC2 is widely use but a couple of compatibles and properties
> (vusb_d-supply,vusb_a-supply) were missing in dwc2.txt, the
> patch add them.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> CC: Minas Harutyunyan <hminas@synopsys.com>
> CC: Krzysztof Kozlowski <krzk@kernel.org>
> 
> changes in version 3:
> - put Rob Herring as maintainer
> - change the example to use one of the listed compatible
> 
> changes in version 2:
> - put Minas Harutyunyan <hminas@synopsys.com> as maintainer
> - remove type and description from phy property
> - remove description from compatible items
> - simplify samsung,s3c6400-hsotg compatible handling
> 
>  Documentation/devicetree/bindings/usb/dwc2.txt  |  64 ----------
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 151 ++++++++++++++++++++++++
>  2 files changed, 151 insertions(+), 64 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/dwc2.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/dwc2.yaml
> 

Applied, thanks.

Rob
