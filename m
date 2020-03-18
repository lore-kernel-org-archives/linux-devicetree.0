Return-Path: <SRS0=uBtF=5D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88ED2C4332B
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Mar 2020 22:04:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A82B20752
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Mar 2020 22:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584569064;
	bh=sovdIY3yDWoXi+MWvJGwX19McPWu3q+T94mir4GE0Qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=aAfWLK5yh1FYXIloJjf/kWAbwj4y3E9dlnF0kT3nmwCi6rmPE72lfgp3ledOkpEo9
	 D/OP8ARqYHkLLDCA/Z1pqGPvomgetBzcF4I94KkwLOJdGLC0jqHMAR9Z5YVOQUQnbN
	 jM7266DJrACWc1Z1KVqVLNhAs/WoNLLPraxUWEVg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbgCRWEX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Mar 2020 18:04:23 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:45596 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbgCRWEX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Mar 2020 18:04:23 -0400
Received: by mail-io1-f66.google.com with SMTP id w7so133802ioj.12;
        Wed, 18 Mar 2020 15:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+CWVz1PqC9x1J8b2vKZBKD1+92zW9gD7VwiBSfs/WS8=;
        b=AzQDD8itbxw/SnRsf5IhWQEIn+3o2t4xdTrBLbHr7n/bkcrtmkJEsgzXfWOQ2I1lC1
         P42QU9c0yGCPuhlCJ8XC2lqFJ4L7qtcranI7DutZZpPBDSRsRwvj4AlebFZv9/dYpN6H
         pc6Zhw80AZWjkUG4Ogji6xS1s9KJGJ8WSDV89jj83hpJegrgpHsxCgaJe+XqcZtLrViv
         Jg874bRE6xRuoch8nWP7kFxonB/0f/ldEEcee5zPkU1DzOfPwsHgPHn5DGoR9gWuy2yy
         LH+ZDjUUKyH7dtkbny/fTkXm4XgMVFF0mGFIXThXRf0Ko/HsVkVk4c+mo2A1RV/Bn6hj
         aX3g==
X-Gm-Message-State: ANhLgQ06h6+nUzwqTxsswiq4z2uMrTBz8em2k0xbDGWZnzY5p5y4fAKW
        yRTsyHp14rveu4aN0+QQNw==
X-Google-Smtp-Source: ADFU+vu7QiIr9ebVPNrrdkopR04JWjjwNDtybY8P+p/5qBaywMWYRFEIc/nLiLNzMolJnR+YK2b1jg==
X-Received: by 2002:a6b:ed09:: with SMTP id n9mr5744705iog.86.1584569062764;
        Wed, 18 Mar 2020 15:04:22 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id t7sm66059ioc.15.2020.03.18.15.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 15:04:21 -0700 (PDT)
Received: (nullmailer pid 16018 invoked by uid 1000);
        Wed, 18 Mar 2020 22:04:20 -0000
Date:   Wed, 18 Mar 2020 16:04:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, jun.li@nxp.com, linux-imx@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH v2 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Message-ID: <20200318220420.GA15468@bogus>
References: <20200314093941.2533-1-peter.chen@nxp.com>
 <20200314093941.2533-2-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200314093941.2533-2-peter.chen@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, 14 Mar 2020 17:39:41 +0800, Peter Chen wrote:
> Add Cadence SALVO PHY binding doc, this PHY is a legacy module,
> and is only used for USB3 and USB2.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
> Changes for v2:
> - Fix kinds of yaml style issue
> 
>  .../bindings/phy/cdns,salvo-phy.yaml          | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/cdns,salvo-phy.example.dt.yaml: usb3-phy@5B160000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/cdns,salvo-phy.example.dt.yaml: usb3-phy@5B160000: #phy-cells:0:0: 1 was expected

See https://patchwork.ozlabs.org/patch/1254920
Please check and re-submit.
