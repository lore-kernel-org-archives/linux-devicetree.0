From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: DTS language enhancements
Date: Tue, 7 Oct 2008 15:17:25 +1100
Message-ID: <20081007041725.GD19037@yookeroo.seuss>
References: <20081003043710.GH3002@yookeroo.seuss>
	<20081006170601.GA31967@ld0162-tx32.am.freescale.net>
	<20081007014103.GA23135@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081007014103.GA23135-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 07, 2008 at 12:41:03PM +1100, David Gibson wrote:
> On Mon, Oct 06, 2008 at 12:06:01PM -0500, Scott Wood wrote:
> > On Fri, Oct 03, 2008 at 02:37:10PM +1000, David Gibson wrote:
[snip]
> > We could simplify the lexing, and eliminate the lexical restricitons on
> > when we can expect a property or node name, by letting the parser glue
> > together property/node names when in the appropriate context.  Doing
> > otherwise seems like a layering violation.
> 
> I've considered this in the past, and experimented.  We really don't
> want to go there; attempting to achieve parsing sanity when the
> propnodename isn't recognized as a token is just horrible.

Oh, just remembered the more precise reason why this is the case.  By
the time we get to the parser, whitespace and comments have
disappeared entirely, which means they'd be ignored *in the midst* of
node property names under this proposal, which is just not nice.

It's technically possible to recognize whitespace at the parser level
instead, but it makes the grammar hideous.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
