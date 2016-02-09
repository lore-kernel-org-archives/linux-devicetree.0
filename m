From: Sylvain Lemieux <slemieux.tyco@gmail.com>
Subject: Re: [PATCH 1/2] clk: lpc32xx: add clock frequency output
 configuration
Date: Tue, 09 Feb 2016 15:07:10 -0500
Message-ID: <1455048430.19294.3.camel@localhost>
References: <1455043670-19025-1-git-send-email-slemieux.tyco@gmail.com>
	 <20160209185723.GC31947@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160209185723.GC31947@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: robh+dt@kernel.org, mturquette@baylibre.com, stigge@antcom.de, vz@mleia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2016-02-09 at 10:57 -0800, Stephen Boyd wrote:
> On 02/09, slemieux.tyco@gmail.com wrote:
> > From: Sylvain Lemieux <slemieux@tycoint.com>
> > 
> > This patch add the support to setup the clock frequency output
> > using an optional parameter from the device tree.
> > 
> > The previous kernel version did not change the clock frequency
> > output setup by the kickstart and/or bootloader;
> > this version always setup the clock frequency output to 208MHz.
> > 
> > Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
> > ---
> 
> We have assigned-clock-rates, can you use that instead?
> 
OK, I will submit a new version of the patch tomorrow.

