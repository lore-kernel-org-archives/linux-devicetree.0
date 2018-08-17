Return-Path: <SRS0=WMqh=LA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48041 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbeHQLnq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Aug 2018 07:43:46 -0400
Date: Fri, 17 Aug 2018 10:41:11 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: adv748x: Override
 secondary addresses
Message-ID: <20180817084110.i34ejws3ari7rgmt@verge.net.au>
References: <20180807155933.3732-1-kieran.bingham@ideasonboard.com>
 <20180810120111.k35v6mbm7ryvhpvx@verge.net.au>
 <2bf8e52a-27fa-4f64-09bf-44cd0f0b43c2@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bf8e52a-27fa-4f64-09bf-44cd0f0b43c2@ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Aug 10, 2018 at 01:30:48PM +0100, Kieran Bingham wrote:
> Hi Simon,
> 
> On 10/08/18 13:01, Simon Horman wrote:
> > On Tue, Aug 07, 2018 at 04:59:33PM +0100, Kieran Bingham wrote:
> >> Ensure that the ADV748x device addresses do not conflict, and group them
> >> together (visually in i2cdetect)
> > 
> > Hi Kieran,
> > 
> > could you help me out with some pointers on how to correlate this
> > with the HW documentation?
> 
> Not easily :) - Except for the 'main' address (0x70), these are not
> addresses documented by the datasheet. <by the very nature of the
> activity>. The driver supports the DT providing the slave pages to
> allocate. One day the I2C framework might allow us to 'request' an
> unused page :D
> 
> I performed a scan on the Salvator-X, (i2cdetect -r -y 4) and identified
> a region of unused I2C address space to allocate the 12 pages so that
> they did not conflict.
> 
> In particular, the address <0x30> which is the default for the CBUS page
> conflicts with the default address of the OV10635 used by the GMSL
> cameras on the same bus, and so I needed to move that one.
> 
> To make the effects clear, (and the i2cdetect reporting more obvious) I
> chose to reassign all of the movable pages so that it is clear they are
> from the same device.
> 
> Rather annoyingly it's difficult to map a slave page back to it's driver
> due to the fact that it gets registered as a 'dummy' driver, so keeping
> the related addresses together is quite valuable.
> 
> As soon as I get some free cycles, I plan to look at being able to map
> extra driver information to dummy I2C registrations to make it easier to
> identify who owns the address :)

Thanks for the follow-up, that makes things a lot clearer.

I see that the corresponding bindings patches have been reviewed.
I have now gone ahead and applied this patch for v4.20.
