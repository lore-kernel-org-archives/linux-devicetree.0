From: Tang Yuantian-B29983 <B29983@freescale.com>
Subject: RE: [v3] powerpc/mpc85xx: Update the clock device tree nodes
Date: Tue, 27 Aug 2013 02:49:43 +0000
Message-ID: <D07C73A334FF604B95B3CBD2A545D07B1503F161@039-SN2MPN1-012.039d.mgd.msft.net>
References: <1370480811-13700-1-git-send-email-Yuantian.Tang@freescale.com>
 <20130823200827.GA29737@home.buserror.net>
 <D07C73A334FF604B95B3CBD2A545D07B1503BE58@039-SN2MPN1-012.039d.mgd.msft.net>
 <1377536416.3033.18.camel@snotra.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1377536416.3033.18.camel@snotra.buserror.net>
Content-Language: en-US
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
To: Wood Scott-B07421 <B07421@freescale.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mike Turquette <mturquette@linaro.org>
List-Id: devicetree@vger.kernel.org

> > > > +		};
> > > > +		pll1: pll1@820 {
> > > > +			#clock-cells = <1>;
> > > > +			reg = <0x820>;
> > > > +			compatible = "fsl,core-pll-clock";
> > > > +			clocks = <&clockgen>;
> > > > +			clock-output-names = "pll1", "pll1-div2", "pll1-
> div4";
> > > > +		};
> > >
> > > Please leave a blank line between properties and nodes, and between
> nodes.
> > >
> > OK, will add.
> >
> > > What does reg represent?  Where is the binding for this?
> > >
> > > The compatible is too vague.
> > Reg is register offset.
> 
> With no size?

No size is needed.

> 
> > I should have had a binding document.
> > About the compatible, you should pointed it out earlier in SDK review.
> 
> Sorry, it doesn't work that way.  I don't know why I didn't notice this
> stuff there -- the SDK review was probably rushed, with someone shouting
> "urgent".  The SDK does not dictate what goes upstream.  Device tree
> bindings should go upstream first.
> 
When I sent the patch v1, there is a binding document with it. But I missed
It in the patch v3, so when patch v3 got merged, the binding document didn't get merged.
I will make the binding go upstream first next time.

> > It is too later to change since the clock driver is merged for months
> > although I sent this patch first.
> 
> It should not have gone in without an approved binding.  It seems it went
> in via Mike Turquette (why is a non-ARM-specific tree using linux-arm-
> kernel as its list, BTW?).  No ack from Ben, Kumar, or me is shown in the
> commit.
The Linux common clock framework is not ARM specific. Any other arch can use it.
In fact, this clock driver is the first one that use common clk on PPC arch.
I will get the ack from you guys next time. I hope it doesn't make me wait too long.
 
> 
> In any case, you can preserve compatibility with existing trees without
> using this compatible in new trees.  The driver can check for both
> compatibles, with a comment indicating that "fsl,core-mux-clock" is
> deprecated and for compatibility only.
It is sub-clock node, is it really necessary to think about compatibility?
I think that's the node clockgen's responsibility.

> 
> > Besides, it is not too bad because other arch use the similar name.
> 
> I don't follow.  This is a specific Freescale register interface, not a
> general concept.
> 
> In any case, which "similar names" are you referring to?  A search in
> arch/arm/boot/dts for "mux" with "clk" or "clock" turns up
> "allwinner,sun4i-apb1-mux-clk" which is much more specific than
> "fsl,core-mux-clock".
Ok, I will change the compatible string.
Do you think "fsl,ppc-core-*" is ok?

Regards,
Yuantian
> 
> -Scott
> 
