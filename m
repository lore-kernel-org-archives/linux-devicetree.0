From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH V5 2/4] arm/dt: add very basic dts file for babbage board
Date: Fri, 18 Mar 2011 10:02:24 -0600
Message-ID: <20110318160224.GC22790@angua.secretlab.ca>
References: <1300290701-9433-1-git-send-email-jason.hui@linaro.org>
	<1300290701-9433-3-git-send-email-jason.hui@linaro.org>
	<20110317164238.GC9597@angua.secretlab.ca>
	<20110318014917.GB26951@S2100-06.ap.freescale.net>
	<20110318054333.GH18545@angua.secretlab.ca>
	<20110318075431.GD26951@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110318075431.GD26951-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 18, 2011 at 03:54:32PM +0800, Shawn Guo wrote:
> On Thu, Mar 17, 2011 at 11:43:34PM -0600, Grant Likely wrote:
> > On Fri, Mar 18, 2011 at 09:49:17AM +0800, Shawn Guo wrote:
> > > On Thu, Mar 17, 2011 at 10:42:38AM -0600, Grant Likely wrote:
> > > > On Wed, Mar 16, 2011 at 11:51:39PM +0800, Jason Liu wrote:
> > > [...]
> > > > > +	aips@83f00000 {
> > > > > +		#address-cells = <1>;
> > > > > +		#size-cells = <1>;
> > > > > +		compatible = "simple-bus";
> > > > > +		ranges = <0x0 0x83f00000 0x100000>;
> > > > > +
> > > > > +		fec@ec000 {
> > > > > +			compatible = "fsl,imx51-fec";
> > > > > +			reg = <0xec000 0x1000>;
> > > > > +			interrupts = <0x57>;
> > > > > +			fec_clk-clock = <&fec_clk>, "fec";
> > > > 
> > > > Unfortunately we're leaking Linux implementation details here by
> > > > needing to use the name "fec_clk".  This will require some more
> > > > thought on the best way to handle (but I'm not asking you to change
> > > > anything yet).
> > > > 
> > > This constraint comes from function of_clk_get in drivers/of/clock.c:
> > > 
> > > struct clk *of_clk_get(struct device *dev, const char *id)
> > > {
> > > 	[...]
> > >         dev_dbg(dev, "Looking up %s-clock from device tree\n", id);
> > > 
> > >         snprintf(prop_name, 32, "%s-clock", id ? id : "bus");
> > >         prop = of_get_property(dev->of_node, prop_name, &sz);
> > > 	[...]
> > > }
> > > 
> > > The 'id' here is clk_lookup->con_id.  If we choose to use some fixed
> > > prop name here, the name leaking Linux implementation like 'fec_clk'
> > > will not need to be there.
> > > 
> > > What about fixing the name as 'bus-clock' used by the current
> > > implementation, or 'module-clock', or anything you can think of
> > > better?
> > 
> > Yeah, I though about that, but I'm being very careful about hard
> > coding anything in the core DT code because every platform seems to
> > want something different here, or want a different set of clocks.  I
> > don't have a good solution for this yet.
> > 
> We are not hard coding anything but a property name here.  We are hard
> coding property name everywhere in dt code, aren't we?

In this case, each platform seems to have a different naming
conventions for the set of clocks, and a different number of clocks.
I'm not willing to hard code the translations until I've got a better
understanding of the different needs between platforms.

What I might do is allow platform code to supply the core code with a
clock name translation table which might solve the problem nicely.

g.
