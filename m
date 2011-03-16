From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 3/5] arm/dt: mx51: dynamically add clocks per dt nodes
Date: Wed, 16 Mar 2011 22:08:48 +0800
Message-ID: <20110316140847.GC11658@S2100-06.ap.freescale.net>
References: <1300108722-3254-1-git-send-email-shawn.guo@linaro.org>
	<1300108722-3254-4-git-send-email-shawn.guo@linaro.org>
	<20110315074808.GI23050@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110315074808.GI23050-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 15, 2011 at 01:48:08AM -0600, Grant Likely wrote:
> On Mon, Mar 14, 2011 at 09:18:40PM +0800, Shawn Guo wrote:
> > This patch is to change the static clock creating and registering to
> > the dynamic way, which scans dt clock nodes, associate clk with
> > device_node, and then add them to clkdev accordingly.
> > 
> > It's a pretty straight translation from non-dt clock code to dt one,
> > and it does not really change any actual clock code.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  arch/arm/mach-mx5/clock-mx51-mx53.c | 1401 ++++++++++++++++++++++++++++++++++-
> >  1 files changed, 1387 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/arm/mach-mx5/clock-mx51-mx53.c b/arch/arm/mach-mx5/clock-mx51-mx53.c
> > index dedb7f9..c3ec7f6 100644
> > --- a/arch/arm/mach-mx5/clock-mx51-mx53.c
> > +++ b/arch/arm/mach-mx5/clock-mx51-mx53.c
> > @@ -49,6 +49,30 @@ static struct clk emi_fast_clk;
> >  static struct clk ipu_clk;
> >  static struct clk mipi_hsc1_clk;
> >  
> > +#ifdef CONFIG_OF
> > +/*
> > + * The pointers are defined to save the references to the clocks
> > + * dynamically created, and then could be used to replace those
> > + * static references in non-dt clock code.
> > + */
> > +static struct clk *osc_clk_dt;
> > +static struct clk *pll1_main_clk_dt;
> > +static struct clk *pll1_sw_clk_dt;
> > +static struct clk *pll2_sw_clk_dt;
> > +static struct clk *pll3_sw_clk_dt;
> > +static struct clk *lp_apm_clk_dt;
> > +static struct clk *periph_apm_clk_dt;
> > +static struct clk *main_bus_clk_dt;
> > +static struct clk *ipg_clk_dt;
> > +static struct clk *ipg_per_clk_dt;
> > +static struct clk *cpu_clk_dt;
> > +static struct clk *iim_clk_dt;
> > +static struct clk *usboh3_clk_dt;
> > +static struct clk *usb_phy1_clk_dt;
> > +static struct clk *esdhc1_clk_dt;
> > +static struct clk *esdhc2_clk_dt;
> > +#endif
> 
> Heh, yeah this seems sub-optimal.  It would be better to share common
> clock initialization between dt and non-dt boards, even if it means
> that a lot of the clocks are node described in the device tree (at
> least for the on-chip SoC clocks; board-accessible clocks still need
> to appear in the device tree though.
> 
I do not understand the above comment.  These are not statically
defining 'struct clk' but the pointers to them.  They are used to
solve the references to static 'clk' in existing code, since all clk
are created dynamically in dt code.

-- 
Regards,
Shawn
