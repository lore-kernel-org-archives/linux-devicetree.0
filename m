From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v4 00/06] clocksource: sh_cmt: DT binding rework V4
Date: Tue, 11 Jul 2017 13:56:46 +0200
Message-ID: <20170711115646.GL4517@verge.net.au>
References: <20160314142342.17180.21352.sendpatchset@little-apple>
 <20161124105843.GA26737@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161124105843.GA26737@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be, robh@kernel.org, daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

On Thu, Nov 24, 2016 at 11:58:43AM +0100, Simon Horman wrote:
> Hi Magnus,
> 
> On Mon, Mar 14, 2016 at 11:23:42PM +0900, Magnus Damm wrote:
> > clocksource: sh_cmt: DT binding rework V4
> > 
> > [PATCH v4 01/06] devicetree: bindings: Remove sh7372 CMT binding
> > [PATCH v4 02/06] devicetree: bindings: R-Car Gen2 CMT0 and CMT1 bindings
> > [PATCH v4 03/06] devicetree: bindings: r8a73a4 and R-Car Gen2 CMT bindings
> > [PATCH v4 04/06] devicetree: bindings: Deprecate property, update example
> > [PATCH v4 05/06] devicetree: bindings: Remove unused 32-bit CMT bindings
> > [PATCH v4 06/06] devicetree: bindings: Remove deprecated properties
> > 
> > Here is the latest and hopefully final take on updating the CMT DT
> > bindings for R-Car Gen2. In total there are 6 patches that have acks
> > and are ready to be picked up and merged. Other earlier posted changes
> > such as driver modification and SoC DTS bits depend on this series.
> 
> I am wondering what the state of this work is.
> I see only one minor review comment for this series.
> It would be great to see it merged.

Ping
