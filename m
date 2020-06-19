Return-Path: <SRS0=bA0P=AA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BA8C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 13:52:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9095521548
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 13:52:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgFSNwR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 19 Jun 2020 09:52:17 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:48956 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725806AbgFSNwQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 19 Jun 2020 09:52:16 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1jmHRE-001HSy-FP; Fri, 19 Jun 2020 15:52:12 +0200
Date:   Fri, 19 Jun 2020 15:52:12 +0200
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
Subject: Re: [RFC PATCH 7/9] net: dsa: hellcreek: Add PTP status LEDs
Message-ID: <20200619135212.GE304147@lunn.ch>
References: <20200618064029.32168-1-kurt@linutronix.de>
 <20200618064029.32168-8-kurt@linutronix.de>
 <20200618174650.GI240559@lunn.ch>
 <87366rqw9b.fsf@kurt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87366rqw9b.fsf@kurt>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 19, 2020 at 10:45:36AM +0200, Kurt Kanzenbach wrote:
> Hi Andrew,
> 
> On Thu Jun 18 2020, Andrew Lunn wrote:
> > On Thu, Jun 18, 2020 at 08:40:27AM +0200, Kurt Kanzenbach wrote:
> >> The switch has two controllable I/Os which are usually connected to LEDs. This
> >> is useful to immediately visually see the PTP status.
> >> 
> >> These provide two signals:
> >> 
> >>  * is_gm
> >> 
> >>    This LED can be activated if the current device is the grand master in that
> >>    PTP domain.
> >> 
> >>  * sync_good
> >> 
> >>    This LED can be activated if the current device is in sync with the network
> >>    time.
> >> 
> >> Expose these via the LED framework to be controlled via user space
> >> e.g. linuxptp.
> >
> > Hi Kurt
> >
> > Is the hardware driving these signals at all? Or are these just
> > suggested names in the documentation? It would not be an issue to have
> > user space to configure them to use the heartbeat trigger, etc?
> 
> These are more like GPIOs. If a 1 is set into the register then the
> hardware drives the signal to high. The names are from the
> documentation:
> 
>  * sync_good: This signal indicates that the switch is in sync
>  * is_gm:     This signal indicates that the switch is the grand master
> 
> However, these signals have to be set by user space. Most likely these
> signals are connected to LEDs.

Thanks

Since these are general purpose LEDs, you might want to look at

Documentation/devicetree/bindings/leds/common.yaml

and implement some of the common properties. The label should ideally
correspond to the text on the case, not what the datasheet says. So
getting it from DT is a good idea. Do Hirschmanns own cases use this
text on there front plate?

	    Andrew
