From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH] ARM: at91/dt: pullup dbgu rx instead of tx
Date: Thu, 24 Sep 2015 18:27:19 +0200
Message-ID: <20150924162719.GZ4287@piout.net>
References: <1443105855-15738-1-git-send-email-peda@lysator.liu.se>
 <20150924144753.GY4287@piout.net>
 <5604154E.6050404@lysator.liu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5604154E.6050404@lysator.liu.se>
Sender: stable-owner@vger.kernel.org
To: Peter Rosin <peda@lysator.liu.se>
Cc: linux-arm-kernel@lists.infradead.org, Peter Rosin <peda@axentia.se>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 24/09/2015 at 17:22:54 +0200, Peter Rosin wrote :
> I just noticed that other ports have the same problem in sama5d3.dtsi. E.g.
> 
> 	uart1 {
> 		pinctrl_uart1: uart1-0 {
> 			atmel,pins =
> 				<AT91_PIOA 30 AT91_PERIPH_B AT91_PINCTRL_NONE   /* conflicts with TWD0, ISI_VSYNC */
> 				 AT91_PIOA 31 AT91_PERIPH_B AT91_PINCTRL_PULL_UP>;      /* conflicts with TWCK0, ISI_HSYNC */
> 		};
> 	};
> 
> Given that the original bug I found spread all over the map, it seems
> like someone was confused when the pull-ups were originally added.
> Someone (else?) at Atmel needs to audit this so that pull-ups are
> added on the rx-pins instead of the tx-pins.
> 

Sure, that is the plan!
Thanks again for the report.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
