From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/2] dtc: cpp co-existence: add support for #line
 directives
Date: Wed, 26 Sep 2012 18:53:34 +1000
Message-ID: <20120926085334.GE31993@truffula.fritz.box>
References: <1348527077-27471-1-git-send-email-swarren@wwwdotorg.org>
 <1348527077-27471-3-git-send-email-swarren@wwwdotorg.org>
 <20120926043459.GD31993@truffula.fritz.box>
 <50629968.9040800@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50629968.9040800-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 25, 2012 at 11:58:00PM -0600, Stephen Warren wrote:
> On 09/25/2012 10:34 PM, David Gibson wrote:
> > On Mon, Sep 24, 2012 at 04:51:17PM -0600, Stephen Warren wrote:
> >> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >> Line control directives of the following formats are supported:
> >>     #line LINE "FILE"
> >>     # LINE FILE [FLAGS]
> >>
> >> This allows dtc to consume the output of pre-processors, and to provide
> >> error messages that refer to the original filename, including taking
> >> into account any #include directives that the pre-processor may have
> >> performed.
> > 
> > I like the idea of handling line directives, whichever way we go with
> > the other cpp-related proposals.  The fact that these are
> > distinguished from a propnodename beginning with # only by the
> > following digits is more subtle than I'd ideally like, but I think
> > it's wirth it.
> > 
> > The only thing I would like to see change is to only recognize line
> > directives at the beginning of the line (in fact, preferably in column
> > 0 only).  Unfortunately that is going to mean some mucky flex work,
> > including a new start state, I expect.
> 
> That turns out to be exceedingly easy; just put ^ at the start of the
> regex (after the start state specification), and Flex takes care of
> everything:-)

Oh yeah, I forgot about ^ :).  I like it when things turn out easier
than expected :).

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
