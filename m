Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F3DC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 13:47:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6C022082F
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 13:47:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730254AbgFRNrK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 18 Jun 2020 09:47:10 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:46798 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728159AbgFRNrJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 18 Jun 2020 09:47:09 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1jlusi-0017YB-PG; Thu, 18 Jun 2020 15:47:04 +0200
Date:   Thu, 18 Jun 2020 15:47:04 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Kurt Kanzenbach <kurt@linutronix.de>
Cc:     Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Kamil Alkhouri <kamil.alkhouri@hs-offenburg.de>,
        ilias.apalodimas@linaro.org
Subject: Re: [RFC PATCH 9/9] dt-bindings: net: dsa: Add documentation for
 Hellcreek switches
Message-ID: <20200618134704.GQ249144@lunn.ch>
References: <20200618064029.32168-1-kurt@linutronix.de>
 <20200618064029.32168-10-kurt@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618064029.32168-10-kurt@linutronix.de>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> +Ethernet switch connected memory mapped to the host, CPU port wired to gmac0:
> +
> +soc {
> +        switch0: switch@0xff240000 {
> +                compatible = "hirschmann,hellcreek";
> +                status = "okay";
> +                reg = <0xff240000 0x1000   /* TSN base */
> +                       0xff250000 0x1000>; /* PTP base */
> +                dsa,member = <0 0>;
> +
> +                ports {
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +
> +                        port@0 {
> +                                reg = <0>;
> +                                label = "cpu";
> +                                ethernet = <&gmac0>;
> +                        };
> +
> +                        port@2 {
> +                                reg = <2>;
> +                                label = "lan0";
> +                                phy-handle = <&phy1>;
> +                        };
> +
> +                        port@3 {
> +                                reg = <3>;
> +                                label = "lan1";
> +                                phy-handle = <&phy2>;
> +                        };
> +                };
> +        };
> +};
> +
> +&gmac0 {
> +        status = "okay";
> +        phy-mode = "mii";
> +
> +        fixed-link {
> +                speed = <100>;
> +                full-duplex;

Hi Kurt

The switch is 100/100Mbps right? The MAC is only Fast ethernet. Do you
need some properties in the port@0 node to tell the switch to only use
100Mbps? I would expect it to default to 1G. Not looked at the code
yet...

	Andrew
