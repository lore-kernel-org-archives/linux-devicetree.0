From: Paul Brook <paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Fri, 13 Feb 2009 14:25:52 +0000
Message-ID: <200902131425.53137.paul@codesourcery.com>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<200902131333.47141.paul@codesourcery.com>
	<871vu2pgq7.fsf@pike.pond.sub.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <871vu2pgq7.fsf-A7mx1g9ivIOttUaS3K59qNi2O/JbrIOy@public.gmane.org>
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
To: Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Look, my goals are rather modest.  I want to start where we are, put
> devices behind a nice abstract interface one by one, picking apart the
> pc.c hairball on the way.  The idea is not to design the perfect,
> all-encompassing abstract device interface, just to capture what we
> need, and extend as we go.  The abstract device interface makes a simple
> machine builder possible, driven by tree-structured configuration.  That
> in turn makes it easier to make things configurable.  Which can be
> expected to lead to more configurability, when and where there's a need
> for it.
>
> All this can be done in nice, safe baby steps.  I don't need to come up
> with an all-singing machine description fit for a picky kernel before I
> can start doing something useful.
>
> Now, if you hand me such a configuration on a platter, I'd be a fool not
> to take it.  The catch: I need one for a PC.

I suspect these two goals may be contradictory. The PC machine is so hairy 
that you need a singing, dancing machine description to be able to describe 
it.

OTOH if what you really want to do is configure the host binding side of 
things, then as I've mentioned before, I see that as been somewhat separate 
from the actual machine creation, and trying to combine the two is probably a 
mistake. I really don't want users to have to hack the machine config just to 
change the name of an image file.

Paul
