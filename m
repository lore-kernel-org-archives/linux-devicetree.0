From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: Board level compatibility matching
Date: Thu, 31 Jul 2008 14:52:51 -0600
Message-ID: <20080731205251.GB29834@secretlab.ca>
References: <fa686aa40807311319k44d270b0t4fa9cb0e6523339@mail.gmail.com>
	<9e4733910807311349l5770a17ib2ab2535bcd2868a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
Content-Disposition: inline
In-Reply-To: <9e4733910807311349l5770a17ib2ab2535bcd2868a@mail.gmail.com>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Jon Smirl <jonsmirl@gmail.com>
Cc: devicetree-discuss@ozlabs.org, linuxppc-dev <linuxppc-dev@ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 31, 2008 at 04:49:49PM -0400, Jon Smirl wrote:
> On 7/31/08, Grant Likely <grant.likely@secretlab.ca> wrote:
> > This topic keeps coming up, so it is probably time to address it once
> >  and for all.
> >
> >  When it comes to machine level support in arch/powerpc, there seems to
> >  me that there are two levels or machine support.
> >
> ......
> >
> >  Thoughts?
> >  g.
> 
> 
> As part of this, how can we going to solve the problem with triggering
> the load of a board specific machine/fabric driver in a generic way?

That really is a separate problem.  We *could* do this with a board
specific powerpc machine driver, but I don't think it is the best
solution.

I'm still thinking that the drivers module_init() function could check
the top level board model property and decide whether or not to load
based on that.

g.
