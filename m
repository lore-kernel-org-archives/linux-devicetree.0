From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: RFC: option to toggle dtc checks on and off
Date: Wed, 11 Jan 2012 23:19:41 +1100
Message-ID: <20120111121941.GI4935@truffala.fritz.box>
References: <20111028051525.GA7215@truffala.fritz.box>
 <20120109024129.GH5628@truffala.fritz.box>
 <E1RkFso-00007g-Ue@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1RkFso-00007g-Ue-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 09, 2012 at 08:07:30AM -0600, Jon Loeliger wrote:
> > Jon, I was hoping I'd get some comment on this patch eventually.
> 
> Sorry/ .
> 
> > On Fri, Oct 28, 2011 at 04:15:25PM +1100, David Gibson wrote:
> > > Here is a draft patch which adds a -C option to dtc, allowing
> > > individual semantic checks to be turned on and off.  It also allows
> > > indivudual checks to be set as triggering either warnings or errors.
> 
> Turning checks on and off:  good.
> 
> > > I have a couple of concerns about it in its present form.  First, the
> > > current syntax is that "-C -checkname" disables a check, "-C
> > > checkname" turns a check on as a warning and "-C +checkname" turns it
> > > on as an error.  I'm not convinced this is a great syntax.
> 
> Yeah, that's sub-obtimal.
> What about using something like "-E checkname" and "-W checkname"?

Yeah, I though of that too.  Can't remeber why I didn't go that way.
Gets a bit weird if you specify both -E foo and -W foo, but "last one
wins" is probably still a reasonable way of deciding that.  Any
thoughts for an option to turn a check off completely?

> > > Second, turning on a check will force on all prerequisite checks for
> > > it.  Turning a check off will disable all checks for which it is a
> > > prerequisite.  This seems necessary, since a check can't safely be
> > > executed without having first checked its prereqs, but this could have
> > > some very non-obvious effects from the command line.
> 
> Hmm...  That seems like maybe a small matter of documentation...?

I guess.  Might be worth printing a message for each check implicitly
enabled or disabled, too.

> And in which order do you apply the cmd line options for their implications?
> Last one takes precedence?

That was what I had in mind.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
