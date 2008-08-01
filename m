From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Board level compatibility matching
Date: Fri, 1 Aug 2008 12:47:29 +1000
Message-ID: <20080801024729.GA5008@yookeroo.seuss>
References: <fa686aa40807311319k44d270b0t4fa9cb0e6523339@mail.gmail.com>
	<9e4733910807311349l5770a17ib2ab2535bcd2868a@mail.gmail.com>
	<20080731205251.GB29834@secretlab.ca>
	<9e4733910807311358k54b5c088l1023d354fd0ad28e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9e4733910807311358k54b5c088l1023d354fd0ad28e-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Smirl <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 31, 2008 at 04:58:34PM -0400, Jon Smirl wrote:
> On 7/31/08, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> > On Thu, Jul 31, 2008 at 04:49:49PM -0400, Jon Smirl wrote:
> >  > On 7/31/08, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> >  > > This topic keeps coming up, so it is probably time to address it once
> >  > >  and for all.
> >  > >
> >  > >  When it comes to machine level support in arch/powerpc, there seems to
> >  > >  me that there are two levels or machine support.
> >  > >
> >  > ......
> >  > >
> >  > >  Thoughts?
> >  > >  g.
> >  >
> >  >
> >  > As part of this, how can we going to solve the problem with triggering
> >  > the load of a board specific machine/fabric driver in a generic way?
> >
> >
> > That really is a separate problem.  We *could* do this with a board
> >  specific powerpc machine driver, but I don't think it is the best
> >  solution.
> >
> >  I'm still thinking that the drivers module_init() function could check
> >  the top level board model property and decide whether or not to load
> >  based on that.
> 
> You're assuming the driver is compiled in.
> 
> If the drivers are on initrd selection has to happen via the normal
> device/driver matching process. Search for a device in the alias table
> of the drive file.

This can still be done via the board platform code.  The platform code
creates a platform device which the driver can later bind to.


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
