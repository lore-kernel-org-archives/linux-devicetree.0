Return-Path: <SRS0=wVrF=AS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B5AEC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jul 2020 13:07:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CFBA20771
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jul 2020 13:07:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgGGNHw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jul 2020 09:07:52 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:50938 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726745AbgGGNHw (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 7 Jul 2020 09:07:52 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1jsnK1-0041HM-8R; Tue, 07 Jul 2020 15:07:41 +0200
Date:   Tue, 7 Jul 2020 15:07:41 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     vineetha.g.jaya.kumaran@intel.com
Cc:     davem@davemloft.net, kuba@kernel.org, mcoquelin.stm32@gmail.com,
        robh+dt@kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, weifeng.voon@intel.com,
        hock.leong.kweh@intel.com, boon.leong.ong@intel.com
Subject: Re: [PATCH 1/2] dt-bindings: net: Add bindings for Intel Keem Bay
Message-ID: <20200707130741.GA938746@lunn.ch>
References: <1594097238-8827-1-git-send-email-vineetha.g.jaya.kumaran@intel.com>
 <1594097238-8827-2-git-send-email-vineetha.g.jaya.kumaran@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594097238-8827-2-git-send-email-vineetha.g.jaya.kumaran@intel.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> +        mdio0 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            compatible = "snps,dwmac-mdio";
> +
> +            ethernet-phy@0 {
> +                compatible = "ethernet-phy-id0141.0dd0",
> +                              "ethernet-phy-ieee802.3-c22";

You only need to provide the phy-id when the PHY is broken and
registers 2 and 3 don't contain a valid ID. And c22 is the default, so
also not needed. The Marvell 88E1510 will work without these
compatible strings.

	   Andrew
