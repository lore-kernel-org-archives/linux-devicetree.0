From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: DTS language enhancements
Date: Thu, 9 Oct 2008 10:08:50 -0500
Message-ID: <20081009150850.GA30900@ld0162-tx32.am.freescale.net>
References: <20081003043710.GH3002@yookeroo.seuss>
	<20081006170601.GA31967@ld0162-tx32.am.freescale.net>
	<20081007014103.GA23135@yookeroo.seuss>
	<20081007165038.GA17126@ld0162-tx32.am.freescale.net>
	<20081009022722.GC7997@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081009022722.GC7997-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
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

On Thu, Oct 09, 2008 at 01:27:22PM +1100, David Gibson wrote:
> On Tue, Oct 07, 2008 at 11:50:38AM -0500, Scott Wood wrote:
> > On Tue, Oct 07, 2008 at 12:41:03PM +1100, David Gibson wrote:
> > > > Instead of /addnode/, how about an alternate version of (or option to)
> > > > /merge/ that merges the second tree with the contents of the first,
> > > 
> > > Um.. I don't entirely see how this variant of /merge/ would differ
> > > from /addnode/.
> > 
> > /addnode/ can only add one node at a time, and has an different syntax
> > than normal for representing the node to be added (name is split from
> > body).  /mergeunder/ could add any number of nodes and/or properties,
> > and would use more normal syntax.
> 
> Um.. in that case I don't see how this differs from the original
> /merge/.

I guess the issue is that /merge/ is incompletely specified.  The example
showed it taking anonymous trees as parameters; are the parameters always
wrapped as such, or can named nodes be passed directly?  In the latter
case, /mergeunder/ was intended as a way of dereferencing the former
argument so as to place things inside it rather than create a new
anonymous node containing both, without needing to know the
name/unit-address of the named node.

An alternative would be a function to extract the name of non-anonymous
nodes, which could be used to build a matching subnode in the second
/merge/ argument.

> > We probably should have added comma-delimiting when we switched to
> > decimal-by-default.
> 
> Maybe, but its done now.  I really don't think requiring parens aroud
> expressions is that big an imposition.

Agreed; I may find it as ugly as you find identifier prefixes, but we
don't have much of a choice if we want to retain compatibility.

-Scott
