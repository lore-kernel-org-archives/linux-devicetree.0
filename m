From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH V3] dtc: Add ability to delete nodes and properties
Date: Thu, 06 Sep 2012 07:53:48 -0500
Message-ID: <E1T9bae-0001JH-EF@jdl.com>
References: <1344401415-3214-1-git-send-email-swarren@wwwdotorg.org>
 <20120904000539.GH8526@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20120904000539.GH8526-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> On Tue, Aug 07, 2012 at 10:50:15PM -0600, Stephen Warren wrote:
> > From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > dtc currently allows the contents of properties to be changed, and the
> > contents of nodes to be added to. There are situations where removing
> > properties or nodes may be useful. This change implements the following
> > syntax to do that:
> > 
> >     / {
> >         /delete-property/ propname;
> >         /delete-node/ nodename;
> >     };
> > 
> > or:
> > 
> >     /delete-node/ &noderef;
> > 
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Sorry, I've taken forever to look at this.  I've had other things to
> work on, plus I've second guessed myself on this stuff about a million
> times.
> 
> I think I finally did pin down the chief thing that was making me
> antsy about the whole thing, which is that it introduces an order
> dependency where none existed before.  We already had the order
> dependency between tree fragments in the "stack of overlays" model,
> but we didn't previously have a dependency on the order of
> declarations within one fragment.
> 
> With that in mind, there are some details I would like to see cleaned
> up, mostly in the precise semantics of when duplicate names are
> detected.  But I'm happy enough to do that cleanup after the main
> patch is merged.
> 
> Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Applied!

jdl
