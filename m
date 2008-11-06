From: "Yoder Stuart" <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: generating a phandle w/libfdt?
Date: Thu, 6 Nov 2008 08:16:23 -0700
Message-ID: <9696D7A991D0824DBA8DFAC74A9C5FA304840D5C@az33exm25.fsl.freescale.net>
References: <4BE3ADDA-362B-43AE-8D05-11260B94CD13@kernel.crashing.org>
	<DEE70934-6A37-4439-B27E-FC3ABF75BF24@kernel.crashing.org>
	<9696D7A991D0824DBA8DFAC74A9C5FA3047947A3@az33exm25.fsl.freescale.net>
	<20081026234052.GB22339@yookeroo.seuss>
	<76BF0CED-6848-43B9-8035-FC9C1F1DD981@kernel.crashing.org>
	<20081028000449.GB26424@yookeroo.seuss>
	<33A5285E-F5BE-4109-9C29-59F23E6264A0@kernel.crashing.org>
	<20081106021040.GJ28465@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-class: urn:content-classes:message
In-Reply-To: <20081106021040.GJ28465-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

 

> -----Original Message-----
> From: David Gibson [mailto:david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org] 
> Sent: Wednesday, November 05, 2008 8:11 PM
> To: Kumar Gala
> Cc: Yoder Stuart-B08248; devicetree-discuss
> Subject: Re: generating a phandle w/libfdt?
> 
> On Tue, Oct 28, 2008 at 10:47:39PM -0500, Kumar Gala wrote:
> > On Oct 27, 2008, at 7:04 PM, David Gibson wrote:
> >> On Mon, Oct 27, 2008 at 09:15:38AM -0500, Kumar Gala wrote:
> >>> On Oct 26, 2008, at 6:40 PM, David Gibson wrote:
> >>>> On Fri, Oct 24, 2008 at 09:29:21AM -0700, Yoder Stuart wrote:
> [snip]
> >>> What if we just have it do that if we have a 
> "linux,phandle" property
> >>> w/o a value in the .dts?
> >>
> >> Hrm.  Normally that would create a property named 
> "linux,phandle" with
> >> a zero-length value.  I'm disinclined to special case this.
> >
> > Why?  linux,phandle is already special.  What does it mean if a  
> > linux,phandle has no value?
> 
> Well, making existing notation mean something different for this
> property seems to me a different order of special casing than
> auto-creating the property if it's not present to start with.
> 
> You know, I am inclined to make:
> 	linux,phandle = < &thisnode >;
> the approved way of doing this.  I *think* that will already work, but
> if not we can fix it.  The circular reference is slightly odd, but it
> is self-consistent.  I suppose we could still come up with a further
> shorthand so it's not necessary to make a label for a node to do this
> ('&.' or something for 'reference-to-containing-node').

As I mentioned earlier in this thread, this _does_ work and is
what we did in the DTS to get phandles generated for nodes that were
going to be referenced by nodes dynamically created later.

Stuart
