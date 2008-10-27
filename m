From: "Yoder Stuart" <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: generating a phandle w/libfdt?
Date: Mon, 27 Oct 2008 08:14:48 -0700
Message-ID: <9696D7A991D0824DBA8DFAC74A9C5FA3047E53A0@az33exm25.fsl.freescale.net>
References: <4BE3ADDA-362B-43AE-8D05-11260B94CD13@kernel.crashing.org>
	<DEE70934-6A37-4439-B27E-FC3ABF75BF24@kernel.crashing.org>
	<9696D7A991D0824DBA8DFAC74A9C5FA3047947A3@az33exm25.fsl.freescale.net>
	<20081026234052.GB22339@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-class: urn:content-classes:message
In-Reply-To: <20081026234052.GB22339-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

 

> -----Original Message-----
> From: David Gibson [mailto:david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org] 
> Sent: Sunday, October 26, 2008 6:41 PM
> To: Yoder Stuart-B08248
> Cc: Kumar Gala; devicetree-discuss
> Subject: Re: generating a phandle w/libfdt?
> 
> On Fri, Oct 24, 2008 at 09:29:21AM -0700, Yoder Stuart wrote:
> >  
> > 
> > > -----Original Message-----
> > > From: 
> > > devicetree-discuss-bounces+stuart.yoder=freescale.com@ozlabs.o
> > > rg 
> > > [mailto:devicetree-discuss-bounces+stuart.yoder=freescale.com@
> > ozlabs.org] On Behalf Of Kumar Gala
> > > Sent: Friday, October 24, 2008 9:19 AM
> > > To: devicetree-discuss
> > > Subject: Re: generating a phandle w/libfdt?
> > > 
> > > 
> > > On Oct 24, 2008, at 8:11 AM, Kumar Gala wrote:
> > > 
> > > > In some work I'm doing I noticed we don't have any APIs to 
> > > generate  
> > > > a phandle via libfdt.
> > > >
> > > > was wondering if anyone had ideas on this.
> > > >
> > > > In first thought it seems we have to scan through the 
> whole blob  
> > > > looking for the largest phandle id and than +1 it to 
> generate the  
> > > > next "valid" id.  Any other ideas on how to do this more 
> > > efficiently?
> > > 
> > > The other question is there a way today to create a 
> phandle even if  
> > > there isn't a reference to it elsewhere in a .dts?
> > 
> > We had this issue and the 'hack' was to create a phandle property
> > in the node itself, so it was self-referenced.  That caused DTC
> > to allocate a phandle.   We then could reference the node from
> > dynamically generated nodes.
> 
> That's nasty.  I should add a way to make dtc generate a phandle for a
> node, even if it's not referenced from elsewhere.  Just need to think
> of a decent syntax.

We could add a flag to DTC to generate phandles for all 
nodes.

Only downside I can see is an additional 4 bytes per node.

Stuart
