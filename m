Return-Path: <devicetree-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:40254 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750727Ab3IFIJH (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 6 Sep 2013 04:09:07 -0400
Date: Fri, 6 Sep 2013 10:09:02 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [RFC PATCH] dt: add a binding review checklist
Message-ID: <20130906100902.13eb3c7a@skate>
In-Reply-To: <20130905111918.GQ18206@e106331-lin.cambridge.arm.com>
References: <1378334532-21025-1-git-send-email-swarren@wwwdotorg.org>
	<20130905111918.GQ18206@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Mark, Stephen,

On Thu, 5 Sep 2013 12:19:18 +0100, Mark Rutland wrote:

> > +Compatible Property
> > +-------------------
> > +
> > +A compatible value identifies a hardware module. It needs to identify the
> > +vendor (e.g. NVIDIA), type or name of device (e.g. I2C), and version of the
> > +device (e.g. an IP block version number or chip name). The following formats
> > +of compatible value are acceptable:
> > +
> > +* ${vendor},${device}-${version} (e.g. ti,omap4-i2c)
> > +* ${vendor},${version}-${device} (e.g. nvidia,tegra20-i2c)
> > +* ${vendor},${device}-${version} (e.g. synopsis,dwc3)
> 
> It would be nice to make it clear that the compatible string for a
> device should (wherever possible) be the name of the specific IP block,
> which isn't completely clear above (e.g. "arm,pl011" is preferred to
> "arm,vexpress-v2m-serial"). It would be nice if we could avoid examples
> with SoC names for this reason.
> 
> Obviously there will be SoC-specific devices that will have SoC names in
> their bindings. But those bindings should be considered carefully.

I agree that it would be nice to make it clear that using the name of
an SoC family in the compatible string is not a good idea, and that
instead the name of the particular SoC that originally introduced the
IP block should be used. I.e nvidia,tegra20-i2c is fine, but
nvidia,tegra-i2c is not, because we have no idea what I2C controllers
will be used on future Tegra SoCs.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
