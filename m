Return-Path: <SRS0=Z85Q=FN=pengutronix.de=p.zabel@kernel.org>
Message-ID: <1519040770.3408.5.camel@pengutronix.de>
Subject: Re: [PATCH 0/3] reset: simple: enable for ASPEED SoCs
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 19 Feb 2018 12:46:10 +0100
In-Reply-To: <20180219065438.19933-1-joel@jms.id.au>
References: <20180219065438.19933-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>
Cc: Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-ID: <devicetree@vger.kernel.org>

Hi Joel,

On Mon, 2018-02-19 at 17:24 +1030, Joel Stanley wrote:
> Hello Philip,
> 
> Here is a series that enables the simple reset driver for the ASPEED
> SoCs. You may recall I posted a patch back in May 2017 with a
> similar idea[1]. I was happy to see that you merged a driver that solves
> the problem, and suits our purpose for the ASPEED. Thanks!

Yes, sometimes it takes a few drivers to see what the common patterns
are. When it came to unify them, starting from one of the preexisting
drivers seemed like the straightforward thing to do.

regards
Philipp
