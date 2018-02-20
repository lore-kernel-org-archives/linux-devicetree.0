Return-Path: <SRS0=f8Rm=FO=pengutronix.de=p.zabel@kernel.org>
Message-ID: <1519145232.3470.13.camel@pengutronix.de>
Subject: Re: [PATCH v2 0/3] reset: simple: enable for ASPEED SoCs
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 20 Feb 2018 17:47:12 +0100
In-Reply-To: <20180220014330.23425-1-joel@jms.id.au>
References: <20180220014330.23425-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>
Cc: Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-ID: <devicetree@vger.kernel.org>

Hi Joel,

On Tue, 2018-02-20 at 12:13 +1030, Joel Stanley wrote:
> v2: Fix typos in bindings document, add Rob's ack
> 
> This series that enables the simple reset driver for the ASPEED SoCs.

Thanks, I have applied patches 1 (with fixup for a whitespace issue that
git complained about) and 2 to the reset/next branch.
I have dropped patch 3 for now because it doesn't seem necessary, but if
there is an actual user that wants to disable reset-simple and UART on
small ASPEED systems, I'll be happy to add it with an explanation.

regards
Philipp
