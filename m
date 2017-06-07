From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: Add bindings for basic reset
 controller
Date: Wed, 7 Jun 2017 15:49:16 -0500
Message-ID: <20170607204916.n3wh3fkwbfctdv6s@rob-hp-laptop>
References: <20170530060851.29923-1-joel@jms.id.au>
 <20170530060851.29923-2-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170530060851.29923-2-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Andrew Jeffery <andrew@aj.id.au>
List-Id: devicetree@vger.kernel.org

On Tue, May 30, 2017 at 03:38:50PM +0930, Joel Stanley wrote:
> This adds the bindings documentation for a basic single-register reset
> controller.
> 
> The bindings describe a single 32-bit register that contains up to 32
> reset lines, each deasserted by clearing the appropriate bit in the
> register. Optionally a property can be provided that changes this
> behaviour to assert on clear.
> 

I think this is a good idea for kernel code, but not for bindings. We 
don't really want per register bindings. 

The problem with any generic/simple/basic binding is they always start 
that way. Then we add one property at a time not in any well planned 
way. I can easily come up with additions. For example, what about 
self-clearing reset bits. Or 2 bits per reset. Or multiple resets that 
have to be controlled together. 8 or 16-bit registers.

IRQs and GPIOs could also be described in some cases with just groups of 
32-bit registers for set,clear,status,mask,etc., but we don't do that in 
bindings for the same reasons.

Rob
