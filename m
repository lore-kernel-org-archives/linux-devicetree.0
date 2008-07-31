From: "Jon Smirl" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Board level compatibility matching
Date: Thu, 31 Jul 2008 16:58:34 -0400
Message-ID: <9e4733910807311358k54b5c088l1023d354fd0ad28e@mail.gmail.com>
References: <fa686aa40807311319k44d270b0t4fa9cb0e6523339@mail.gmail.com>
	<9e4733910807311349l5770a17ib2ab2535bcd2868a@mail.gmail.com>
	<20080731205251.GB29834@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20080731205251.GB29834-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 7/31/08, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Thu, Jul 31, 2008 at 04:49:49PM -0400, Jon Smirl wrote:
>  > On 7/31/08, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>  > > This topic keeps coming up, so it is probably time to address it once
>  > >  and for all.
>  > >
>  > >  When it comes to machine level support in arch/powerpc, there seems to
>  > >  me that there are two levels or machine support.
>  > >
>  > ......
>  > >
>  > >  Thoughts?
>  > >  g.
>  >
>  >
>  > As part of this, how can we going to solve the problem with triggering
>  > the load of a board specific machine/fabric driver in a generic way?
>
>
> That really is a separate problem.  We *could* do this with a board
>  specific powerpc machine driver, but I don't think it is the best
>  solution.
>
>  I'm still thinking that the drivers module_init() function could check
>  the top level board model property and decide whether or not to load
>  based on that.

You're assuming the driver is compiled in.

If the drivers are on initrd selection has to happen via the normal
device/driver matching process. Search for a device in the alias table
of the drive file.

-- 
Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
