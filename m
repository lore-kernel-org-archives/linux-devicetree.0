From: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [Power.org:parch] ePAPR 1.1 to do list
Date: Tue, 11 Jan 2011 22:14:53 +0000
Message-ID: <9F6FE96B71CF29479FF1CDC8046E150301D94E@039-SN1MPN1-004.039d.mgd.msft.net>
References: <9696D7A991D0824DBA8DFAC74A9C5FA306688C2F@az33exm25.fsl.freescale.net>
	<20100913131752.54981fb1@schlenkerla.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100913131752.54981fb1-1MYqz8GpK7RekFaExTCHk1jVikpgYyvb5NbjCUgZEJk@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org" <parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Wood Scott-B07421
> Sent: Monday, September 13, 2010 1:18 PM
> To: Yoder Stuart-B08248
> Cc: parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org; devicetree-discuss
> Subject: Re: [Power.org:parch] ePAPR 1.1 to do list
> 
> On Mon, 30 Aug 2010 14:34:44 -0700
> Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
> > I've consolidated what I am aware of with respect to errors found in
> > 1.0, clarifications needed, and new mechanisms to go into ePAPR 1.1
> > into a single list.
> >
> > Let me know if you are aware of anything else.
> >
> > ePAPR 1.1 To Do
> > ---------------
> >
> > 1. Fix typos, misc cleanup
> >
> >    -device_type="simple-bus" in 8572 soc node example (p.96)
> >    -p.51, line 27-- ET_EXEC is 0x2 not 0x1
> >    -p.41, broken cross reference
> >    -missing period on virtual reg on ns16550
> 
> 2.3.11 says device_type should only be present for cpu and memory nodes,
> but the example trees in the appendices contain device_type = "serial",
> "network", "pci", and "open-pic" (as well as the simple-bus error mentioned
> above).

Note-- the upstream device tree still has those device_type properties.
Should we still remove them from the example?

Stuart
