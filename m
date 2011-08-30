From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC PATCH] dtc: Add support for named constants
Date: Tue, 30 Aug 2011 09:37:40 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04B3279D55@HQMAIL01.nvidia.com>
References: <1314139400-31984-1-git-send-email-swarren@nvidia.com>
	<20110830042316.GH4254@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110830042316.GH4254-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Arnaud Lacombe <lacombar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

David Gibson wrote at Monday, August 29, 2011 10:23 PM:
> On Tue, Aug 23, 2011 at 04:43:20PM -0600, Stephen Warren wrote:
> > You may define constants as follows:
> >
> > /define/ $TWO 2;
> > /define/ $FOUR 4;
> > /define/ $OTHER $FOUR;
> >
> > And properties may use these values as follows:
> >
> > foo = <1 $TWO 3 $FOUR 5>;
...
> > Note 2: I'd prefer the syntax of /define/ to be:
> >
> > /define/ TWO 2;
> 
> Oh goodness, yes.  The dollar signs are revolting.
> 
> > but I assume that'd cause the lexing for DT_DEFINEREF to conflict with
> > that for DT_LABEL?
> 
> Nope, the final colon should distinguish DT_LABEL.  In dts-v1 C-like
> identifiers should be lexically distinct in most contexts.  This is
> not by accident.  They could be confused with node or property names,
> but that shouldn't cause trouble.

OK, I'll take a stab at that and see.

As background, I found the following thread from 2008:

http://lists.ozlabs.org/pipermail/devicetree-discuss/2008-September/000149.html

... where Jon Loeliger was working on much more extensive new syntax,
and it sounded like you had some patches at least for math expressions
in cells etc. The conversation seemed to die off after a few weeks. Did
anything come of that; is anyone else working on e.g. at least the math
expressions and defines part, even if not the scripting stuff?

I see that a little later, Jon pushed:

http://git.jdl.com/gitweb/?p=dtc.git;a=shortlog;h=refs/heads/testing

I'm mainly asking because if /any/ of that is something that's still
useful to pursue, I might want to align this patch with some of that so
as not to preclude any of that being ported to ToT.

Thanks.

-- 
nvpublic
