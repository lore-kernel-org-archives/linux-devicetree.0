From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v3 3/4] mfd: arizona: Switch to using clock driver for
 32k clock
Date: Mon, 11 Jan 2016 11:03:14 +0000
Message-ID: <20160111110314.GF1490@localhost.localdomain>
References: <1452252582-20834-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1452252582-20834-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20160111102545.GX14104@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160111102545.GX14104@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: mturquette@baylibre.com, cw00.choi@samsung.com, sboyd@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Mon, Jan 11, 2016 at 10:25:46AM +0000, Lee Jones wrote:
> On Fri, 08 Jan 2016, Charles Keepax wrote:
> 
> > Now we have a clock driver that can control the 32k clock use this
> > rather than directly controlling the 32k clock from the MFD device.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> > ---
> > 
> > No changes since v2.
> > 
> > Thanks,
> > Charles
> > 
> >  drivers/mfd/arizona-core.c       | 104 +++++++++------------------------------
> >  include/linux/mfd/arizona/core.h |   7 +--
> >  2 files changed, 25 insertions(+), 86 deletions(-)
> 
> I guess this needs to go in with the Clk changes, which are yet to be
> reviewed, right?
> 
> For my own reference:
>   Acked-by: Lee Jones <lee.jones@linaro.org>
> 
> [...]

Yeah this needs to go in with the clock changes themselves.

Thanks,
Charles
