From: Scott Wood <scottwood@freescale.com>
Subject: Re: [v3] powerpc/mpc85xx: Update the clock device tree nodes
Date: Tue, 10 Sep 2013 16:46:46 -0500
Message-ID: <1378849606.12204.359.camel@snotra.buserror.net>
References: <1370480811-13700-1-git-send-email-Yuantian.Tang@freescale.com>
 <20130823200827.GA29737@home.buserror.net>
 <D07C73A334FF604B95B3CBD2A545D07B1503BE58@039-SN2MPN1-012.039d.mgd.msft.net>
 <1377536416.3033.18.camel@snotra.buserror.net>
 <D07C73A334FF604B95B3CBD2A545D07B1503F161@039-SN2MPN1-012.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <D07C73A334FF604B95B3CBD2A545D07B1503F161@039-SN2MPN1-012.039d.mgd.msft.net>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Tang Yuantian-B29983 <B29983@freescale.com>
Cc: Wood Scott-B07421 <B07421@freescale.com>, Mike Turquette <mturquette@linaro.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2013-08-26 at 21:49 -0500, Tang Yuantian-B29983 wrote:
> > > > > +		};
> > > > > +		pll1: pll1@820 {
> > > > > +			#clock-cells = <1>;
> > > > > +			reg = <0x820>;
> > > > > +			compatible = "fsl,core-pll-clock";
> > > > > +			clocks = <&clockgen>;
> > > > > +			clock-output-names = "pll1", "pll1-div2", "pll1-
> > div4";
> > > > > +		};
> > > >
> > > > Please leave a blank line between properties and nodes, and between
> > nodes.
> > > >
> > > OK, will add.
> > >
> > > > What does reg represent?  Where is the binding for this?
> > > >
> > > > The compatible is too vague.
> > > Reg is register offset.
> > 
> > With no size?
> 
> No size is needed.

Yes, it is.  Register blocks have size -- even if it's just a single
register.

> > > It is too later to change since the clock driver is merged for months
> > > although I sent this patch first.
> > 
> > It should not have gone in without an approved binding.  It seems it went
> > in via Mike Turquette (why is a non-ARM-specific tree using linux-arm-
> > kernel as its list, BTW?).  No ack from Ben, Kumar, or me is shown in the
> > commit.
> The Linux common clock framework is not ARM specific. Any other arch can use it.

Sure, it just seemed an odd choice of mailing list for something that
isn't ARM-specific.

> > In any case, you can preserve compatibility with existing trees without
> > using this compatible in new trees.  The driver can check for both
> > compatibles, with a comment indicating that "fsl,core-mux-clock" is
> > deprecated and for compatibility only.
> It is sub-clock node, is it really necessary to think about compatibility?
> I think that's the node clockgen's responsibility.

It describes registers, so yes, you need to consider compatibility.  A
clock provider is not responsible for figuring out how to program
devices that consume its clocks, nor should it make any assumptions
about such devices.
 
> > > Besides, it is not too bad because other arch use the similar name.
> > 
> > I don't follow.  This is a specific Freescale register interface, not a
> > general concept.
> > 
> > In any case, which "similar names" are you referring to?  A search in
> > arch/arm/boot/dts for "mux" with "clk" or "clock" turns up
> > "allwinner,sun4i-apb1-mux-clk" which is much more specific than
> > "fsl,core-mux-clock".
> Ok, I will change the compatible string.
> Do you think "fsl,ppc-core-*" is ok?

No.  How about "fsl,qoriq-chassis1-*" (for e500mc/e5500) and
fsl,qoriq-chassis2-*" (for e6500)?

-Scott
