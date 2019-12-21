Return-Path: <SRS0=APCC=2L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB96C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Dec 2019 10:56:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 480D62072B
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Dec 2019 10:56:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="O4Qm8SZ1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbfLUK4K (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 21 Dec 2019 05:56:10 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:35948 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbfLUK4K (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 21 Dec 2019 05:56:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=z6Lc9qsiIXNSI0qdwbRLdqykHiW2gishvbVnEL/Bm34=; b=O4Qm8SZ1bmI5Ex1h31feUCMzMB
        x1kiN8e3P9JKthqXcHhPBOMkD1mQNgGZzRi20E7VqXID5uHI1AnuIgJTBaCgT/GP+FyawKHZPFw4B
        nPfRTN2PLCo0BIynssqCoyuzjYNaKkaEur55wTpT54UG/nR+H6/X2l9x2xLAFqL6L7uw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1iicQV-0000GQ-Gg; Sat, 21 Dec 2019 11:56:03 +0100
Date:   Sat, 21 Dec 2019 11:56:03 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Richard Cochran <richardcochran@gmail.com>
Cc:     netdev@vger.kernel.org, David Miller <davem@davemloft.net>,
        devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Willem de Bruijn <willemb@google.com>,
        Wingman Kwok <w-kwok2@ti.com>
Subject: Re: [PATCH V7 net-next 11/11] ptp: Add a driver for InES time
 stamping IP core.
Message-ID: <20191221105603.GC30801@lunn.ch>
References: <cover.1576865315.git.richardcochran@gmail.com>
 <18c9fd4f00db0a397b16df928a80abb6530376db.1576865315.git.richardcochran@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18c9fd4f00db0a397b16df928a80abb6530376db.1576865315.git.richardcochran@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> +static int ines_clock_init(struct ines_clock *clock, struct device *device,
> +			   void __iomem *addr)
> +{
> +	struct device_node *node = device->of_node;
> +	unsigned long port_addr;
> +	struct ines_port *port;
> +	int i, j;
> +
> +	INIT_LIST_HEAD(&clock->list);
> +	clock->node = node;
> +	clock->dev  = device;
> +	clock->base = addr;
> +	clock->regs = clock->base;
> +
> +	for (i = 0; i < INES_N_PORTS; i++) {
> +		port = &clock->port[i];
> +		port_addr = (unsigned long) clock->base +
> +			INES_PORT_OFFSET + i * INES_PORT_SIZE;
> +		port->regs = (struct ines_port_registers *) port_addr;
> +		port->clock = clock;
> +		port->index = i;
> +		INIT_DELAYED_WORK(&port->ts_work, ines_txtstamp_work);
> +		spin_lock_init(&port->lock);
> +		INIT_LIST_HEAD(&port->events);
> +		INIT_LIST_HEAD(&port->pool);
> +		for (j = 0; j < INES_MAX_EVENTS; j++)
> +			list_add(&port->pool_data[j].list, &port->pool);
> +	}
> +
> +	ines_write32(clock, 0xBEEF, test);
> +	ines_write32(clock, 0xBEEF, test2);
> +
> +	dev_dbg(device, "ID      0x%x\n", ines_read32(clock, id));
> +	dev_dbg(device, "TEST    0x%x\n", ines_read32(clock, test));
> +	dev_dbg(device, "VERSION 0x%x\n", ines_read32(clock, version));
> +	dev_dbg(device, "TEST2   0x%x\n", ines_read32(clock, test2));

Hi Richard

Since you are respinnig...

Maybe fail the probe if when you read back test and tests they don't
have the expected value?

     Andrew
