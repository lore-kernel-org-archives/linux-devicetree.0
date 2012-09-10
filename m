From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2 1/4] clk: add of_clk_src_onecell_get() support
Date: Mon, 10 Sep 2012 10:32:26 -0700
Message-ID: <20120910173226.20289.88000@nucleus>
References: <1345642590-29905-1-git-send-email-shawn.guo@linaro.org>
 <1345642590-29905-2-git-send-email-shawn.guo@linaro.org>
 <20120831064125.GA3271@r65073-Latitude-D630>
 <20120906221155.20289.73650@nucleus>
 <20120907002618.GB26709@S2101-09.ap.freescale.net>
 <20120907192444.20289.97042@nucleus>
 <20120910062535.GU26709@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120910062535.GU26709@S2101-09.ap.freescale.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org, arnd.bergmann@linaro.org
List-Id: devicetree@vger.kernel.org

Quoting Shawn Guo (2012-09-09 23:25:43)
> On Fri, Sep 07, 2012 at 12:24:44PM -0700, Mike Turquette wrote:
> > Done.  I've taken patch #1 "clk: add of_clk_src_onecell_get() support"
> > into clk-next.
> > 
> Thanks, Mike.
> 
> I'm still waiting for a stable branch like clk-3.7, which I can ask
> arm-soc folks to pull as a dependency.  I have some imx and mxs 3.7
> material currently pending on this.
> 

Hi Shawn,

I didn't realize you were waiting on a stable branch.  It seemed that no
one used my clk-3.6 stable branch during the last cycle so I got lazy
and decided not to have a clk-3.7 this time around.  However my current
clk-next HEAD is stable so creating one is easy enough... done!

Now that I have a clk-3.7 stable branch I'll plan on merging clk-next
into clk-3.7 periodically as stability dictates.

Arnd, how does the "arm-soc dependency" thing work?  Do I still issue a
pull request to Linus for 3.7?

Regards,
Mike

> -- 
> Regards,
> Shawn
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
