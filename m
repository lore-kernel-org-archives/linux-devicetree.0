From: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: dec behavior question
Date: Tue, 25 Oct 2011 12:18:33 +0000
Message-ID: <9F6FE96B71CF29479FF1CDC8046E1503253081@039-SN1MPN1-004.039d.mgd.msft.net>
References: <9942C069-D8EC-4133-B436-1DC5F62C502E@kernel.crashing.org>
 <20111024231529.GE4191@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111024231529.GE4191-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: devicetree-discuss-bounces+stuart.yoder=freescale.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> [mailto:devicetree-discuss-bounces+stuart.yoder=freescale.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On Behalf Of
> David Gibson
> Sent: Monday, October 24, 2011 6:15 PM
> To: Kumar Gala
> Cc: devicetree-discuss
> Subject: Re: dec behavior question
> 
> On Mon, Oct 24, 2011 at 09:01:49AM -0500, Kumar Gala wrote:
> > If I have something like:
> >
> > ---------------------------------------
> > spi.dtsi:
> >
> > &spi0 {
> >         #address-cells = <1>;
> >         #size-cells = <0>;
> >         compatible = "fsl,mpc8536-espi";
> >         reg = <0x7000 0x1000>;
> >         interrupts = <59 0x2 0 0>;
> > };
> > ---------------------------------------
> >
> > foo.dts:
> >
> > spi0: spi@f00bar {
> > 	compatible = "FOOBAR";
> > };
> >
> > /include/ "spi.dtsi"
> >
> > ---------------------------------------
> >
> > What do you expect the resulting dtb to look like w/regards to the
> > compatible node?
> 
> It's always last tree wins.  So it will end up with compatible = "FOOBAR".

If last wins, then it would be the included file
(compatible = "fsl,mpc8536-espi"), no?

Stuart
