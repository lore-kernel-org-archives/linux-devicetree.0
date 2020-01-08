Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92D3C33CA2
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:24:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F63E2073A
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578500687;
	bh=kzW5kFCDj6mE8GzKsehf7pn9og/N5y4v3qR8jdrHmF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jVRzn+PBGOMiDeJyc5kezG/vqFwVUuKvD/BaLSL7fR/AzkU6mIX1TMXBUACh1NORr
	 YVDp/3TXlcsVt70Qwy8ueymjBcPqcdWYOMY87SDjnl77Y8jo3OFbJrER83Tc4EIeJW
	 fa51jFt8ABEuV2HBenNprBGl2nZySqyQKvnal4W8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729062AbgAHQYq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 11:24:46 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39112 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729024AbgAHQYq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 11:24:46 -0500
Received: by mail-oi1-f194.google.com with SMTP id a67so3128232oib.6
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 08:24:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mkqdKgKEKSOJiiH/qFun7xmdUvzRn9MkMSMD1VCbtj0=;
        b=XDQ37hT1PxGOnZekDX87pqqemmPOondIIEBd/8vScFlT48Y/cexcE58Cl2zFgW6yCD
         5RSZ0lZ8A3VoVMUvGhrfTThG95xNuj+iGaGmCo4K1M/5J1wQ/iZx+hknKoZksT+an7Mu
         ZbRjrknud8E28M3PhKGmsykmqutpvvdIDHOu+8RHLQrzUifEsxIYGWRT2XBtOLssmhN5
         sNWQ9hoDc6CklygRNCv2etqAsE5carI+qGX1QQqdT8txRPY9/FiycVy7FCrIIs0WcYzj
         0Vo0uZTJqaQx1HVs0x8GNvNwBqEcLynfPvovWqHZvgJ3eMb7XekweDuWUVPkLPzcYOlF
         OQjg==
X-Gm-Message-State: APjAAAVTy7PDGky2UBOWL8fizFOKTBrmAF796F92npg/uPCAX2bMEuuA
        lClX0TbpAKInBeBZRq/5SpNG0vA=
X-Google-Smtp-Source: APXvYqxVO8P9udH+4hyr3qA7sEGI6kOSSFeS7x3Xh5y+1fvQpNamRa5Igxa5OEcijDSyIhzM6LxqFw==
X-Received: by 2002:a05:6808:907:: with SMTP id w7mr3836259oih.91.1578500685308;
        Wed, 08 Jan 2020 08:24:45 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i7sm1194256oib.42.2020.01.08.08.24.43
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:24:43 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:24:43 -0600
Date:   Wed, 8 Jan 2020 10:24:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>,
        "Madalin Bucur (OSS)" <madalin.bucur@oss.nxp.com>
Cc:     "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [RFC] obsolete references to
 Documentation/devicetree/bindings/net/ethernet.txt
Message-ID: <20200108162443.GA16710@bogus>
References: <VI1PR04MB5567BBD2827A5DDDFD0D82B7EC2E0@VI1PR04MB5567.eurprd04.prod.outlook.com>
 <20191226110821.GE1480@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191226110821.GE1480@lunn.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Dec 26, 2019 at 12:08:21PM +0100, Andrew Lunn wrote:
> On Mon, Dec 23, 2019 at 09:00:50AM +0000, Madalin Bucur (OSS) wrote:
> > Hi,
> > 
> > this patch removed the ethernet.txt content and added the information found in
> > it in the ethernet-controller.yaml (Documentation/devicetree/bindings/net):
> > 
> >   commit 9d3de3c58347623b5e71d554628a1571cd3142ad
> >   Author: Maxime Ripard <maxime.ripard@bootlin.com>
> >   Date:   Thu Jun 27 17:31:43 2019 +0200
> > 
> >       dt-bindings: net: Add YAML schemas for the generic Ethernet options
> > 
> >       The Ethernet controllers have a good number of generic options that can be
> >       needed in a device tree. Add a YAML schemas for those.
> > 
> >       Reviewed-by: Rob Herring <robh@kernel.org>
> >       Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> >       Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> >       Signed-off-by: Rob Herring <robh@kernel.org>
> > 
> > There are still many references to the previous ethernet.txt document:
> > 
> >   $ grep ethernet.txt Documentation/devicetree/bindings/net/ -r | wc -l
> >   96
> > 
> > Should those be updated too or it's enough to rely on the current content
> > of the previous ethernet.txt file:
> > 
> >   $ cat Documentation/devicetree/bindings/net/ethernet.txt
> >   This file has moved to ethernet-controller.yaml.

If this wasn't enough, we wouldn't have put that there.

> 
> Hi Madalin
> 
> Feel free to fix the references if you want. Probably a perl one liner
> should do most of the work.

The above was done to avoid some churn. The real fix is convert bindings 
to DT schema. The references should get dropped as part of that.

Rob
