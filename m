From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dec behavior question
Date: Wed, 26 Oct 2011 15:00:09 +1100
Message-ID: <20111026040009.GA4759@truffala.fritz.box>
References: <9942C069-D8EC-4133-B436-1DC5F62C502E@kernel.crashing.org>
 <20111024231529.GE4191@truffala.fritz.box>
 <9F6FE96B71CF29479FF1CDC8046E1503253081@039-SN1MPN1-004.039d.mgd.msft.net>
 <0F565319-C054-4B46-8548-7BF4227BD237@kernel.crashing.org>
 <20111025233643.GA5760@truffala.fritz.box>
 <DC6E364B-6427-4D7D-9605-BB5BCF890053@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <DC6E364B-6427-4D7D-9605-BB5BCF890053-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 25, 2011 at 10:10:03PM -0500, Kumar Gala wrote:
> 
> On Oct 25, 2011, at 6:36 PM, David Gibson wrote:
> 
> > On Tue, Oct 25, 2011 at 08:41:55AM -0500, Kumar Gala wrote:
> >> 
> >> On Oct 25, 2011, at 7:18 AM, Yoder Stuart-B08248 wrote:
> >> 
> >>> 
> >>> 
> >>>> -----Original Message-----
> >>>> From: devicetree-discuss-bounces+stuart.yoder=freescale.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> >>>> [mailto:devicetree-discuss-bounces+stuart.yoder=freescale.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On Behalf Of
> >>>> David Gibson
> >>>> Sent: Monday, October 24, 2011 6:15 PM
> >>>> To: Kumar Gala
> >>>> Cc: devicetree-discuss
> >>>> Subject: Re: dec behavior question
> >>>> 
> >>>> On Mon, Oct 24, 2011 at 09:01:49AM -0500, Kumar Gala wrote:
> >>>>> If I have something like:
> >>>>> 
> >>>>> ---------------------------------------
> >>>>> spi.dtsi:
> >>>>> 
> >>>>> &spi0 {
> >>>>>       #address-cells = <1>;
> >>>>>       #size-cells = <0>;
> >>>>>       compatible = "fsl,mpc8536-espi";
> >>>>>       reg = <0x7000 0x1000>;
> >>>>>       interrupts = <59 0x2 0 0>;
> >>>>> };
> >>>>> ---------------------------------------
> >>>>> 
> >>>>> foo.dts:
> >>>>> 
> >>>>> spi0: spi@f00bar {
> >>>>> 	compatible = "FOOBAR";
> >>>>> };
> >>>>> 
> >>>>> /include/ "spi.dtsi"
> >>>>> 
> >>>>> ---------------------------------------
> >>>>> 
> >>>>> What do you expect the resulting dtb to look like w/regards to the
> >>>>> compatible node?
> >>>> 
> >>>> It's always last tree wins.  So it will end up with compatible = "FOOBAR".
> >>> 
> >>> If last wins, then it would be the included file
> >>> (compatible = "fsl,mpc8536-espi"), no?
> > 
> > Uh, yes, sorry.  I misread and assumed the /include/ came first.
> > 
> >> I don't believe so because the include of spi.dtsi doesn't actually
> >> instantiate a node.  This is a little different than use of
> >> 'include' for merging of nodes.
> > 
> > No, it really isn't.  /include/ is just a textual include.  If a node
> > is defined multiple times, properties in the last definition always
> > win.
> 
> So than is there a way to do this?

No way to do what?  I don't see what it is you want that isn't what
you're getting.

> It seems that node references have to come after their use.  Not
> exactly sure why that would be the case.
> 
> ---- the following is invalid ----
> 
> /dts-v1/;
> 
> &spi0 {
>        compatible = "fsl,mpc8536-espi";
> };
> 
> /{
>         spi0: spi@0 {
>               compatible = "kumar";
>         };
> };

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
