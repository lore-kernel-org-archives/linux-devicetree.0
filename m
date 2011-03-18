From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH V5 2/4] arm/dt: add very basic dts file for babbage board
Date: Thu, 17 Mar 2011 23:43:34 -0600
Message-ID: <20110318054333.GH18545@angua.secretlab.ca>
References: <1300290701-9433-1-git-send-email-jason.hui@linaro.org>
	<1300290701-9433-3-git-send-email-jason.hui@linaro.org>
	<20110317164238.GC9597@angua.secretlab.ca>
	<20110318014917.GB26951@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110318014917.GB26951-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 18, 2011 at 09:49:17AM +0800, Shawn Guo wrote:
> On Thu, Mar 17, 2011 at 10:42:38AM -0600, Grant Likely wrote:
> > On Wed, Mar 16, 2011 at 11:51:39PM +0800, Jason Liu wrote:
> [...]
> > > +	aips@83f00000 {
> > > +		#address-cells = <1>;
> > > +		#size-cells = <1>;
> > > +		compatible = "simple-bus";
> > > +		ranges = <0x0 0x83f00000 0x100000>;
> > > +
> > > +		fec@ec000 {
> > > +			compatible = "fsl,imx51-fec";
> > > +			reg = <0xec000 0x1000>;
> > > +			interrupts = <0x57>;
> > > +			fec_clk-clock = <&fec_clk>, "fec";
> > 
> > Unfortunately we're leaking Linux implementation details here by
> > needing to use the name "fec_clk".  This will require some more
> > thought on the best way to handle (but I'm not asking you to change
> > anything yet).
> > 
> This constraint comes from function of_clk_get in drivers/of/clock.c:
> 
> struct clk *of_clk_get(struct device *dev, const char *id)
> {
> 	[...]
>         dev_dbg(dev, "Looking up %s-clock from device tree\n", id);
> 
>         snprintf(prop_name, 32, "%s-clock", id ? id : "bus");
>         prop = of_get_property(dev->of_node, prop_name, &sz);
> 	[...]
> }
> 
> The 'id' here is clk_lookup->con_id.  If we choose to use some fixed
> prop name here, the name leaking Linux implementation like 'fec_clk'
> will not need to be there.
> 
> What about fixing the name as 'bus-clock' used by the current
> implementation, or 'module-clock', or anything you can think of
> better?

Yeah, I though about that, but I'm being very careful about hard
coding anything in the core DT code because every platform seems to
want something different here, or want a different set of clocks.  I
don't have a good solution for this yet.

g.
