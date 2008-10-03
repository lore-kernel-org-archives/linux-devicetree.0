From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Fri, 3 Oct 2008 10:27:01 -0500
Message-ID: <20081003152700.GA9115@ld0162-tx32.am.freescale.net>
References: <1222460748-20127-8-git-send-email-jdl@jdl.com>
	<1222460748-20127-9-git-send-email-jdl@jdl.com>
	<20080930145537.GJ18313@secretlab.ca>
	<20081001034656.GF30810@yookeroo.seuss>
	<48E396A3.809@freescale.com>
	<20081002011800.GI25598@yookeroo.seuss>
	<20081002152242.GB22258@ld0162-tx32.am.freescale.net>
	<20081002161150.GA14351@yookeroo.seuss>
	<48E5036D.9040509@freescale.com>
	<20081003022424.GG3002@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081003022424.GG3002-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
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
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 03, 2008 at 12:24:24PM +1000, David Gibson wrote:
> > And if you want the number of somethings to be easily tweakable, you may  
> > need to do #include/#ifdef recursion.
> 
> Yes, we'd certainly need some sort of iteration operator in the
> expressions for this sort of thing.

OK, but now we're talking about something more complex than running it
through CPP with some character conversion.

A more powerful macro language is certainly an option, though I have a
personal preference for the semantic approach.

> >> If anything I think it's more powerful, because the macro
> >> boundaries can be anywhere, not only at the edges of particular
> >> semantic constructs.
> >
> > Is that useful outside the International Obfuscated DTC Contest?
> 
> Maybe.  I can see uses for both this style:
> 	mynodename@12345 NODE_CONTENTS_MACRO(x,y,z);
> and this style:
> 	NODE_MACRO(p,q,r);
> where the macro generates the name as well.
> 
> Both are trivially possible with macros, but would need different
> types of definition with a runtime system, which increases complexity.

You can do this in the proposed language by either defining a function
that takes the node name/unit address as a parameter, or by defining a
function that returns a set of properties.

-Scott
