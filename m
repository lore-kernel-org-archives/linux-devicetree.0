From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] [v3] power/fsl: add MDIO dt binding for FMan
Date: Wed, 7 Jan 2015 19:12:38 -0600
Message-ID: <1420679558.4961.64.camel@freescale.com>
References: <1419321466-5575-1-git-send-email-shh.xie@gmail.com>
	 <DM2PR0301MB08640979E5088618D1395CFAE2580@DM2PR0301MB0864.namprd03.prod.outlook.com>
	 <1420590520.4961.38.camel@freescale.com>
	 <DM2PR0301MB08645ABD93708FFE011EF362E2460@DM2PR0301MB0864.namprd03.prod.outlook.com>
	 <1420653934.4961.58.camel@freescale.com> <54AD8C8A.8070100@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54AD8C8A.8070100-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: Xie Shaohui-B21989 <Shaohui.Xie-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-01-07 at 13:44 -0600, Emil Medve wrote:
> Hello Scott,
> 
> 
> On 01/07/2015 12:05 PM, Scott Wood wrote:
> > On Tue, 2015-01-06 at 23:29 -0600, Xie Shaohui-B21989 wrote:
> >>>>> +- interrupts
> >>>>> +		Usage: optional
> >>>>> +		Value type: <prop-encoded-array>
> >>>>> +		Definition: Event interrupt of external MDIO controller.
> >>>>> +		1 Gb/s MDIO and 10 Gb/s MDIO has one interrupt respectively.
> >>>
> >>> I'm confused by "respectively" here.  Does fsl,fman-memac-mdio have two
> >>> interrupts (one for 1 Gb/s and one for 10 Gb/s)?
> >> [S.H] We use two MDIO controllers for external PHY management. One for 1 Gb/s,
> >> One for 10 Gb/s, and two MDIO interrupts connected to MPIC.
> > 
> > If there can be two interrupts you need to make that clear and specify
> > the order.
> > 
> > Is it possible for one MDIO controller to have an interrupt connected
> > but not the other, on the same system?  How would you represent that in
> > the device tree?  If there are two MDIO controllers why are they in the
> > same node?
> 
> Historically (FMan v2 and even before/legacy) we've had each MAC include
> an MDIO controller, but only one MDIO controller per MAC type/speed (1
> Gb/s vs 10 Gb/s) is pinned out and all the same speed PHY(s) are
> connected to the respective MDIO controllers. As such the first 1 Gb/s
> MAC/MDIO controller is used to manage all the 1 Gb/s PHY(s) and the
> first 10 Gb/s MAC/MDIO controller is used to manage all the 10 Gb/s
> PHY(s). Each MDIO controller has the ability to generate interrupts but
> only pinned out MDIO controllers are hooked up to the MPIC (as such the
> talk about two interrupts)
> 
> (Each MAC has also integrated a SERDES/TBI/"internal" PHY that is
> connected to the "local" MDIO controller)
> 
> As you can imagine this creates a number of problems in a partitioning
> scenario (and not just, imagine RCWs where the first MAC is not
> used/enabled). In order to help a bit (but not quite enough), in FMan
> v3, two additional MDIO controllers (one for 1 the Gb/s PHY(s) and one
> for 1 the 10 Gb/s PHY(s)) have been integrated that are not associated
> with any MAC and these are the pinned out MDIO controllers on such
> SoC(s) (chassis v2)

I'm happy to hear that.  Is that what is meant by "external" here?  I
thought it meant external to the SoC.  Is this the term used by hardware
documentation?  I'd have called it "independent" or similar.

> >>   Does "optional" mean it's used if and
> >>> only if external MDIO is used, or is it optional even with external MDIO?  I see
> >>> it's not present in the example -- do we not have a real example that has the
> >>> interrupt?
> >> [S.H] "optional" means it's available on hardware, but MDIO driver does not use interrupt. 
> >> So we don't have a real example.
> > 
> > <record type="broken">The device tree describes the hardware, not the
> > driver</record>
> 
> Anyway, only two MDIO nodes (out of 4 to 14) would have an interrupt
> property describing exactly one interrupt. What language should we use
> to convey this situation

So the answer is that there will not be more than one MDIO controller
per MDIO node, or more than one interrupt per MDIO node?  In that case
just get rid of the confusing "respectively" sentence -- and always
describe the interrupt if it exists in hardware.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
