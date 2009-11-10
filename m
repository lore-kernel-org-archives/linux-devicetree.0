From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: PCI bus node location
Date: Wed, 11 Nov 2009 10:44:12 +1100
Message-ID: <20091110234412.GA3235@yookeroo.seuss>
References: <B7D31A24-3361-4B80-81C4-5A815F09D42F@semihalf.com>
	<fa686aa40911091836s2a6b763aq14ece296cd7368db@mail.gmail.com>
	<20091110031218.GG26042@yookeroo.seuss>
	<839C8AA0-A8B5-434E-9175-16D2B84D74BD@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <839C8AA0-A8B5-434E-9175-16D2B84D74BD-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rafal Jaworowski <raj-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 10, 2009 at 05:55:33PM +0100, Rafal Jaworowski wrote:
> On 2009-11-10, at 04:12, David Gibson wrote:
> >On Mon, Nov 09, 2009 at 07:36:57PM -0700, Grant Likely wrote:
> >>On Mon, Nov 9, 2009 at 12:20 PM, Rafal Jaworowski
[snip]
> >Right.
> >
> >Under the new scheme, the "soc" node is really a historical misnomer -
> >it represents just the things within the IMMR, not everything on the
> >SoC.  A number of chips also have the localbus controller as a
> >separate node, likewise within the SoC but not within the IMMR, so not
> >a child of the soc node.
> 
> Hm, how do we know whether something belongs under the IMMR/CCSR
> node or not (even though it physically sits there :-)?

Well, the basic criterion is whether its registers are relocated with
the rest of the IMMR.  Which would cover the PCI control registers, of
course, but they're not there for the reasons given.  Yes, it's kind
of nasty.

> Is the 'soc' node going to be named something less confusing then?

I think it should, but it's difficult to change because u-boot has
dependencies on it.  I think there are a few newer trees where it's
named IMMR.

> >Note also that 4xx chips, unlike the Freescale ones do have the PCI
> >host bridge under the plb node (which represents the main bus on the
> >SoC).
> 
> Yea, I noticed, which made me even more confused, so thanks again
> for clarifications.
> 
> Rafal
> 

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
