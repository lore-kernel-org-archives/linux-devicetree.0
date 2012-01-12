From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: RFC: option to toggle dtc checks on and off
Date: Thu, 12 Jan 2012 10:14:50 +0000
Message-ID: <20120112101450.GO3226@page>
References: <20111028051525.GA7215@truffala.fritz.box>
 <20120109024129.GH5628@truffala.fritz.box>
 <E1RkFso-00007g-Ue@jdl.com>
 <20120111121941.GI4935@truffala.fritz.box>
 <20120111133812.GJ3226@page>
 <20120112031714.GQ4935@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120112031714.GQ4935-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 12, 2012 at 02:17:14PM +1100, David Gibson wrote:
> On Wed, Jan 11, 2012 at 01:38:12PM +0000, Jamie Iles wrote:
> > On Wed, Jan 11, 2012 at 11:19:41PM +1100, David Gibson wrote:
> > > On Mon, Jan 09, 2012 at 08:07:30AM -0600, Jon Loeliger wrote:
> > > > > Jon, I was hoping I'd get some comment on this patch eventually.
> > > > 
> > > > Sorry/ .
> > > > 
> > > > > On Fri, Oct 28, 2011 at 04:15:25PM +1100, David Gibson wrote:
> > > > > > Here is a draft patch which adds a -C option to dtc, allowing
> > > > > > individual semantic checks to be turned on and off.  It also allows
> > > > > > indivudual checks to be set as triggering either warnings or errors.
> > > > 
> > > > Turning checks on and off:  good.
> > > > 
> > > > > > I have a couple of concerns about it in its present form.  First, the
> > > > > > current syntax is that "-C -checkname" disables a check, "-C
> > > > > > checkname" turns a check on as a warning and "-C +checkname" turns it
> > > > > > on as an error.  I'm not convinced this is a great syntax.
> > > > 
> > > > Yeah, that's sub-obtimal.
> > > > What about using something like "-E checkname" and "-W checkname"?
> > > 
> > > Yeah, I though of that too.  Can't remeber why I didn't go that way.
> > > Gets a bit weird if you specify both -E foo and -W foo, but "last one
> > > wins" is probably still a reasonable way of deciding that.  Any
> > > thoughts for an option to turn a check off completely?
> > 
> > How about the way that GCC handles warnings: -Wcheckname to enable, 
> > -Wno-checkname to disable?
> 
> Perhaps.  What should the semantics of -Wno-foo be when "foo" is an
> error level check by default?

Yes, that does get a little messy, but we could just adopt the GCC 
convention in that certain things are errors and always will be.  For 
everything else, enable with -Wfoo, disable with -Wno-foo and add a 
-Werror that turns warnings into errors?

Jamie
