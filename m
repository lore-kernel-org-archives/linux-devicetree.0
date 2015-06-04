From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 1/2] rtc: mxc: add a second clock
Date: Fri, 5 Jun 2015 00:17:56 +0200
Message-ID: <20150604221756.GD713@piout.net>
References: <1431729330-7625-1-git-send-email-tremyfr@gmail.com>
 <1431729330-7625-2-git-send-email-tremyfr@gmail.com>
 <20150528115731.GN2185@piout.net>
 <5570BE33.9080103@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5570BE33.9080103@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Reynes <tremyfr@gmail.com>
Cc: shawn.guo@linaro.org, kernel@pengutronix.de, linux@arm.linux.org.uk, a.zummo@towertech.it, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, fabio.estevam@freescale.com
List-Id: devicetree@vger.kernel.org

On 04/06/2015 at 23:08:03 +0200, Philippe Reynes wrote :
> >You are getting the rate but don't you need to clk_prepare_enable()?
> 
> This IP needs the clock reference rate for his configuration,
> so I think that I only need the rate.
> 

I think we need to check whether we are guaranteed to get a result from
get_rate even if the clock is not enabled.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
