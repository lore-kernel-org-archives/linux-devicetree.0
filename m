From: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 1/4] clk: bcm2835: Move under bcm/ with other Broadcom
 SoC clk drivers.
Date: Thu, 1 Oct 2015 15:43:09 +0100
Message-ID: <20151001144309.GZ3214@x1>
References: <1441562263-19888-1-git-send-email-eric@anholt.net>
 <1441562263-19888-2-git-send-email-eric@anholt.net>
 <20150907064838.GE4796@x1>
 <20150908192257.GQ15099@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150908192257.GQ15099@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Eric Anholt <eric@anholt.net>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Mike Turquette <mturquette@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 08 Sep 2015, Stephen Boyd wrote:

> On 09/07, Lee Jones wrote:
> > On Sun, 06 Sep 2015, Eric Anholt wrote:
> > 
> > > clk-bcm2835.c predates the drivers under bcm/, but all the new BCM
> > > drivers are going in there so let's follow them.
> > > 
> > > Signed-off-by: Eric Anholt <eric@anholt.net>
> > > ---
> > >  drivers/clk/Makefile          |  1 -
> > >  drivers/clk/bcm/Makefile      |  1 +
> > >  drivers/clk/bcm/clk-bcm2835.c | 60 +++++++++++++++++++++++++++++++++++++++++++
> > >  drivers/clk/clk-bcm2835.c     | 60 -------------------------------------------
> > 
> > You need to resubmit this with `git format-patch -M`.
> 
> You don't have to. It would have been nice if it was formatted
> with -M so that review is easier, but we can always apply the
> patch and then check the result to make sure things look the
> same.

I vehemently avoid having to apply patches to my local repo in order
to review them.  Submitters should always be encouraged to use -M,
especially in cases where there have been changes.
