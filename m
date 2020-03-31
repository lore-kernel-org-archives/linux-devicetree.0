Return-Path: <SRS0=uzRV=5Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69515C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 20:02:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 41DD520787
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 20:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585684959;
	bh=BV8902f65d0lz8pa5EEuCyB7IknYmLVwjP38dlGdCfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=yK04UncsHSA4YXWqrrNFKV2i4ZbqCdFOZszHnouAtEhl6oUHz+6nV0H2qnjF+9PYk
	 RJRmGqjLi+mKEzG1lR4B2V5yM3adIswlNBw4US0I4ikfZtlqrNuVbtgoSC1NRwOl6K
	 0eqeIWF1Xda32gQuttWthoeOzpJ0r4dj/Wjwbkjc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728840AbgCaUCi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 31 Mar 2020 16:02:38 -0400
Received: from mail-il1-f181.google.com ([209.85.166.181]:42405 "EHLO
        mail-il1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgCaUCi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 31 Mar 2020 16:02:38 -0400
Received: by mail-il1-f181.google.com with SMTP id f16so20713449ilj.9;
        Tue, 31 Mar 2020 13:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=upP4G73Ul2SBmEIEQRpdxDJ/Oi/LqfJPjjsfAUlUCuA=;
        b=hZCMr5pqBFRnd9adFzdzifKLOXmuG23voEATK6EAialNcl8tIg5P5Iu4/k1774T7Kj
         81W3HHASFCqC45a71HLIVEtKDyz0OoPDVdR35OSKjrp9u6hLm/qb1XR5zxTSU9OF9A+0
         /+g7u0aESSamKGNC1Lf5g97MOIk+aZo86UhKh8bfzuAaGpq/VF8pJuhZUogMnVejgEOl
         qEhHyFgVEdnwY1C2utTtXMkeyjJkKMum/6RhbkoJHL7nPmCOLHiYoA3GKCYXjL4uR0Gy
         yHl5XIVhyrtnScJzRwqLtUMDrcdxuNXilZyG4+9Djf4V1zrvpmoelkJSbTzsoQzAM4P4
         Vx+A==
X-Gm-Message-State: ANhLgQ0ArDQMqmO30NCCCQAgqkEp5LWnpMxlXluzSxy5hyZi05cE0QkG
        zUrhIDeLPxIAfxjXR8g+YKgr3gMfvg==
X-Google-Smtp-Source: ADFU+vsJ21NZsBEEqm7Lb7K1Azezc2Df6E2CAGi6OWzLR6nfUVM5t4Rj0udq+sSnbbVAaPxyxLYSJA==
X-Received: by 2002:a92:b68d:: with SMTP id m13mr18155314ill.152.1585684957653;
        Tue, 31 Mar 2020 13:02:37 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id o23sm6237099ild.33.2020.03.31.13.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 13:02:37 -0700 (PDT)
Received: (nullmailer pid 8303 invoked by uid 1000);
        Tue, 31 Mar 2020 20:02:36 -0000
Date:   Tue, 31 Mar 2020 14:02:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
        Adam Ford <aford173@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: vendor-prefixes: Add Beacon vendor
 prefix
Message-ID: <20200331200236.GA8247@bogus>
References: <20200324144324.21178-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324144324.21178-1-aford173@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 24 Mar 2020 09:43:22 -0500, Adam Ford wrote:
> Beacon EmebeddedWorks is the brand owned by Compass Electronics Group,
> LLC based out of the United States.
> https://beaconembedded.com/
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 

Applied, thanks.

Rob
